@implementation PFServerPosterPath

uint64_t __50__PFServerPosterPath_PBFUtilities__pbf_sha256Hash__block_invoke()
{
  return 1;
}

uint64_t __50__PFServerPosterPath_PBFUtilities__pbf_sha256Hash__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
