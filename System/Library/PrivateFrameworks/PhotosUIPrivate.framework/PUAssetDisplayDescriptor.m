@implementation PUAssetDisplayDescriptor

- (PUAssetDisplayDescriptor)init
{
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return -[PUAssetDisplayDescriptor initWithAssetReference:modifiedAfterDate:videoSeekTime:](self, "initWithAssetReference:modifiedAfterDate:videoSeekTime:", 0, 0, &v3);
}

- (PUAssetDisplayDescriptor)initWithAssetReference:(id)a3 modifiedAfterDate:(id)a4 videoSeekTime:(id *)a5
{
  id v9;
  id v10;
  PUAssetDisplayDescriptor *v11;
  PUAssetDisplayDescriptor *v12;
  __int128 v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUAssetDisplayDescriptor;
  v11 = -[PUAssetDisplayDescriptor init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetReference, a3);
    objc_storeStrong((id *)&v12->_modifiedAfterDate, a4);
    v13 = *(_OWORD *)&a5->var0;
    v12->_videoSeekTime.epoch = a5->var3;
    *(_OWORD *)&v12->_videoSeekTime.value = v13;
  }

  return v12;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (NSDate)modifiedAfterDate
{
  return self->_modifiedAfterDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedAfterDate, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
}

+ (id)assetDisplayDescriptorForSimpleNavigationToAssetReference:(id)a3
{
  id v3;
  PUAssetDisplayDescriptor *v4;
  PUAssetDisplayDescriptor *v5;
  __int128 v7;
  uint64_t v8;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = [PUAssetDisplayDescriptor alloc];
  v7 = *MEMORY[0x1E0CA2E18];
  v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v5 = -[PUAssetDisplayDescriptor initWithAssetReference:modifiedAfterDate:videoSeekTime:](v4, "initWithAssetReference:modifiedAfterDate:videoSeekTime:", v3, 0, &v7);

  return v5;
}

@end
