@implementation ICStoreArtworkInfoBestArtworkMatchingSize

uint64_t __ICStoreArtworkInfoBestArtworkMatchingSize_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend(a2, "originalSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "originalSize");
  v10 = v9;
  v12 = v11;

  if (v6 < v10)
    return -1;
  if (v6 > v10)
    return 1;
  if (v8 >= v12)
    return v8 > v12;
  else
    return -1;
}

@end
