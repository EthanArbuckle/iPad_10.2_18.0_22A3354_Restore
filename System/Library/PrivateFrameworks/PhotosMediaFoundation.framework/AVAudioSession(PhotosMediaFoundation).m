@implementation AVAudioSession(PhotosMediaFoundation)

- (uint64_t)setPhotosAudioSessionCategory:()PhotosMediaFoundation error:
{
  id *v6;
  id v7;
  uint64_t v8;

  if (a3 == 1)
  {
    v6 = (id *)MEMORY[0x24BDB1598];
  }
  else
  {
    if (a3 != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = (id *)MEMORY[0x24BDB15A8];
  }
  v7 = *v6;
LABEL_7:
  v8 = objc_msgSend(a1, "setCategory:error:", v7, a4);

  return v8;
}

- (uint64_t)photosAudioSessionCategory
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB1598]) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB15A8]))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
