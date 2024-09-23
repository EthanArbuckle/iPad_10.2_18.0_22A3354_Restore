@implementation MTLinkPresentationMetadataUtil

+ (id)linkMetadataForDataSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  UIImage *v13;
  NSData *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSData *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString **v29;
  void *v30;
  unint64_t v32;
  UIImage *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;

  v4 = a3;
  v5 = objc_alloc_init((Class)LPLinkMetadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareURL"));
  objc_msgSend(v5, "setURL:", v6);

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareImage"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareImageProvider"));
  if (v7 | v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_storefrontIdentifierFromPreviewUrl:", v9));

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeStorefront"));

    }
    v12 = objc_alloc((Class)LPImage);
    v34 = v8;
    v36 = (void *)v10;
    v32 = v7;
    if (!v8 || v7)
    {
      v21 = UIImagePNGRepresentation((UIImage *)v7);
      v16 = (id)objc_claimAutoreleasedReturnValue(v21);
      v19 = objc_msgSend(v12, "initWithData:MIMEType:", v16, CFSTR("image/png"));
    }
    else
    {
      v13 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPodcastArtwork](UIImage, "defaultPodcastArtwork"));
      v14 = UIImagePNGRepresentation(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_msgSend(v12, "initWithData:MIMEType:", v15, CFSTR("image/png"));

      v17 = objc_alloc((Class)LPImage);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareImageProvider"));
      v19 = objc_msgSend(v17, "initWithItemProvider:properties:placeholderImage:", v18, 0, v16);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareEpisodeTitle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharePodcastTitle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shareProvider"));
    if (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", objc_msgSend(v22, "longLongValue")))
    {

      v22 = 0;
    }
    if (objc_msgSend(v4, "currentShareMode", v32, v34) == (id)2 || objc_msgSend(v4, "currentShareMode") == (id)4)
    {
      v26 = objc_alloc_init((Class)LPiTunesMediaPodcastEpisodeMetadata);
      objc_msgSend(v26, "setEpisodeName:", v23);
      objc_msgSend(v26, "setPodcastName:", v24);
      objc_msgSend(v26, "setArtist:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pubDate"));
      objc_msgSend(v26, "setReleaseDate:", v27);

      objc_msgSend(v26, "setArtwork:", v19);
      v28 = v36;
      objc_msgSend(v26, "setStoreFrontIdentifier:", v36);
      objc_msgSend(v26, "setStoreIdentifier:", v22);
      v38 = CFSTR("anonymousDownload");
      v29 = &v38;
    }
    else
    {
      v26 = objc_alloc_init((Class)LPiTunesMediaPodcastMetadata);
      objc_msgSend(v26, "setName:", v24);
      objc_msgSend(v26, "setArtist:", v25);
      objc_msgSend(v26, "setArtwork:", v19);
      v28 = v36;
      objc_msgSend(v26, "setStoreFrontIdentifier:", v36);
      objc_msgSend(v26, "setStoreIdentifier:", v22);
      v37 = CFSTR("anonymousDownload");
      v29 = &v37;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 1));
    objc_msgSend(v26, "setOffers:", v30);

    objc_msgSend(v5, "setSpecialization:", v26);
    v20 = v5;

    v7 = (unint64_t)v33;
    v8 = v35;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)_storefrontIdentifierFromPreviewUrl:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v3, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathComponents"));

    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTiTunesMediaStorefrontMappings storefrontIdentifierFromCountryCode:](MTiTunesMediaStorefrontMappings, "storefrontIdentifierFromCountryCode:", v8));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
