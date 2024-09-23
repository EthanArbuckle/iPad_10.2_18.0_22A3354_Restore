@implementation BandDataNM

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
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  objc_super v18;

  elements = self->luma_denoise_strength.elements;
  if (elements)
    free(elements);
  self->luma_denoise_strength.elements = 0;
  self->luma_denoise_strength.length = 0;
  v4 = self->chroma_denoise_strength.elements;
  if (v4)
    free(v4);
  self->chroma_denoise_strength.elements = 0;
  self->chroma_denoise_strength.length = 0;
  v5 = self->luma_remix_weight.elements;
  if (v5)
    free(v5);
  self->luma_remix_weight.elements = 0;
  self->luma_remix_weight.length = 0;
  v6 = self->luma_denoise_strength_evm.elements;
  if (v6)
    free(v6);
  self->luma_denoise_strength_evm.elements = 0;
  self->luma_denoise_strength_evm.length = 0;
  v7 = self->chroma_denoise_strength_evm.elements;
  if (v7)
    free(v7);
  self->chroma_denoise_strength_evm.elements = 0;
  self->chroma_denoise_strength_evm.length = 0;
  v8 = self->luma_remix_weight_evm.elements;
  if (v8)
    free(v8);
  self->luma_remix_weight_evm.elements = 0;
  self->luma_remix_weight_evm.length = 0;
  v9 = self->blue_boost.elements;
  if (v9)
    free(v9);
  self->blue_boost.elements = 0;
  self->blue_boost.length = 0;
  v10 = self->flatness_boost.elements;
  if (v10)
    free(v10);
  self->flatness_boost.elements = 0;
  self->flatness_boost.length = 0;
  v11 = self->flatness_threshold.elements;
  if (v11)
    free(v11);
  self->flatness_threshold.elements = 0;
  self->flatness_threshold.length = 0;
  v12 = self->halo_suppression.elements;
  if (v12)
    free(v12);
  self->halo_suppression.elements = 0;
  self->halo_suppression.length = 0;
  v13 = self->radial_sharpness_boost.elements;
  if (v13)
    free(v13);
  self->radial_sharpness_boost.elements = 0;
  self->radial_sharpness_boost.length = 0;
  v14 = self->high_gain_denoise_boost.elements;
  if (v14)
    free(v14);
  self->high_gain_denoise_boost.elements = 0;
  self->high_gain_denoise_boost.length = 0;
  v15 = self->low_gain_denoise_less.elements;
  if (v15)
    free(v15);
  self->low_gain_denoise_less.elements = 0;
  self->low_gain_denoise_less.length = 0;
  v16 = self->local_gain_threshold.elements;
  if (v16)
    free(v16);
  self->local_gain_threshold.elements = 0;
  self->local_gain_threshold.length = 0;
  v17 = self->radial_flatness_boost.elements;
  if (v17)
    free(v17);
  self->radial_flatness_boost.elements = 0;
  self->radial_flatness_boost.length = 0;
  v18.receiver = self;
  v18.super_class = (Class)BandDataNM;
  -[BandDataNM dealloc](&v18, sel_dealloc);
}

@end
