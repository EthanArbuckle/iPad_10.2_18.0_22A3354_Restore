@implementation PFImageMetricComputeSSIMForPixelBuffer

void __PFImageMetricComputeSSIMForPixelBuffer_block_invoke(uint64_t a1)
{
  _computeSSIMForPlane(*(__CVBuffer **)(a1 + 40), *(__CVBuffer **)(a1 + 80), *(__CVBuffer **)(a1 + 120), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112));
}

void __PFImageMetricComputeSSIMForPixelBuffer_block_invoke_2(uint64_t a1)
{
  _computeSSIMForPlane(*(__CVBuffer **)(a1 + 40), *(__CVBuffer **)(a1 + 80), *(__CVBuffer **)(a1 + 120), 1u, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 24, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112));
}

void __PFImageMetricComputeSSIMForPixelBuffer_block_invoke_3(uint64_t a1)
{
  _computeSSIMForPlane(*(__CVBuffer **)(a1 + 40), *(__CVBuffer **)(a1 + 80), *(__CVBuffer **)(a1 + 120), 2u, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 48, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112));
}

@end
