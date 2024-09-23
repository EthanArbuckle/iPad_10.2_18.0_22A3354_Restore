@implementation CRLAdditionalTransformCoordinateSpace

- (CRLAdditionalTransformCoordinateSpace)initWithCoordinateSpace:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  CRLAdditionalTransformCoordinateSpace *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *identifier;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRLAdditionalTransformCoordinateSpace;
  v9 = -[CRLAdditionalTransformCoordinateSpace init](&v19, "init");
  if (v9)
  {
    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255730);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E27040();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255750);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE8358(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAdditionalTransformCoordinateSpace initWithCoordinateSpace:identifier:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLAdditionalTransformCoordinateSpace.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 23, 0, "invalid nil value for '%{public}s'", "coordinateSpace");

    }
    objc_storeStrong((id *)&v9->_originalCoordinateSpace, a3);
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255770);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E26FA4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255790);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE8358(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAdditionalTransformCoordinateSpace initWithCoordinateSpace:identifier:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLAdditionalTransformCoordinateSpace.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 25, 0, "invalid nil value for '%{public}s'", "identifier");

    }
    v16 = (NSString *)objc_msgSend(v8, "copy");
    identifier = v9->_identifier;
    v9->_identifier = v16;

  }
  return v9;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double v6;
  double v7;
  CGPoint result;

  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)self, *(Swift::String *)&a2);
  -[CRLAdditionalTransformCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double v6;
  double v7;
  CGPoint result;

  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)self, *(Swift::String *)&a2);
  -[CRLAdditionalTransformCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLAdditionalTransformCoordinateSpace *v9;
  CRLAdditionallyTransformedCoordinateSpace *originalCoordinateSpace;
  CRLAdditionallyTransformedCoordinateSpace *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (CRLAdditionalTransformCoordinateSpace *)a4;
  if (v9 != self)
  {
    memset(&v22, 0, sizeof(v22));
    originalCoordinateSpace = self->_originalCoordinateSpace;
    if (originalCoordinateSpace)
    {
      -[CRLAdditionallyTransformedCoordinateSpace additionalTransformIntoCoordinateSpace:](originalCoordinateSpace, "additionalTransformIntoCoordinateSpace:", self);
      v11 = self->_originalCoordinateSpace;
    }
    else
    {
      v11 = 0;
    }
    v20 = v22;
    CGAffineTransformInvert(&v21, &v20);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v24 = CGRectApplyAffineTransform(v23, &v21);
    -[CRLAdditionallyTransformedCoordinateSpace convertRect:toCoordinateSpace:](v11, "convertRect:toCoordinateSpace:", v9, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    x = v12;
    y = v13;
    width = v14;
    height = v15;
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CRLAdditionalTransformCoordinateSpace *v9;
  CRLAdditionallyTransformedCoordinateSpace *originalCoordinateSpace;
  double v11;
  double v12;
  double v13;
  double v14;
  CGAffineTransform v15[2];
  CGRect v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (CRLAdditionalTransformCoordinateSpace *)a4;
  if (v9 != self)
  {
    memset(&v15[1], 0, sizeof(CGAffineTransform));
    originalCoordinateSpace = self->_originalCoordinateSpace;
    if (originalCoordinateSpace)
    {
      -[CRLAdditionallyTransformedCoordinateSpace additionalTransformIntoCoordinateSpace:](originalCoordinateSpace, "additionalTransformIntoCoordinateSpace:", self);
      originalCoordinateSpace = self->_originalCoordinateSpace;
    }
    -[CRLAdditionallyTransformedCoordinateSpace convertRect:fromCoordinateSpace:](originalCoordinateSpace, "convertRect:fromCoordinateSpace:", v9, x, y, width, height);
    v15[0] = v15[1];
    v17 = CGRectApplyAffineTransform(v16, v15);
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
  }

  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)bounds
{
  CRLAdditionallyTransformedCoordinateSpace *originalCoordinateSpace;
  CGAffineTransform v4[2];
  CGRect v5;

  memset(&v4[1], 0, sizeof(CGAffineTransform));
  originalCoordinateSpace = self->_originalCoordinateSpace;
  if (originalCoordinateSpace)
  {
    -[CRLAdditionallyTransformedCoordinateSpace additionalTransformIntoCoordinateSpace:](originalCoordinateSpace, "additionalTransformIntoCoordinateSpace:", self);
    originalCoordinateSpace = self->_originalCoordinateSpace;
  }
  -[CRLAdditionallyTransformedCoordinateSpace bounds](originalCoordinateSpace, "bounds");
  v4[0] = v4[1];
  return CGRectApplyAffineTransform(v5, v4);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_originalCoordinateSpace, 0);
}

@end
