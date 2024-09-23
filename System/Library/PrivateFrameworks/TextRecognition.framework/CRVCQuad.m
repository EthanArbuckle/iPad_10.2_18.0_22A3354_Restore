@implementation CRVCQuad

- (id)quadAfterScaling:(float)a3
{
  double v4;
  CRImageSpaceQuad *v5;
  CRVCQuad *v6;
  CRVCQuad *v7;

  v4 = a3;
  v5 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", self->_topLeft.x * v4, self->_topLeft.y * v4, self->_topRight.x * v4, self->_topRight.y * v4, self->_bottomRight.x * v4, self->_bottomRight.y * v4, self->_bottomLeft.x * v4, self->_bottomLeft.y * v4);
  v6 = self;
  v7 = -[CRVCQuad initWithImageSpaceQuad:uuid:homographyGroupID:](v6, "initWithImageSpaceQuad:uuid:homographyGroupID:", v5, v6->_UUID, v6->_homographyGroupID);

  return v7;
}

- (CRVCQuad)initWithImageSpaceQuad:(id)a3 uuid:(id)a4 homographyGroupID:(int)a5
{
  id v8;
  id v9;
  CRVCQuad *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRVCQuad;
  v10 = -[CRVCQuad init](&v20, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "topLeft");
    v10->_topLeft.x = v11;
    v10->_topLeft.y = v12;
    objc_msgSend(v8, "topRight");
    v10->_topRight.x = v13;
    v10->_topRight.y = v14;
    objc_msgSend(v8, "bottomRight");
    v10->_bottomRight.x = v15;
    v10->_bottomRight.y = v16;
    objc_msgSend(v8, "bottomLeft");
    v10->_bottomLeft.x = v17;
    v10->_bottomLeft.y = v18;
    objc_storeStrong((id *)&v10->_UUID, a4);
    v10->_homographyGroupID = a5;
  }

  return v10;
}

- (CRVCQuad)initWithImageSpaceQuad:(id)a3 uuid:(id)a4
{
  return -[CRVCQuad initWithImageSpaceQuad:uuid:homographyGroupID:](self, "initWithImageSpaceQuad:uuid:homographyGroupID:", a3, a4, 0xFFFFFFFFLL);
}

- (void)updateWithQuad:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;

  v4 = a3;
  objc_msgSend(v4, "topLeft");
  self->_topLeft.x = v5;
  self->_topLeft.y = v6;
  objc_msgSend(v4, "topRight");
  self->_topRight.x = v7;
  self->_topRight.y = v8;
  objc_msgSend(v4, "bottomRight");
  self->_bottomRight.x = v9;
  self->_bottomRight.y = v10;
  objc_msgSend(v4, "bottomLeft");
  v12 = v11;
  v14 = v13;

  self->_bottomLeft.x = v12;
  self->_bottomLeft.y = v14;
}

- (CGPoint)bottomLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomLeft.x;
  y = self->_bottomLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomRight.x;
  y = self->_bottomRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)topLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)topRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_topRight.x;
  y = self->_topRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (int)homographyGroupID
{
  return self->_homographyGroupID;
}

- (void)setHomographyGroupID:(int)a3
{
  self->_homographyGroupID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
