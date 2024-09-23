@implementation _BKMousePointerRegionLayoutDescriptor

- (_BKMousePointerRegionLayoutDescriptor)initWithRegion:(id)a3 relativeRegion:(id)a4 edge:(unsigned int)a5 edgePosition:(double)a6
{
  id v11;
  id v12;
  _BKMousePointerRegionLayoutDescriptor *v13;
  _BKMousePointerRegionLayoutDescriptor *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_BKMousePointerRegionLayoutDescriptor;
  v13 = -[_BKMousePointerRegionLayoutDescriptor init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_region, a3);
    objc_storeStrong((id *)&v14->_relativeRegion, a4);
    v14->_edge = a5;
    v14->_edgePosition = a6;
  }

  return v14;
}

- (BKMousePointerRegion)region
{
  return self->_region;
}

- (BKMousePointerRegion)relativeRegion
{
  return self->_relativeRegion;
}

- (unsigned)edge
{
  return self->_edge;
}

- (double)edgePosition
{
  return self->_edgePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeRegion, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
