@implementation RadioManagedStation

+ (id)defaultPropertiesToFetch
{
  return &unk_24CA35700;
}

- (int64_t)adamID
{
  void *v3;
  int64_t v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("adam_id"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("adam_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("adam_id"));
  return v4;
}

- (NSData)adData
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("ad_data"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("ad_data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("ad_data"));
  return (NSData *)v3;
}

- (id)additionalReferencedTrackDescriptors
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("additional_referenced_track_descriptors_data"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("additional_referenced_track_descriptors_data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("additional_referenced_track_descriptors_data"));
  return v3;
}

- (NSURL)artworkURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("artwork_url"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("artwork_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("artwork_url"));
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "scheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v3, 0);
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v7;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSData)artworkURLData
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("artwork_url_data"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("artwork_url_data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("artwork_url_data"));
  return (NSData *)v3;
}

- (NSString)coreSeedName
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("core_seed_name"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("core_seed_name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("core_seed_name"));
  return (NSString *)v3;
}

- (NSDictionary)debugDictionary
{
  void *v3;
  void *v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("debug_dictionary"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("debug_dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("debug_dictionary"));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSArray)editableFields
{
  void *v3;
  void *v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("editable_fields"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("editable_fields"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("editable_fields"));
  return (NSArray *)v4;
}

- (BOOL)editEnabled
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("edit_enabled"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("edit_enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("edit_enabled"));
  return v4;
}

- (id)feedbackDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RadioManagedStation dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[RadioManagedStation debugDictionary](self, "debugDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("debug-dict"));
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (BOOL)hasSkipRules
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("has_skip_rules"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("has_skip_rules"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("has_skip_rules"));
  return v4;
}

- (unint64_t)impressionThreshold
{
  void *v3;
  unint64_t v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("impression_threshold"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("impression_threshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("impression_threshold"));
  return v4;
}

- (BOOL)isExplicit
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("is_explicit"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("is_explicit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("is_explicit"));
  return v4;
}

- (BOOL)isFeatured
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("is_featured"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("is_featured"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("is_featured"));
  return v4;
}

- (BOOL)isGatewayVideoAdEnabled
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("is_gateway_video_ad_enabled"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("is_gateway_video_ad_enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("is_gateway_video_ad_enabled"));
  return v4;
}

- (BOOL)isPremiumPlacement
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("is_premium_placement"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("is_premium_placement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("is_premium_placement"));
  return v4;
}

- (BOOL)isPreview
{
  if (-[RadioManagedStation stationID](self, "stationID") || -[RadioManagedStation isFeatured](self, "isFeatured"))
    return 0;
  else
    return !-[RadioManagedStation isSponsored](self, "isSponsored");
}

- (BOOL)isPreviewOnly
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("is_preview_only"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("is_preview_only"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("is_preview_only"));
  return v4;
}

- (BOOL)isShared
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("is_shared"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("is_shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("is_shared"));
  return v4;
}

- (BOOL)isSharingEnabled
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sharing_enabled"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sharing_enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sharing_enabled"));
  return v4;
}

- (BOOL)isSponsored
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("is_sponsored"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("is_sponsored"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("is_sponsored"));
  return v4;
}

- (BOOL)isSubscribed
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("is_subscribed"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("is_subscribed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("is_subscribed"));
  return v4;
}

- (BOOL)likesEnabled
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("likes_enabled"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("likes_enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("likes_enabled"));
  return v4;
}

- (NSString)name
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("name"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("name"));
  return (NSString *)v3;
}

- (int64_t)persistentID
{
  void *v3;
  int64_t v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("persistent_id"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("persistent_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("persistent_id"));
  return v4;
}

- (BOOL)requiresSubscription
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("requires_subscription"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("requires_subscription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("requires_subscription"));
  return v4;
}

- (NSArray)seedTracks
{
  void *v3;
  void *v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("seed_tracks"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("seed_tracks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("seed_tracks"));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setAdamID:(int64_t)a3
{
  void *v5;

  if (-[RadioManagedStation adamID](self, "adamID") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("adam_id"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("adam_id"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("adam_id"));
  }
}

- (void)setAdData:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation adData](self, "adData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToData:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ad_data"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("ad_data"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ad_data"));
  }

}

- (void)setArtworkURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("artwork_url"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("artwork_url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("artwork_url"));
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("artwork_url"));
    objc_msgSend(v7, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("artwork_url"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("artwork_url"));
  }

}

- (void)setArtworkURLData:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation artworkURLData](self, "artworkURLData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToData:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("artwork_url_data"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("artwork_url_data"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("artwork_url_data"));
  }

}

- (void)setCoreSeedName:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation coreSeedName](self, "coreSeedName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("core_seed_name"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("core_seed_name"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("core_seed_name"));
  }

}

- (void)setDebugDictionary:(id)a3
{
  id v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    v7 = 0;
  }
  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("debug_dictionary"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("debug_dictionary"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("debug_dictionary"));
  if (!objc_msgSend(v4, "length"))
  {

    v4 = 0;
    v6 = 0;
    if (!v7)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v4 && v7 && v4 != v7)
  {
    v5 = objc_msgSend(v4, "isEqualToData:", v7);
    v6 = v4;
    if ((v5 & 1) != 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v6 = v7;
  if (v4 != v7)
  {
LABEL_12:
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("debug_dictionary"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("debug_dictionary"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("debug_dictionary"));
    v6 = v4;
  }
LABEL_13:

}

- (void)setEditEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation editEnabled](self, "editEnabled") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("edit_enabled"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("edit_enabled"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("edit_enabled"));
  }
}

- (void)setEditableFields:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "componentsJoinedByString:", CFSTR(","));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("editable_fields"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("editable_fields"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("editable_fields"));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("editable_fields"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("editable_fields"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("editable_fields"));
  }

}

- (void)setFeatured:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isFeatured](self, "isFeatured") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("is_featured"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("is_featured"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("is_featured"));
  }
}

- (void)setGatewayVideoAdEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isGatewayVideoAdEnabled](self, "isGatewayVideoAdEnabled") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("is_gateway_video_ad_enabled"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("is_gateway_video_ad_enabled"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("is_gateway_video_ad_enabled"));
  }
}

- (void)setHasSkipRules:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation hasSkipRules](self, "hasSkipRules") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("has_skip_rules"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("has_skip_rules"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("has_skip_rules"));
  }
}

- (void)setImpressionThreshold:(unint64_t)a3
{
  void *v5;

  if (-[RadioManagedStation impressionThreshold](self, "impressionThreshold") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("impression_threshold"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("impression_threshold"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("impression_threshold"));
  }
}

- (void)setIsExplicit:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isExplicit](self, "isExplicit") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("is_explicit"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("is_explicit"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("is_explicit"));
  }
}

- (void)setLikesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation likesEnabled](self, "likesEnabled") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("likes_enabled"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("likes_enabled"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("likes_enabled"));
  }
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation name](self, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("name"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
  }

}

- (void)setPersistentID:(int64_t)a3
{
  void *v5;

  if (-[RadioManagedStation persistentID](self, "persistentID") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("persistent_id"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("persistent_id"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("persistent_id"));
  }
}

- (void)setPremiumPlacement:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isPremiumPlacement](self, "isPremiumPlacement") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("is_premium_placement"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("is_premium_placement"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("is_premium_placement"));
  }
}

- (void)setPreviewOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isPreviewOnly](self, "isPreviewOnly") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("is_preview_only"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("is_preview_only"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("is_preview_only"));
  }
}

- (void)setRequiresSubscription:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation requiresSubscription](self, "requiresSubscription") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("requires_subscription"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("requires_subscription"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("requires_subscription"));
  }
}

- (void)setSeedTracks:(id)a3
{
  id v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    v7 = 0;
  }
  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("seed_tracks"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("seed_tracks"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("seed_tracks"));
  if (!objc_msgSend(v4, "length"))
  {

    v4 = 0;
    v6 = 0;
    if (!v7)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v4 && v7 && v4 != v7)
  {
    v5 = objc_msgSend(v4, "isEqualToData:", v7);
    v6 = v4;
    if ((v5 & 1) != 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v6 = v7;
  if (v4 != v7)
  {
LABEL_12:
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("seed_tracks"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("seed_tracks"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("seed_tracks"));
    v6 = v4;
  }
LABEL_13:

}

- (void)setShared:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isShared](self, "isShared") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("is_shared"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("is_shared"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("is_shared"));
  }
}

- (void)setSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isSharingEnabled](self, "isSharingEnabled") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sharing_enabled"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("sharing_enabled"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sharing_enabled"));
  }
}

- (void)setShareToken:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation shareToken](self, "shareToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("share_token"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("share_token"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("share_token"));
  }

}

