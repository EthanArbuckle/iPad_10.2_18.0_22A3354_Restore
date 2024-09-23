@implementation GEOAnnouncement

- (BOOL)showAnnouncementIfFlyoverWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAnnouncement buttonOneAppURI](self, "buttonOneAppURI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v5));

    v7 = objc_msgSend(v6, "scanString:intoString:", CFSTR("flyover:"), 0);
    if (v7)
    {
      v17 = 0;
      if (objc_msgSend(v6, "scanUnsignedLongLong:", &v17))
      {
        v8 = objc_alloc((Class)MKMapItemIdentifier);
        v9 = objc_msgSend(v8, "initWithMUID:resultProviderID:coordinate:", v17, 0, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
          v18 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForIdentifiers:traits:", v11, 0));

          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100C59484;
          v14[3] = &unk_1011DA980;
          v14[4] = self;
          v15 = v4;
          v16 = v17;
          objc_msgSend(v12, "submitWithHandler:networkActivity:", v14, 0);

        }
      }
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

@end
