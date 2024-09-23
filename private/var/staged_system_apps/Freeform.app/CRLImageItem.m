@implementation CRLImageItem

- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v15;
  double v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id v49;
  double v50;
  double v51;
  double v52;
  objc_super v53;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageItem maskInfo](self, "maskInfo"));
  if (v11)
  {
    -[CRLBoardItem visibleBoundsForPositioning](self, "visibleBoundsForPositioning");
    if (v12 != width || v13 != height)
    {
      v15 = v13;
      if (v12 <= 0.0)
      {
        v16 = 0.0;
        if (width != 0.0)
        {
          v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125C6A8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E31F0C();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125C6C8);
          v18 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DEA91C(v18, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 122, 0, "Desired size is an impossible multiple of current size.");

        }
      }
      else
      {
        v16 = width / v12;
      }
      if (v15 <= 0.0)
      {
        v21 = 0.0;
        if (height != 0.0)
        {
          v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125C6E8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E31E8C();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125C708);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DEA91C(v23, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 128, 0, "Desired size is an impossible multiple of current size.");

        }
      }
      else
      {
        v21 = height / v15;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
      v27 = objc_msgSend(v26, "mutableCopy");

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
      objc_msgSend(v28, "size");
      v30 = v16 * v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
      objc_msgSend(v31, "size");
      objc_msgSend(v27, "setSize:", v30, v21 * v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
      objc_msgSend(v33, "position");
      v35 = v16 * v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
      objc_msgSend(v36, "position");
      objc_msgSend(v27, "setPosition:", v35, v21 * v37);

      objc_msgSend(v11, "setGeometry:", v27);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase geometry](self, "geometry"));
      v39 = objc_msgSend(v38, "mutableCopy");

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase geometry](self, "geometry"));
      objc_msgSend(v40, "size");
      v42 = v16 * v41;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase geometry](self, "geometry"));
      objc_msgSend(v43, "size");
      objc_msgSend(v39, "setSize:", v42, v21 * v44);

      -[CRLBoardItemBase setGeometry:](self, "setGeometry:", v39);
    }
    -[CRLBoardItem visibleBoundsForPositioning](self, "visibleBoundsForPositioning");
    v47 = v46;
    if (v46 != x || v45 != y)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase geometry](self, "geometry"));
      v49 = objc_msgSend(v48, "mutableCopy");

      v50 = sub_1000603B8(x, y, v47);
      objc_msgSend(v49, "position");
      objc_msgSend(v49, "setPosition:", sub_1000603D0(v51, v52, v50));
      -[CRLBoardItemBase setGeometry:](self, "setGeometry:", v49);

    }
  }
  else
  {
    v53.receiver = self;
    v53.super_class = (Class)_TtC8Freeform12CRLImageItem;
    -[CRLBoardItem crl_onBoard:moveItemToPosition:size:](&v53, "crl_onBoard:moveItemToPosition:size:", v10, x, y, width, height);
  }

}

- (_TtC8Freeform8CRLAsset)_imageAssetAsData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform12CRLImageItem__imageAssetAsData));
}

- (void)set_imageAssetAsData:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform12CRLImageItem__imageAssetAsData);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform12CRLImageItem__imageAssetAsData) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform8CRLAsset)imageAssetPayload
{
  _TtC8Freeform12CRLImageItem *v2;
  Class v3;

  v2 = self;
  v3 = sub_1008CAD08();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (_TtC8Freeform8CRLAsset)_thumbnailAssetAsData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform12CRLImageItem__thumbnailAssetAsData));
}

