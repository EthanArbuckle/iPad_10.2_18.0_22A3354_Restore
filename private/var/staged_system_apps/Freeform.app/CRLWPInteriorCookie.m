@implementation CRLWPInteriorCookie

- (CRLWPColumn)column
{
  return (CRLWPColumn *)objc_loadWeakRetained((id *)&self->_column);
}

- (void)setColumn:(id)a3
{
  objc_storeWeak((id *)&self->_column, a3);
}

- (CRLWPLayoutTarget)layout
{
  return (CRLWPLayoutTarget *)objc_loadWeakRetained((id *)&self->_layout);
}

- (void)setLayout:(id)a3
{
  objc_storeWeak((id *)&self->_layout, a3);
}

- (CRLWrapSegments)interiorWrapSegmentsInWrapSpace
{
  return self->_interiorWrapSegmentsInWrapSpace;
}

- (void)setInteriorWrapSegmentsInWrapSpace:(id)a3
{
  objc_storeStrong((id *)&self->_interiorWrapSegmentsInWrapSpace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interiorWrapSegmentsInWrapSpace, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_column);
}

@end
