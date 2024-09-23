@implementation SUIAShockwavePrototypeSettings

- (double)maximumHintDuration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_maximumHintDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setMaximumHintDuration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_maximumHintDuration);
  swift_beginAccess();
  *v4 = a3;
}

- (double)totalDuration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_totalDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setTotalDuration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_totalDuration);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)visualizeEffectMasks
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_visualizeEffectMasks;
  swift_beginAccess();
  return *v2;
}

- (void)setVisualizeEffectMasks:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_visualizeEffectMasks;
  swift_beginAccess();
  *v4 = a3;
}

- (double)donutMaskInitialEdgeOutsetProportion
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskInitialEdgeOutsetProportion);
  swift_beginAccess();
  return *v2;
}

- (void)setDonutMaskInitialEdgeOutsetProportion:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskInitialEdgeOutsetProportion);
  swift_beginAccess();
  *v4 = a3;
}

- (double)finalFitVsDiameterRatioShortEdgeSmallScreen
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeSmallScreen);
  swift_beginAccess();
  return *v2;
}

- (void)setFinalFitVsDiameterRatioShortEdgeSmallScreen:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeSmallScreen);
  swift_beginAccess();
  *v4 = a3;
}

- (double)finalFitVsDiameterRatioLongEdgeSmallScreen
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeSmallScreen);
  swift_beginAccess();
  return *v2;
}

- (void)setFinalFitVsDiameterRatioLongEdgeSmallScreen:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeSmallScreen);
  swift_beginAccess();
  *v4 = a3;
}

- (double)finalFitVsDiameterRatioShortEdgeBigScreen
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeBigScreen);
  swift_beginAccess();
  return *v2;
}

- (void)setFinalFitVsDiameterRatioShortEdgeBigScreen:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeBigScreen);
  swift_beginAccess();
  *v4 = a3;
}

- (double)finalFitVsDiameterRatioLongEdgeBigScreen
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeBigScreen);
  swift_beginAccess();
  return *v2;
}

- (void)setFinalFitVsDiameterRatioLongEdgeBigScreen:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeBigScreen);
  swift_beginAccess();
  *v4 = a3;
}

- (double)edgeLightHintTransitionDelay
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintTransitionDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeLightHintTransitionDelay:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintTransitionDelay);
  swift_beginAccess();
  *v4 = a3;
}

- (double)donutMaskEndTransitionDelay
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskEndTransitionDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setDonutMaskEndTransitionDelay:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskEndTransitionDelay);
  swift_beginAccess();
  *v4 = a3;
}

- (SUIAFluidBehaviorSettings)donutMaskPositionAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskPositionAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setDonutMaskPositionAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskPositionAnimationSettings);
}

- (SUIAShockwaveRadialMaskSettings)chromaticAberrationInitialDonutMask
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationInitialDonutMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setChromaticAberrationInitialDonutMask:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationInitialDonutMask);
}

- (SUIAShockwaveRadialMaskSettings)chromaticAberrationFinalDonutMaskSmallScreen
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskSmallScreen);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setChromaticAberrationFinalDonutMaskSmallScreen:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskSmallScreen);
}

- (SUIAShockwaveRadialMaskSettings)chromaticAberrationFinalDonutMaskLargeScreen
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskLargeScreen);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setChromaticAberrationFinalDonutMaskLargeScreen:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskLargeScreen);
}

- (SUIAShockwaveRadialMaskSettings)colorFillInitialCircleMask
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillInitialCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setColorFillInitialCircleMask:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillInitialCircleMask);
}

- (SUIAShockwaveRadialMaskSettings)colorFillHintCircleMask
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillHintCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setColorFillHintCircleMask:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillHintCircleMask);
}

- (SUIAShockwaveRadialMaskSettings)colorFillFinalCircleMask
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillFinalCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setColorFillFinalCircleMask:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillFinalCircleMask);
}

- (SUIAShockwaveRadialMaskSettings)edgeLightInitialCircleMask
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightInitialCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setEdgeLightInitialCircleMask:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightInitialCircleMask);
}

- (SUIAShockwaveRadialMaskSettings)edgeLightHintCircleMask
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setEdgeLightHintCircleMask:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintCircleMask);
}

- (SUIAShockwaveRadialMaskSettings)edgeLightFinalCircleMask
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightFinalCircleMask);
  swift_beginAccess();
  return (SUIAShockwaveRadialMaskSettings *)*v2;
}

- (void)setEdgeLightFinalCircleMask:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightFinalCircleMask);
}

- (double)aberrationMagnitudeX
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeX);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationMagnitudeX:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeX);
  swift_beginAccess();
  *v4 = a3;
}

- (double)aberrationMagnitudeY
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeY);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationMagnitudeY:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeY);
  swift_beginAccess();
  *v4 = a3;
}

- (double)aberrationBlurRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationBlurRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationBlurRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)aberrationUseColorSaturate
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorSaturate;
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationUseColorSaturate:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorSaturate;
  swift_beginAccess();
  *v4 = a3;
}