- (void)set_thumbnailAssetAsData:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform12CRLImageItem__thumbnailAssetAsData);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform12CRLImageItem__thumbnailAssetAsData) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform8CRLAsset)thumbnailAssetPayload
{
  _TtC8Freeform12CRLImageItem *v2;
  char *v3;

  v2 = self;
  v3 = sub_1008CB2D4();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (CGSize)mediaRawPixelSize
{
  _TtC8Freeform12CRLImageItem *v2;
  Class v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v2 = self;
  v3 = sub_1008CAD08();
  v4 = objc_msgSend((id)objc_opt_self(CRLImageProviderPool), "sharedPool");
  v5 = objc_msgSend(v4, "providerForAsset:shouldValidate:", v3, 1);

  objc_msgSend(v5, "naturalSize");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setAssetMediaWithMedia:(id)a3 thumbnailData:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform12CRLImageItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1008CBD68((uint64_t)v6, (uint64_t)a4);

}

- (CRLBezierPath)tracedPath
{
  _TtC8Freeform12CRLImageItem *v2;
  id v3;

  v2 = self;
  v3 = sub_1008CC5A0();

  return (CRLBezierPath *)v3;
}

- (CRLMaskInfo)maskInfo
{
  _TtC8Freeform12CRLImageItem *v2;
  CRLMaskInfo *v3;

  v2 = self;
  v3 = (CRLMaskInfo *)(id)sub_1008D2EB8();

  return v3;
}

- (void)setMaskInfo:(id)a3
{
  _TtC8Freeform12CRLImageItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1008D3420(a3);

}

- (id)defaultMaskInfo
{
  _TtC8Freeform12CRLImageItem *v2;
  id v3;

  v2 = self;
  v3 = sub_1008CC750();

  return v3;
}

- (BOOL)maskCanBeReset
{
  _TtC8Freeform12CRLImageItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1008CC9B8();

  return v3 & 1;
}

- (BOOL)isBackgroundRemoved
{
  _TtC8Freeform12CRLImageItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1008CCD0C();

  return v3 & 1;
}

- (void)setIsBackgroundRemoved:(BOOL)a3
{
  _TtC8Freeform12CRLImageItem *v4;

  v4 = self;
  sub_1008CCE48(a3);

}

- (BOOL)isSpatial
{
  _TtC8Freeform12CRLImageItem *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1008CD154();

  return v3 & 1;
}

- (BOOL)isOriginalAspectRatio
{
  _TtC8Freeform12CRLImageItem *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1008CD2E0();

  return v3;
}

- (BOOL)shouldDisplayAsSpatial
{
  _TtC8Freeform12CRLImageItem *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1008CD578();

  return v3;
}

- (id)commandToResetMask
{
  _TtC8Freeform12CRLImageItem *v2;
  id v3;

  v2 = self;
  v3 = sub_1008CD7D4();

  return v3;
}

- (BOOL)maskMatchesImageGeometryWithIgnoreRoundedCorners:(BOOL)a3
{
  _TtC8Freeform12CRLImageItem *v4;
  BOOL v5;

  v4 = self;
  v5 = sub_1008CDCC8(a3);

  return v5;
}

- (CRLCanvasInfoGeometry)geometryWithMask
{
  _TtC8Freeform12CRLImageItem *v2;
  id v3;

  v2 = self;
  v3 = sub_1008CDEDC();

  return (CRLCanvasInfoGeometry *)v3;
}

- (BOOL)isPDF
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC8Freeform12CRLImageItem *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSString v11;
  unsigned __int8 v12;
  uint64_t v14;

  v3 = type metadata accessor for UTType(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = sub_1008CA0F8();
  if (v8)
  {
    v9 = v8;
    v10 = static UTType.pdf.getter();
    UTType.identifier.getter(v10);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v11 = String._bridgeToObjectiveC()();
    v12 = objc_msgSend(v9, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v11, 0, swift_bridgeObjectRelease().n128_f64[0]);

  }
  else
  {

    return 0;
  }
  return v12;
}

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  _TtC8Freeform12CRLImageItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1008CE7B8();

  return v3 & 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  _TtC8Freeform12CRLImageItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1008CEA88();

  return v3 & 1;
}