- (void)setSkipEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation skipEnabled](self, "skipEnabled") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("skip_enabled"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("skip_enabled"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("skip_enabled"));
  }
}

- (void)setSkipFrequency:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (-[RadioManagedStation skipFrequency](self, "skipFrequency") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("skip_frequency"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("skip_frequency"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("skip_frequency"));
  }
}

- (void)setSkipIdentifier:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation skipIdentifier](self, "skipIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("skip_identifier"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("skip_identifier"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("skip_identifier"));
  }

}

- (void)setSkipInterval:(double)a3
{
  double v5;
  void *v6;

  -[RadioManagedStation skipInterval](self, "skipInterval");
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("skip_interval"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("skip_interval"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("skip_interval"));
  }
}

- (void)setSkipTimestamps:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("skip_timestamps"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("skip_timestamps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("skip_timestamps"));
  if (!v9)
  {
    v6 = 0;
    v8 = 0;
    if (!v4)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v9, 200, 0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5 && v4 != (void *)v5)
  {
    v7 = objc_msgSend(v4, "isEqualToData:", v5);
    v8 = v6;
    if ((v7 & 1) != 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v8 = v4;
  if (v4 != (void *)v5)
  {
LABEL_10:
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("skip_timestamps"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("skip_timestamps"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("skip_timestamps"));
    v8 = v6;
  }
LABEL_11:

}

- (void)setSongMixType:(int64_t)a3
{
  void *v5;

  if (-[RadioManagedStation songMixType](self, "songMixType") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("song_mix_type"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("song_mix_type"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("song_mix_type"));
  }
}

- (void)setSortOrder:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (-[RadioManagedStation sortOrder](self, "sortOrder") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sort_order"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("sort_order"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sort_order"));
  }
}

- (void)setSponsored:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isSponsored](self, "isSponsored") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("is_sponsored"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("is_sponsored"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("is_sponsored"));
  }
}

