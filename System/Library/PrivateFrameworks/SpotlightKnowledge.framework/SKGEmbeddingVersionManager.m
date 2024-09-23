@implementation SKGEmbeddingVersionManager

+ (BOOL)embeddingsSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEB00C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceSupportsEmbedding");

  return v3;
}

+ (id)currentEmbeddingVersion
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BEB00C0], "version"));
}

+ (id)embeddingVersionDataFromTextVersion:(id)a3 returningError:(id *)a4
{
  return +[SKGProcessor embeddingVersionDataWithVersion:](SKGProcessor, "embeddingVersionDataWithVersion:", a3, a4);
}

+ (id)currentEmbeddingVersionDataReturningError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "currentEmbeddingVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "embeddingVersionDataFromTextVersion:returningError:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
