@implementation MPMediaItem

- (id)SAMPMediaItemRepresentation
{
  void *v3;
  unsigned __int16 v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyMediaType));
  v4 = (unsigned __int16)objc_msgSend(v3, "integerValue");

  if ((v4 & 0x402) != 0)
  {
    v5 = (objc_class *)SAMPPodcast;
  }
  else
  {
    if ((v4 & 4) == 0)
    {
      v6 = objc_alloc_init((Class)SAMPSong);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyGenre));
      objc_msgSend(v6, "setGenre:", v7);

      goto LABEL_7;
    }
    v5 = (objc_class *)SAMPAudiobook;
  }
  v6 = objc_alloc_init(v5);
LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyArtist));
  objc_msgSend(v6, "setArtist:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertySortArtist));
  objc_msgSend(v6, "setSortArtist:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyAlbumTitle));
  objc_msgSend(v6, "setAlbum:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertySortAlbumTitle));
  objc_msgSend(v6, "setSortAlbum:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyTitle));
  objc_msgSend(v6, "setTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertySortTitle));
  objc_msgSend(v6, "setSortTitle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyPersistentID));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("x-sampmeditem://device/%lld"), objc_msgSend(v14, "longLongValue")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v15));
  objc_msgSend(v6, "setIdentifier:", v16);

  if ((v4 & 0x140E) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));

    v19 = objc_alloc_init((Class)SACalendar);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyLastPlayedDate));
    objc_msgSend(v19, "setDate:", v20);

    objc_msgSend(v19, "setTimeZoneId:", v18);
    v21 = objc_alloc_init((Class)SAMPPlaybackInfo);
    objc_msgSend(v21, "setLastPlayedDate:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyBookmarkTime));
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v21, "setPlaybackPositionMillis:", (uint64_t)(v23 * 1000.0));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyRememberBookmarkTime));
    objc_msgSend(v21, "setRememberPlaybackPosition:", objc_msgSend(v24, "BOOLValue"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyPlayCount));
    objc_msgSend(v21, "setPlays:", objc_msgSend(v25, "unsignedIntegerValue"));

    objc_msgSend(v6, "setPlaybackInfo:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyDateAdded));
    if (v26)
    {
      v27 = objc_alloc_init((Class)SACalendar);
      objc_msgSend(v27, "setDate:", v26);
      objc_msgSend(v27, "setTimeZoneId:", v18);
      objc_msgSend(v6, "setDateAdded:", v27);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStoreDatePurchased));
    if (v28)
    {
      v29 = objc_alloc_init((Class)SACalendar);
      objc_msgSend(v29, "setDate:", v28);
      objc_msgSend(v29, "setTimeZoneId:", v18);
      objc_msgSend(v6, "setDatePurchased:", v29);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyReleaseDate));
    if (v30)
    {
      v31 = objc_alloc_init((Class)SACalendar);
      objc_msgSend(v31, "setDate:", v30);
      objc_msgSend(v31, "setTimeZoneId:", v18);
      v32 = objc_alloc_init((Class)SAMPReleaseInfo);
      objc_msgSend(v32, "setReleaseDate:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyYear));
      objc_msgSend(v32, "setReleaseYear:", objc_msgSend(v33, "unsignedIntegerValue"));

      objc_msgSend(v6, "setReleaseInfo:", v32);
    }

  }
  return v6;
}

@end