- (void)setStationDescription:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation stationDescription](self, "stationDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("station_description"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("station_description"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("station_description"));
  }

}

- (void)setStationID:(int64_t)a3
{
  void *v5;

  if (-[RadioManagedStation stationID](self, "stationID") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("station_id"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("station_id"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("station_id"));
  }
}

- (void)setStationHash:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation stationHash](self, "stationHash");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("station_hash"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("station_hash"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("station_hash"));
  }

}

- (void)setStationStringID:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RadioManagedStation stationStringID](self, "stationStringID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("station_string_id"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("station_string_id"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("station_string_id"));
  }

}

- (void)setStreamURL:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("stream_url"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("stream_url"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("stream_url"));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stream_url"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("stream_url"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stream_url"));
  }

}

- (void)setStreamCertificateURL:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("stream_certificate_url"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("stream_sertificate_url"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("stream_certificate_url"));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stream_certificate_url"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("stream_certificate_url"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stream_certificate_url"));
  }

}

- (void)setStreamKeyURL:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("stream_key_url"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("stream_key_url"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("stream_key_url"));
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stream_key_url"));
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("stream_key_url"));
    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stream_key_url"));
  }

}

- (void)setSubscribed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation isSubscribed](self, "isSubscribed") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("is_subscribed"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("is_subscribed"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("is_subscribed"));
  }
}

