id optionVariant(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("bokehVariant");
  v8[1] = CFSTR("kSBUIMagicWallpaperThumbnailNameKey");
  v9[0] = a1;
  v9[1] = a2;
  v8[2] = CFSTR("thumbnailImageName");
  v9[2] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

