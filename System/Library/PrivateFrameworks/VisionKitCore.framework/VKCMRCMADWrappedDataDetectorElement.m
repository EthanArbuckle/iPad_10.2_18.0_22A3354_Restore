@implementation VKCMRCMADWrappedDataDetectorElement

- (VKCMRCMADWrappedDataDetectorElement)initWithMADMRCResultItem:(id)a3 scannerResult:(id)a4
{
  id v6;
  id v7;
  VKQuad *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  VKQuad *v25;
  void *v26;
  VKCMRCMADWrappedDataDetectorElement *v27;

  v6 = a4;
  v7 = a3;
  v8 = [VKQuad alloc];
  objc_msgSend(v7, "bottomLeft");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "bottomRight");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "topLeft");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v7, "topRight");
  v22 = v21;
  v24 = v23;

  v25 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v8, "initWithBottomLeft:bottomRight:topLeft:topRight:", v10, v12, v14, v16, v18, v20, v22, v24);
  -[VKQuad quadByFlippingPointsWithSourceFrame:](v25, "quadByFlippingPointsWithSourceFrame:", 0.0, 0.0, 1.0, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[VKCMRCMADWrappedDataDetectorElement initWithScannerResult:quad:](self, "initWithScannerResult:quad:", v6, v26);
  return v27;
}

- (VKCMRCMADWrappedDataDetectorElement)initWithScannerResult:(id)a3 quad:(id)a4
{
  id v7;
  id v8;
  VKCMRCMADWrappedDataDetectorElement *v9;
  VKCMRCMADWrappedDataDetectorElement *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VKCMRCMADWrappedDataDetectorElement;
  v9 = -[VKCBaseDataDetectorElement init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scannerResult, a3);
    v10->_dataDetectorTypes = +[VKCBaseDataDetectorElement dataDetectorTypesForScannerResult:](VKCMRCDataDetectorElement, "dataDetectorTypesForScannerResult:", v7);
    objc_storeStrong((id *)&v10->_quad, a4);
    -[VKCMRCMADWrappedDataDetectorElement quad](v10, "quad");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boundingBox");
    v10->_boundingBox.origin.x = v12;
    v10->_boundingBox.origin.y = v13;
    v10->_boundingBox.size.width = v14;
    v10->_boundingBox.size.height = v15;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VKCMRCMADWrappedDataDetectorElement scannerResult](self, "scannerResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("scanner"));

  -[VKCMRCMADWrappedDataDetectorElement quad](self, "quad");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("quad"));

}

- (VKCMRCMADWrappedDataDetectorElement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VKCMRCMADWrappedDataDetectorElement *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quad"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scanner"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[VKCMRCMADWrappedDataDetectorElement initWithScannerResult:quad:](self, "initWithScannerResult:quad:", v6, v5);
  return v7;
}

- (id)boundingQuads
{
  return self->_boundingQuads;
}

- (DDScannerResult)scannerResult
{
  return self->_scannerResult;
}

- (void)setScannerResult:(id)a3
{
  objc_storeStrong((id *)&self->_scannerResult, a3);
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_boundingQuads, 0);
}

@end
