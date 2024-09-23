@implementation PIPNCropUtilitiesWrapper

+ (double)bestCropVariantFromSignalsWithAspectRatio:(uint64_t)a3 sourcePixelWidth:(uint64_t)a4 sourcePixelHeight:(uint64_t)a5 acceptableCropRect:(uint64_t)a6 preferredCropRect:(uint64_t)a7 normalizedFaceAreaRect:(uint64_t)a8 gazeAreaRect:(__int128)a9
{
  void *v17;
  void *v18;
  double v19;
  double v20;

  objc_msgSend(a1, "cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:", &unk_1E5058E18, a3, a4, MEMORY[0x1E0C9AA60], 0, a9, a10, a11, a12, a13, a14, a15, a16, a17);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cropRect");
  v20 = v19;

  return v20;
}

+ (id)cropVariantsFromSignalsWithCropTypes:(double)a3 aspectRatio:(double)a4 sourcePixelWidth:(double)a5 sourcePixelHeight:(uint64_t)a6 acceptableCropRect:(uint64_t)a7 preferredCropRect:(void *)a8 faceAreaRect:(uint64_t)a9 objectSaliencyRects:(uint64_t)a10 gazeAreaRect:(void *)a11 isDenormalized:(uint64_t)a12
{
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v29 = a8;
  v30 = a11;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v31 = (void *)getPNCropUtilitiesWrapperClass_softClass;
  v44 = getPNCropUtilitiesWrapperClass_softClass;
  if (!getPNCropUtilitiesWrapperClass_softClass)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __getPNCropUtilitiesWrapperClass_block_invoke;
    v40[3] = &unk_1E5019948;
    v40[4] = &v41;
    __getPNCropUtilitiesWrapperClass_block_invoke((uint64_t)v40);
    v31 = (void *)v42[3];
  }
  v32 = objc_retainAutorelease(v31);
  _Block_object_dispose(&v41, 8);
  objc_msgSend(v32, "cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:", v29, a9, a10, v30, a12, a1, a2, a3, a4, a5, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

@end
