@implementation ZN3geo9TaskQueue11barrierSyncENSt3

md::CrossFadeLabelPart *___ZN3geo9TaskQueue11barrierSyncENSt3__18functionIFvvEEE_block_invoke_1(uint64_t a1)
{
  uint64_t v1;
  md::CrossFadeLabelPart *v3;
  md::LabelPart *v4;
  md::LabelPart *v5;
  char v6;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
    return (md::CrossFadeLabelPart *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
  std::__throw_bad_function_call[abi:nn180100]();
  return md::CrossFadeLabelPart::CrossFadeLabelPart(v3, v4, v5, v6);
}

@end
