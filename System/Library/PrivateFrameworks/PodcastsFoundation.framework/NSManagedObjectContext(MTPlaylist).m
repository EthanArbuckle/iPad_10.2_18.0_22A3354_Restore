@implementation NSManagedObjectContext(MTPlaylist)

- (uint64_t)playlistForUuid:()MTPlaylist
{
  return objc_msgSend(a1, "objectForUuid:entityName:", a3, CFSTR("MTPlaylist"));
}

- (void)deletePlaylist:()MTPlaylist
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a3;
  objc_msgSend(v8, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__NSManagedObjectContext_MTPlaylist__deletePlaylist___block_invoke;
  v9[3] = &unk_1E54D0F78;
  v9[4] = a1;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(v8, "defaultSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "defaultSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "deleteObject:", v7);

  }
  objc_msgSend(a1, "deleteObject:", v8);

}

@end
