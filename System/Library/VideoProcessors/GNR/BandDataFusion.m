@implementation BandDataFusion

- (void)dealloc
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *elements;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  objc_super v14;

  elements = self->sharpening.elements;
  if (elements)
    free(elements);
  self->sharpening.elements = 0;
  self->sharpening.length = 0;
  v4 = self->adaptive_blur.elements;
  if (v4)
    free(v4);
  self->adaptive_blur.elements = 0;
  self->adaptive_blur.length = 0;
  v5 = self->diff_weight.elements;
  if (v5)
    free(v5);
  self->diff_weight.elements = 0;
  self->diff_weight.length = 0;
  v6 = self->luma_fusion_strength.elements;
  if (v6)
    free(v6);
  self->luma_fusion_strength.elements = 0;
  self->luma_fusion_strength.length = 0;
  v7 = self->chroma_fusion_strength.elements;
  if (v7)
    free(v7);
  self->chroma_fusion_strength.elements = 0;
  self->chroma_fusion_strength.length = 0;
  v8 = self->black_threshold.elements;
  if (v8)
    free(v8);
  self->black_threshold.elements = 0;
  self->black_threshold.length = 0;
  v9 = self->chroma_black_threshold.elements;
  if (v9)
    free(v9);
  self->chroma_black_threshold.elements = 0;
  self->chroma_black_threshold.length = 0;
  v10 = self->diff_weight_dense.elements;
  if (v10)
    free(v10);
  self->diff_weight_dense.elements = 0;
  self->diff_weight_dense.length = 0;
  v11 = self->luma_fusion_strength_dense.elements;
  if (v11)
    free(v11);
  self->luma_fusion_strength_dense.elements = 0;
  self->luma_fusion_strength_dense.length = 0;
  v12 = self->chroma_fusion_strength_dense.elements;
  if (v12)
    free(v12);
  self->chroma_fusion_strength_dense.elements = 0;
  self->chroma_fusion_strength_dense.length = 0;
  v13 = self->static_ois_sharpening.elements;
  if (v13)
    free(v13);
  self->static_ois_sharpening.elements = 0;
  self->static_ois_sharpening.length = 0;
  v14.receiver = self;
  v14.super_class = (Class)BandDataFusion;
  -[BandDataFusion dealloc](&v14, sel_dealloc);
}

@end
