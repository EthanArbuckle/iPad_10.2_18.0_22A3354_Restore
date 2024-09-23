@implementation MapSelectionManagerState

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (void)setLabelMarker:(id)a3
{
  objc_storeStrong((id *)&self->_labelMarker, a3);
}

- (NSSet)customPOIKeys
{
  return self->_customPOIKeys;
}

- (void)setCustomPOIKeys:(id)a3
{
  objc_storeStrong((id *)&self->_customPOIKeys, a3);
}

- (NSArray)selectedAnnotations
{
  return self->_selectedAnnotations;
}

- (void)setSelectedAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAnnotations, a3);
}

- (MKMapCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_selectedAnnotations, 0);
  objc_storeStrong((id *)&self->_customPOIKeys, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end
