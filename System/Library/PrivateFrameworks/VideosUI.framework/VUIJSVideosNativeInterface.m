@implementation VUIJSVideosNativeInterface

- (void)setLocDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithJSDictionary:", v3);

}

- (id)locStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)locStringForKeyWithCounts:(id)a3 :(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:withCounts:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)generateHash:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "numberWithUnsignedLong:", crc32(0, (const Bytef *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