- (double)aberrationColorSaturateAmount
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorSaturateAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationColorSaturateAmount:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorSaturateAmount);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)aberrationUseEDR
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseEDR;
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationUseEDR:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseEDR;
  swift_beginAccess();
  *v4 = a3;
}

- (double)aberrationEDRGain
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationEDRGain);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationEDRGain:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationEDRGain);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)aberrationUseColorBrightness
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorBrightness;
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationUseColorBrightness:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorBrightness;
  swift_beginAccess();
  *v4 = a3;
}

- (double)aberrationColorBrightness
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorBrightness);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationColorBrightness:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorBrightness);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)aberrationUseColorMatrixMultiply
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorMatrixMultiply;
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationUseColorMatrixMultiply:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorMatrixMultiply;
  swift_beginAccess();
  *v4 = a3;
}

- (double)aberrationColorMatrixMultiplyFactor
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorMatrixMultiplyFactor);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationColorMatrixMultiplyFactor:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorMatrixMultiplyFactor);
  swift_beginAccess();
  *v4 = a3;
}

- (double)aberrationFadeOutDelay
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationFadeOutDelay:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelay);
  swift_beginAccess();
  *v4 = a3;
}

- (double)aberrationFadeOutDelayIPad
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelayIPad);
  swift_beginAccess();
  return *v2;
}

- (void)setAberrationFadeOutDelayIPad:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelayIPad);
  swift_beginAccess();
  *v4 = a3;
}

- (SUIAFluidBehaviorSettings)abberationFadeOutAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationFadeOutAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setAbberationFadeOutAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationFadeOutAnimationSettings);
}

- (SUIAFluidBehaviorSettings)abberationCancelledFadeOutAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationCancelledFadeOutAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setAbberationCancelledFadeOutAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationCancelledFadeOutAnimationSettings);
}

- (double)meshSquareFinalSizeDiagonalRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshSquareFinalSizeDiagonalRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshSquareFinalSizeDiagonalRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshSquareFinalSizeDiagonalRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)meshRectangularFinalShortDimensionRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalShortDimensionRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshRectangularFinalShortDimensionRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalShortDimensionRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)meshRectangularFinalLongDimensionRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalLongDimensionRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshRectangularFinalLongDimensionRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalLongDimensionRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)meshFinalProportionAcrossScreenLongEdge
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenLongEdge);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshFinalProportionAcrossScreenLongEdge:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenLongEdge);
  swift_beginAccess();
  *v4 = a3;
}

- (double)meshFinalProportionAcrossScreenShortEdge
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenShortEdge);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshFinalProportionAcrossScreenShortEdge:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenShortEdge);
  swift_beginAccess();
  *v4 = a3;
}

- (double)meshFinalProportionTowardsCenterOnLargeDisplays
{
  double *v2;

  v2 = (double *)((char *)self
                + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionTowardsCenterOnLargeDisplays);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshFinalProportionTowardsCenterOnLargeDisplays:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self
                + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionTowardsCenterOnLargeDisplays);
  swift_beginAccess();
  *v4 = a3;
}

- (double)meshPointsEndTransitionDelay
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsEndTransitionDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setMeshPointsEndTransitionDelay:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsEndTransitionDelay);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)useSiriMeshForCapture
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_useSiriMeshForCapture;
  swift_beginAccess();
  return *v2;
}

- (void)setUseSiriMeshForCapture:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_useSiriMeshForCapture;
  swift_beginAccess();
  *v4 = a3;
}

- (SUIAFluidBehaviorSettings)meshPointsAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setMeshPointsAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsAnimationSettings);
}

- (SUIAFluidBehaviorSettings)meshPositionAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPositionAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setMeshPositionAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPositionAnimationSettings);
}

- (SUIAFluidBehaviorSettings)meshPointsCancelledAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsCancelledAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setMeshPointsCancelledAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsCancelledAnimationSettings);
}

- (double)fillLightInitialIntensity
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightInitialIntensity);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightInitialIntensity:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightInitialIntensity);
  swift_beginAccess();
  *v4 = a3;
}

- (double)fillLightCaptureInitialIntensity
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightCaptureInitialIntensity);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightCaptureInitialIntensity:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightCaptureInitialIntensity);
  swift_beginAccess();
  *v4 = a3;
}

- (double)captureFillWhiteValue
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillWhiteValue);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureFillWhiteValue:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillWhiteValue);
  swift_beginAccess();
  *v4 = a3;
}

- (double)fillLightFinalIntensity
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightFinalIntensity);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightFinalIntensity:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightFinalIntensity);
  swift_beginAccess();
  *v4 = a3;
}

- (SUIAFluidBehaviorSettings)lightIntensityAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setLightIntensityAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityAnimationSettings);
}

- (SUIAFluidBehaviorSettings)lightIntensityCancelledAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityCancelledAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setLightIntensityCancelledAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityCancelledAnimationSettings);
}

- (double)fillLightIntensityFinalStateDelay
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightIntensityFinalStateDelay);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightIntensityFinalStateDelay:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightIntensityFinalStateDelay);
  swift_beginAccess();
  *v4 = a3;
}

