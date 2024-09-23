@implementation PFXMedia

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  int v10;
  NSURL *v11;
  AVAsset *v12;
  id v13;
  THWMovieInfo *v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PFXMedia;
  -[PFXDrawable mapStartElementWithState:](&v27, "mapStartElementWithState:");
  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", objc_msgSend(v4, "valueForAttribute:", "src"), objc_msgSend(a3, "entryURI")), "stringByRemovingPercentEncoding");
  v7 = objc_msgSend(v4, "valueForAttribute:", "poster");
  v25 = v5;
  if (objc_msgSend(v7, "length"))
    v8 = objc_msgSend(v4, "valueForAttribute:", "loop", objc_msgSend(a3, "imageDataForUri:isSharable:", objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", v7, objc_msgSend(a3, "entryURI")), "stringByRemovingPercentEncoding"), 1));
  else
    v8 = objc_msgSend(v4, "valueForAttribute:", "loop", 0);
  v24 = objc_msgSend(v8, "isEqualToString:", CFSTR("loop"));
  v9 = objc_msgSend(objc_msgSend(v4, "valueForAttribute:", "controls"), "isEqualToString:", CFSTR("controls"));
  v10 = xmlStrEqual((const xmlChar *)objc_msgSend(v4, "xmlElementName"), (const xmlChar *)"audio");
  v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "archive"), "rootFolder"), "stringByAppendingPathComponent:", v6));
  v12 = +[AVAsset assetWithURL:](AVAsset, "assetWithURL:", v11);
  v13 = objc_msgSend(objc_alloc((Class)TSDMediaStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, 0, 0);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v13);
  v14 = -[THWMovieInfo initWithContext:geometry:style:movieRemoteURL:loadedAsset:]([THWMovieInfo alloc], "initWithContext:geometry:style:movieRemoteURL:loadedAsset:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"), v13, v11, v12);
  -[THWMovieInfo setProgressKitID:](v14, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v4, "xmlElementId")));
  -[THWMovieInfo setProgressKitSectionID:](v14, "setProgressKitSectionID:", objc_msgSend(a3, "nodeGUID"));

  -[THWMovieInfo setLoopOption:](v14, "setLoopOption:", v24);
  -[THWMovieInfo setPosterImageData:](v14, "setPosterImageData:", v23);
  if (v9)
    v15 = 1;
  else
    v15 = 2;
  if (v10)
    v16 = v15;
  else
    v16 = 0;
  -[THWMovieInfo setAudioOnly:](v14, "setAudioOnly:", v10 != 0);
  -[THWMovieInfo setControlStyle:](v14, "setControlStyle:", v16);
  -[THWMovieInfo setUrlForMPMPC:](v14, "setUrlForMPMPC:", v11);
  v17 = objc_msgSend(v4, "valueForAttribute:", "data-start");
  if (v17)
  {
    objc_msgSend(v17, "doubleValue");
    -[THWMovieInfo setStartTime:](v14, "setStartTime:");
  }
  v18 = objc_msgSend(v4, "valueForAttribute:", "data-end");
  if (v18)
  {
    objc_msgSend(v18, "doubleValue");
    -[THWMovieInfo setEndTime:](v14, "setEndTime:");
  }
  v19 = objc_msgSend(objc_msgSend(a3, "ancestorEntryWithElementName:", "object"), "valueForAttribute:", "title");
  if (objc_msgSend(v19, "length"))
  {
    v21 = -[THWMovieInfo accessibilityDescriptions](v14, "accessibilityDescriptions");
    if (!v21)
    {
      v21 = (id)objc_opt_new(NSMutableDictionary, v20);
      -[THWMovieInfo setAccessibilityDescriptions:](v14, "setAccessibilityDescriptions:", v21);

    }
    objc_msgSend(v21, "setObject:forKey:", v19, CFSTR("container"));
  }
  objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v14, v4);
  objc_msgSend(v25, "setResult:", v14);

  -[PFXDrawablePlacement mapEndElementWithState:](self->super.mPlacement, "mapEndElementWithState:", a3);
  return 0;
}

@end
