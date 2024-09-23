@implementation UIViewCALayerKeyValueMapper

void __63___UIViewCALayerKeyValueMapper_CALayerKeyPathForUIViewKeyPath___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)qword_1ECD82568;
  qword_1ECD82568 = (uint64_t)&unk_1E1A9B6F8;

  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", &unk_1E1A9B6F8);
  v2 = (void *)_MergedGlobals_1328;
  _MergedGlobals_1328 = v1;

}

void __72___UIViewCALayerKeyValueMapper_CALayerValueForUIViewValue_forUIViewKey___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("backgroundColor");
  v0 = (void *)objc_msgSend(&__block_literal_global_28_4, "copy");
  v4[1] = CFSTR("transform");
  v5[0] = v0;
  v1 = (void *)objc_msgSend(&__block_literal_global_32_1, "copy");
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD82578;
  qword_1ECD82578 = v2;

}

uint64_t __72___UIViewCALayerKeyValueMapper_CALayerValueForUIViewValue_forUIViewKey___block_invoke_2(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

id __72___UIViewCALayerKeyValueMapper_CALayerValueForUIViewValue_forUIViewKey___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  CGAffineTransform v4;
  CATransform3D v5;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  if (a2)
    objc_msgSend(a2, "CGAffineTransformValue");
  else
    memset(&v4, 0, sizeof(v4));
  CATransform3DMakeAffineTransform(&v5, &v4);
  objc_msgSend(v2, "valueWithCATransform3D:", &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
