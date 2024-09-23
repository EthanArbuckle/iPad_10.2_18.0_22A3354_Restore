@implementation OCDEncryptedReader

- (void)useUnencryptedDocument
{
  OCCDecryptor *mDecryptor;

  mDecryptor = self->mDecryptor;
  if (mDecryptor)
  {
    if (!-[OCCDecryptor decrypt](mDecryptor, "decrypt"))
      +[TCMessageException raise:](TCMessageException, "raise:", TCDecryptionFailedMessage);
    -[OCDEncryptedReader restartReaderToUseDecryptedDocument](self, "restartReaderToUseDecryptedDocument");
  }
}

- (BOOL)retainDecryptorWithErrorCode:(int *)a3
{
  *a3 = 8012;
  return 0;
}

- (OCCDecryptor)decryptor
{
  return self->mDecryptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDecryptor, 0);
}

- (id)defaultPassphrase
{
  return 0;
}

@end
