from pydantic import BaseSettings, Extra, SecretStr


class Settings(BaseSettings):
    # All variables MUST have possibility to be overwritten by environment variables
    DB_DSN: SecretStr = SecretStr("")
    CI_COMMIT_SHA: str = "local"
    ENV: str = "local"
    DEBUG: bool = False
    PORT: int = 8000
    LOG_LEVEL: str = "INFO"

    class Config:
        case_sensitive = True
        extra = Extra.ignore


settings = Settings()
