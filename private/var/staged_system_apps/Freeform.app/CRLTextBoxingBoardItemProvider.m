@implementation CRLTextBoxingBoardItemProvider

- (CRLTextBoxingBoardItemProvider)initWithTextStorage:(id)a3 geometry:(id)a4
{
  id v7;
  id v8;
  CRLTextBoxingBoardItemProvider *v9;
  CRLTextBoxingBoardItemProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLTextBoxingBoardItemProvider;
  v9 = -[CRLTextBoxingBoardItemProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textStorage, a3);
    objc_storeStrong((id *)&v10->_geometry, a4);
  }

  return v10;
}

- (CRLTextBoxingBoardItemProvider)initWithTextString:(id)a3 geometry:(id)a4
{
  id v7;
  id v8;
  CRLTextBoxingBoardItemProvider *v9;
  CRLTextBoxingBoardItemProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLTextBoxingBoardItemProvider;
  v9 = -[CRLTextBoxingBoardItemProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textString, a3);
    objc_storeStrong((id *)&v10->_geometry, a4);
  }

  return v10;
}

- (CRLTextBoxingBoardItemProvider)initWithRichTextString:(id)a3 geometry:(id)a4
{
  id v7;
  id v8;
  CRLTextBoxingBoardItemProvider *v9;
  CRLTextBoxingBoardItemProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLTextBoxingBoardItemProvider;
  v9 = -[CRLTextBoxingBoardItemProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_richTextString, a3);
    objc_storeStrong((id *)&v10->_geometry, a4);
  }

  return v10;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)+[NSString readableTypeIdentifiersForItemProvider](NSString, "readableTypeIdentifiersForItemProvider");
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  CRLCanvasInfoGeometry *v9;
  __int128 v10;
  CRLCanvasInfoGeometry *v11;
  CRLTextBoxingBoardItemProvider *v12;
  _OWORD v14[3];
  id v15;

  v15 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString crl_stringWithItemProviderData:typeIdentifier:error:](NSString, "crl_stringWithItemProviderData:typeIdentifier:error:", a3, a4, &v15));
  v7 = v15;
  if (!v7)
    goto LABEL_7;
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101231030);
  v8 = off_1013D9068;
  if (!os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
  {
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  sub_100DEF0E0(v8, v7);
  if (a5)
LABEL_6:
    *a5 = objc_retainAutorelease(v7);
LABEL_7:
  if (v6)
  {
    v9 = [CRLCanvasInfoGeometry alloc];
    v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v14[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v14[1] = v10;
    v14[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v11 = -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v9, "initWithFullTransform:widthValid:heightValid:", v14, 0, 0);
    v12 = -[CRLTextBoxingBoardItemProvider initWithTextString:geometry:]([CRLTextBoxingBoardItemProvider alloc], "initWithTextString:geometry:", v6, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CRLIngestibleItemImportableBoardItemProviderDelegate *delegate;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = v5;
  if (!self->_textStorage)
  {
    if (self->_textString)
    {
LABEL_4:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "makeTextboxItemWithString:"));
      goto LABEL_7;
    }
    if (!self->_richTextString)
    {
      v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101231050);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEF1D0(v11, v12);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101231070);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTextBoxingBoardItemProvider newBoardItemWithFactory:bakedSize:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLTextBoxingBoardItemProvider.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 95, 0, "Either the plain text string or the rich text string should be non-nil");

      if (self->_textString)
        goto LABEL_4;
      if (!self->_richTextString)
      {
        v8 = 0;
        goto LABEL_8;
      }
    }
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "makeTextboxItemWithAttributedString:"));
    goto LABEL_7;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "makeTextBoxItemWithStorage:"));
LABEL_7:
  v8 = (void *)v7;
LABEL_8:
  delegate = self->delegate;
  if (delegate
    && (objc_opt_respondsToSelector(delegate, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:") & 1) != 0)
  {
    -[CRLIngestibleItemImportableBoardItemProviderDelegate importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:](self->delegate, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:", self);
  }

  return v8;
}

- (NSDictionary)pasteboardDescription
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4
{
  _TtC8Freeform12CRLBoardItem *v6;
  _TtC8Freeform12CRLBoardItem *boardItem;
  void *v8;
  id v9;

  v9 = a4;
  v6 = -[CRLTextBoxingBoardItemProvider newBoardItemWithFactory:bakedSize:](self, "newBoardItemWithFactory:bakedSize:", a3, 1);
  boardItem = self->_boardItem;
  self->_boardItem = v6;

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return self->_boardItem;
}

- (NSError)error
{
  return self->_error;
}

- (CRLProgress)progress
{
  return self->progress;
}

- (unint64_t)uploadDataLength
{
  return self->uploadDataLength;
}

- (unint64_t)embeddedDataLength
{
  return self->embeddedDataLength;
}

- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (CRLIngestibleItemImportableBoardItemProviderDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->progress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_richTextString, 0);
  objc_storeStrong((id *)&self->_textString, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end
