resource "aws_secretsmanager_secret" "jwt_secret" {
    name = "jwt_secret"
    description = "Secret que armazena chave para geração de token JWT"
    recovery_window_in_days = 0
}

variable "secrets_values" {
  default = {
    key = "um-valor-qualquer"
  }

  type = map(string)
}

resource "aws_secretsmanager_secret_version" "main" {
  secret_id     = aws_secretsmanager_secret.jwt_secret.id
  secret_string = jsonencode(var.secrets_values)
}