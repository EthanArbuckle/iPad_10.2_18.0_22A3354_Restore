@implementation IMUTITypes

+ (id)UTIByExtension:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:", CFSTR("mov"), CFSTR("m4v"), CFSTR("mp4"), CFSTR("mpv"), CFSTR("3gp"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("m4a"), CFSTR("mp3"), CFSTR("m4r"), CFSTR("aiff"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("pdf")) & 1) != 0)
  {
    v8 = CFSTR("com.adobe.pdf");
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("epub")) & 1) != 0)
  {
    v8 = CFSTR("public.epub");
  }
  else if ((objc_msgSend(v5, "containsObject:", v7) & 1) != 0)
  {
    v8 = CFSTR("public.movie");
  }
  else if (objc_msgSend(v6, "containsObject:", v7))
  {
    v8 = CFSTR("public.audio");
  }
  else
  {
    v8 = 0;
  }

  return (id)v8;
}

+ (id)UTIFromMIMEType:(id)a3
{
  void *v3;
  const __CFString *v4;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC570]) & 1) != 0)
  {
    v4 = CFSTR("com.adobe.pdf");
  }
  else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC4C8]) & 1) != 0)
  {
    v4 = CFSTR("public.epub");
  }
  else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
  {
    v4 = CFSTR("public.movie");
  }
  else if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC450]))
  {
    v4 = CFSTR("public.audio");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

@end