- (double)fillLightColorSaturateAmount
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorSaturateAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightColorSaturateAmount:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorSaturateAmount);
  swift_beginAccess();
  *v4 = a3;
}

- (double)fillLightColorBrightnessAmount
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorBrightnessAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightColorBrightnessAmount:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorBrightnessAmount);
  swift_beginAccess();
  *v4 = a3;
}

- (double)fillLightColorContrastAmount
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorContrastAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setFillLightColorContrastAmount:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorContrastAmount);
  swift_beginAccess();
  *v4 = a3;
}

- (SUIAFluidBehaviorSettings)captureHintAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setCaptureHintAnimationSettings:(id)a3
{
  sub_247C8DF64((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintAnimationSettings);
}

- (double)captureHintRetargetImpulse
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintRetargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureHintRetargetImpulse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintRetargetImpulse);
  swift_beginAccess();
  *v4 = a3;
}

- (double)captureHintInterpolationProgress
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintInterpolationProgress);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureHintInterpolationProgress:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintInterpolationProgress);
  swift_beginAccess();
  *v4 = a3;
}

- (double)captureHintMeshOffset
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintMeshOffset);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureHintMeshOffset:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintMeshOffset);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)captureChromaticAberrationEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureChromaticAberrationEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureChromaticAberrationEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureChromaticAberrationEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)captureMeshEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureMeshEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureMeshEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureMeshEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)captureFillLightType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillLightType);
  swift_beginAccess();
  return *v2;
}

- (void)setCaptureFillLightType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillLightType);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriButtonChromaticAberrationEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonChromaticAberrationEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonChromaticAberrationEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonChromaticAberrationEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriButtonMeshEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonMeshEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriButtonMeshEnabledLargeScreen
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabledLargeScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonMeshEnabledLargeScreen:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabledLargeScreen;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriButtonFillLightEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonFillLightEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonFillLightEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonFillLightEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriButtonEdgeLightEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonEdgeLightEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriButtonEdgeLightEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonEdgeLightEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriEdgeChromaticAberrationEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeChromaticAberrationEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeChromaticAberrationEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeChromaticAberrationEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriEdgeMeshEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeMeshEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriEdgeMeshEnabledLargeScreen
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabledLargeScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeMeshEnabledLargeScreen:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabledLargeScreen;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriEdgeFillLightEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeFillLightEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeFillLightEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeFillLightEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)siriEdgeEdgeLightEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeEdgeLightEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSiriEdgeEdgeLightEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeEdgeLightEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setDefaultValues
{
  SUIAShockwavePrototypeSettings *v2;

  v2 = self;
  SUIAShockwavePrototypeSettings.setDefaultValues()();

}

- (BOOL)shouldBehaveLikeLargeScreen:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  SUIAShockwavePrototypeSettings *v7;
  id v8;
  id v9;
  double v10;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_opt_self();
  v7 = self;
  v8 = objc_msgSend(v6, sel_currentDevice);
  v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  if (height >= width)
    v10 = width;
  else
    v10 = height;
  return v10 > 500.0 || v9 == (id)1;
}

- (double)finalFitVsDiameterRatioShortEdgeForShockwaveSize:(CGSize)a3
{
  return sub_247C93B84(self, a3.width, a3.height, (uint64_t)a2, (SEL *)&selRef_finalFitVsDiameterRatioShortEdgeBigScreen, (SEL *)&selRef_finalFitVsDiameterRatioShortEdgeSmallScreen);
}

- (double)finalFitVsDiameterRatioLongEdgeForShockwaveSize:(CGSize)a3
{
  return sub_247C93B84(self, a3.width, a3.height, (uint64_t)a2, (SEL *)&selRef_finalFitVsDiameterRatioLongEdgeBigScreen, (SEL *)&selRef_finalFitVsDiameterRatioLongEdgeSmallScreen);
}

- (id)chromaticAberrationFinalDonutMaskForShockwaveSize:(CGSize)a3
{
  double height;
  double width;
  SUIAShockwavePrototypeSettings *v5;
  unsigned int v6;
  char **v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[SUIAShockwavePrototypeSettings shouldBehaveLikeLargeScreen:](v5, sel_shouldBehaveLikeLargeScreen_, width, height);
  v7 = &selRef_chromaticAberrationFinalDonutMaskLargeScreen;
  if (!v6)
    v7 = &selRef_chromaticAberrationFinalDonutMaskSmallScreen;
  v8 = objc_msgSend(v5, *v7);

  return v8;
}

+ (id)settingsControllerModule
{
  id v2;

  _sSo30SUIAShockwavePrototypeSettingsC20SystemUIAnimationKitE24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskPositionAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationInitialDonutMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskSmallScreen));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskLargeScreen));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillInitialCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillHintCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillFinalCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightInitialCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightFinalCircleMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationFadeOutAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationCancelledFadeOutAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPositionAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsCancelledAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityCancelledAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintAnimationSettings));
}

@end
