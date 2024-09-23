@implementation PHCloudSharedAlbum(PhotosUICore)

- (id)px_debugDictionary
{
  void *v2;
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[7];
  _QWORD v19[8];

  v19[7] = *MEMORY[0x1E0C80C00];
  v17.receiver = a1;
  v17.super_class = (Class)&off_1EEBBE3F8;
  objc_msgSendSuper2(&v17, sel_px_debugDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = objc_msgSend(a1, "cloudAlbumSubtype");
  v5 = CFSTR("Family");
  if (v4 != 1)
    v5 = 0;
  if (v4)
    v6 = v5;
  else
    v6 = CFSTR("None");
  v18[0] = CFSTR("isOwned");
  if (objc_msgSend(a1, "isOwned"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v7;
  v19[0] = v8;
  v18[1] = CFSTR("isCloudMultipleContributorsEnabled");
  if (objc_msgSend(a1, "isCloudMultipleContributorsEnabled"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v9;
  v19[1] = v10;
  v19[2] = v6;
  v18[2] = CFSTR("cloudAlbumSubtype");
  v18[3] = CFSTR("cloudOwnerFirstName");
  objc_msgSend(a1, "cloudOwnerFirstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  v18[4] = CFSTR("cloudOwnerLastName");
  objc_msgSend(a1, "cloudOwnerLastName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v12;
  v18[5] = CFSTR("cloudOwnerFullName");
  objc_msgSend(a1, "cloudOwnerFullName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v13;
  v18[6] = CFSTR("cloudOwnerEmailKey");
  objc_msgSend(a1, "cloudOwnerEmailKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addEntriesFromDictionary:", v15);
  return v3;
}

@end