- (void)setSubscriberCount:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (-[RadioManagedStation subscriberCount](self, "subscriberCount") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listeners"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("listeners"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listeners"));
  }
}

- (void)setVirtualPlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[RadioManagedStation virtualPlayEnabled](self, "virtualPlayEnabled") != a3)
  {
    -[RadioManagedStation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("virtual_play_enabled"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioManagedStation setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("virtual_play_enabled"));

    -[RadioManagedStation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("virtual_play_enabled"));
  }
}

- (NSString)shareToken
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("share_token"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("share_token"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("share_token"));
  return (NSString *)v3;
}

- (BOOL)skipEnabled
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("skip_enabled"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("skip_enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("skip_enabled"));
  return v4;
}

- (int)skipFrequency
{
  void *v3;
  int v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("skip_frequency"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("skip_frequency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("skip_frequency"));
  return v4;
}

- (NSString)skipIdentifier
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("skip_identifier"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("skip_identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("skip_identifier"));
  return (NSString *)v3;
}

- (double)skipInterval
{
  void *v3;
  double v4;
  double v5;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("skip_interval"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("skip_interval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("skip_interval"));
  return v5;
}

- (NSArray)skipTimestamps
{
  void *v3;
  void *v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("skip_timestamps"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("skip_timestamps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("skip_timestamps"));
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (int64_t)songMixType
{
  void *v3;
  int64_t v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("song_mix_type"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("song_mix_type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("song_mix_type"));
  return v4;
}

- (int)sortOrder
{
  void *v3;
  int v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sort_order"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sort_order"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sort_order"));
  return v4;
}

- (NSString)stationDescription
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("station_description"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("station_description"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("station_description"));
  return (NSString *)v3;
}

- (NSString)stationHash
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("station_hash"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("station_hash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("station_hash"));
  return (NSString *)v3;
}

- (int64_t)stationID
{
  void *v3;
  int64_t v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("station_id"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("station_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("station_id"));
  return v4;
}

- (NSString)stationStringID
{
  void *v3;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("station_string_id"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("station_string_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("station_string_id"));
  return (NSString *)v3;
}

- (NSURL)streamURL
{
  void *v3;
  void *v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("stream_url"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("stream_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("stream_url"));
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (id)streamCertificateURL
{
  void *v3;
  void *v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("stream_certificate_url"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("stream_sertificate_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("stream_certificate_url"));
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)streamKeyURL
{
  void *v3;
  void *v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("stream_key_url"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("stream_key_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("stream_key_url"));
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)subscriberCount
{
  void *v3;
  int v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("listeners"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("listeners"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("listeners"));
  return v4;
}

- (BOOL)virtualPlayEnabled
{
  void *v3;
  char v4;

  -[RadioManagedStation willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("virtual_play_enabled"));
  -[RadioManagedStation primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("virtual_play_enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[RadioManagedStation didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("virtual_play_enabled"));
  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (-[RadioManagedStation stationID](self, "stationID"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[RadioManagedStation stationID](self, "stationID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("station-id"));

  }
  -[RadioManagedStation stationHash](self, "stationHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RadioManagedStation stationHash](self, "stationHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("station-hash"));

  }
  -[RadioManagedStation stationDescription](self, "stationDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RadioManagedStation stationDescription](self, "stationDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("description"));

  }
  -[RadioManagedStation name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RadioManagedStation name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("name"));

  }
  if (-[RadioManagedStation adamID](self, "adamID"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[RadioManagedStation adamID](self, "adamID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("adam-id"));

  }
  if (-[RadioManagedStation songMixType](self, "songMixType"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[RadioManagedStation songMixType](self, "songMixType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("mix-type"));

  }
  -[RadioManagedStation seedTracks](self, "seedTracks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[RadioManagedStation seedTracks](self, "seedTracks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("seeds"));

  }
  return (NSDictionary *)v3;
}

@end