- (void)takePropertiesFromReplacedBoardItem:(id)a3
{
  _QWORD *v4;
  _TtC8Freeform12CRLImageItem *v5;

  v4 = a3;
  v5 = self;
  sub_1008CECF4(v4);

}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (NSString)previewTooltip
{
  uint64_t v2;
  NSString v3;

  sub_1008D3A48();
  if (v2)
  {
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013F8B38, off_101229900);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013F8B30, off_101229908);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013F8B28, off_1012298F0);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4
{
  double height;
  double width;
  id v7;
  _TtC8Freeform12CRLImageItem *v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = self;
  sub_1008CF03C((uint64_t)v7, width, height);

}

+ (void)adjustIncomingWithNewImageGeometry:(id)a3 newMaskGeometry:(id)a4 newImageData:(id)a5 targetImageGeometry:(id)a6 targetMaskGeometry:(id)a7 assetOwner:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  swift_getObjCClassMetadata(a1);
  swift_getObjectType(a8);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  swift_unknownObjectRetain(a8);
  sub_1008D2AD0(v14, v15, (uint64_t)v16, v17, a7, (uint64_t)a8);

  swift_unknownObjectRelease(a8);
}

- (float)roundedCornerAmount
{
  _TtC8Freeform12CRLImageItem *v2;
  float v3;

  v2 = self;
  v3 = sub_1008CF3C8();

  return v3;
}

- (id)commandToSetRoundedCornersEnabled:(BOOL)a3
{
  _TtC8Freeform12CRLImageItem *v4;
  id v5;

  v4 = self;
  v5 = sub_1008CF47C(a3);

  return v5;
}

- (id)maskInfoForCornerRadius:(float)a3
{
  _TtC8Freeform12CRLImageItem *v4;
  id v5;

  v4 = self;
  v5 = sub_1008CF5DC(a3);

  return v5;
}

- (BOOL)needsDownload
{
  uint64_t v3;
  _TtC8Freeform12CRLImageItem *v4;
  id v5;
  char v6;

  v3 = objc_opt_self(NSUserDefaults);
  v4 = self;
  v5 = objc_msgSend((id)v3, "standardUserDefaults");
  LOBYTE(v3) = objc_msgSend(v5, "BOOLForKey:", CFSTR("CRLImageItemsRequireAssetDownloadForSendCopyUserDefault"));

  if ((v3 & 1) != 0)
    v6 = 1;
  else
    v6 = sub_100772DAC();

  return v6 & 1;
}

- (void)updateGeometryToReplaceBoardItem:(id)a3
{
  _QWORD *v4;
  _TtC8Freeform12CRLImageItem *v5;

  v4 = a3;
  v5 = self;
  sub_1008CF9BC(v4);

}

- (CGPoint)centerForReplacingWithNewItem
{
  _TtC8Freeform12CRLImageItem *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v2 = self;
  v3 = sub_1008D0144();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)placeHolderDataNeedsDownload
{
  _TtC8Freeform12CRLImageItem *v2;
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v2 = self;
  v3 = sub_1008CB2D4();
  if (v3)
  {
    v4 = v3;
    v5 = &v3[OBJC_IVAR____TtC8Freeform8CRLAsset_storage];
    v6 = *((_QWORD *)v5 + 3);
    v7 = *((_QWORD *)v5 + 4);
    sub_1004BB5A4(v5, v6);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);

    v2 = (_TtC8Freeform12CRLImageItem *)v4;
  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

- (double)viewScaleToUseWhenRasterizingSingleBoardItemForCopy
{
  _TtC8Freeform12CRLImageItem *v2;
  double v3;

  v2 = self;
  v3 = sub_1008D0310();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform12CRLImageItem__imageAssetAsData));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform12CRLImageItem__thumbnailAssetAsData));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform12CRLImageItem__maskInfo));
}

- (BOOL)shouldCacheBackingAssetOnCopy
{
  return 0;
}

- (BOOL)isGEnerativePlaygroundImageItem
{
  return 1;
}

- (id)generativePlaygroundStringsFor:(id)a3
{
  return Array._bridgeToObjectiveC()().super.isa;
}

@end
