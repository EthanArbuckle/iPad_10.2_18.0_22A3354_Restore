@implementation PXPlacesGeotaggableSortDescriptor

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  return objc_msgSend(a3, "compareTo:", a4);
}

@end
