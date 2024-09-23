@implementation VKDebugSettings

- (BOOL)daVinciColorBuildings
{
  return self->_daVinciColorBuildings;
}

- (BOOL)lightingEnableAmbient
{
  return self->_lightingEnableAmbient;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overrideLight1
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_overrideLight1.r;
  g = self->_overrideLight1.g;
  b = self->_overrideLight1.b;
  a = self->_overrideLight1.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overrideAmbient
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_overrideAmbient.r;
  g = self->_overrideAmbient.g;
  b = self->_overrideAmbient.b;
  a = self->_overrideAmbient.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (float)ssaoOverrideRadius
{
  return self->_ssaoOverrideRadius;
}

- (BOOL)ssaoOverrideOn
{
  return self->_ssaoOverrideOn;
}

- (float)ssaoOverrideIntensity
{
  return self->_ssaoOverrideIntensity;
}

- (float)ssaoMaxIntensity
{
  return self->_ssaoMaxIntensity;
}

- (float)overrideLight1Azimuth
{
  return self->_overrideLight1Azimuth;
}

- (float)overrideLight1Altitude
{
  return self->_overrideLight1Altitude;
}

- (BOOL)lightingOverrideLight1
{
  return self->_lightingOverrideLight1;
}

- (BOOL)lightingOverrideAmbient
{
  return self->_lightingOverrideAmbient;
}

- (BOOL)lightingEnableLight1
{
  return self->_lightingEnableLight1;
}

- (BOOL)daVinciLightingStylesOverrideEnabled
{
  return self->_daVinciLightingStylesOverrideEnabled;
}

- (float)daVinciGroundAmbientOcclusionRadius
{
  return self->_daVinciGroundAmbientOcclusionRadius;
}

- (float)daVinciGroundAmbientOcclusionIntensity
{
  return self->_daVinciGroundAmbientOcclusionIntensity;
}

- (BOOL)daVinciGroundAmbientOcclusionEnabled
{
  return self->_daVinciGroundAmbientOcclusionEnabled;
}

- (float)daVinciShadowIntensity
{
  return self->_daVinciShadowIntensity;
}

- (BOOL)daVinciTemperatureGroundTintingEnabled
{
  return self->_daVinciTemperatureGroundTintingEnabled;
}

- (BOOL)daVinciMaterialRastersEnabled
{
  return self->_daVinciMaterialRastersEnabled;
}

- (unsigned)daVinciDebugRasterStyleAttribute
{
  return self->_daVinciDebugRasterStyleAttribute;
}

- (BOOL)daVinciAridityGroundTintingEnabled
{
  return self->_daVinciAridityGroundTintingEnabled;
}

+ (id)sharedSettings
{
  if (+[VKDebugSettings sharedSettings]::_once != -1)
    dispatch_once(&+[VKDebugSettings sharedSettings]::_once, &__block_literal_global_20873);
  return (id)+[VKDebugSettings sharedSettings]::_sharedSettings;
}

- (BOOL)daVinciBuildingHeights
{
  return self->_daVinciBuildingHeights;
}

- (BOOL)daVinciLightingDebugShowLitSphere
{
  return self->_daVinciLightingDebugShowLitSphere;
}

- (BOOL)shouldUseTestTileLoader
{
  return self->_shouldUseTestTileLoader;
}

- (BOOL)prioritizeTrafficSkeleton
{
  return self->_prioritizeTrafficSkeleton;
}

- (BOOL)layoutContinuously
{
  return self->_layoutContinuously;
}

- (BOOL)enableTrafficFeatureLabelDebugging
{
  return self->_enableTrafficFeatureLabelDebugging;
}

- (unsigned)textureAtlasPageIndex
{
  return self->_textureAtlasPageIndex;
}

- (unsigned)textureAtlasIndex
{
  return self->_textureAtlasIndex;
}

- (float)textlessPOIsMinZoom
{
  return self->_textlessPOIsMinZoom;
}

- (BOOL)textlessPOIsEnabled
{
  return self->_textlessPOIsEnabled;
}

- (BOOL)showLabelsNavState
{
  return self->_showLabelsNavState;
}

- (BOOL)showGRLDebugInfo
{
  return self->_showGRLDebugInfo;
}

- (BOOL)showFlexZoneRanges
{
  return self->_showFlexZoneRanges;
}

- (BOOL)showClientStyleAttributes
{
  return self->_showClientStyleAttributes;
}

- (BOOL)shouldUseSDFSuperSampling
{
  return self->_shouldUseSDFSuperSampling;
}

- (BOOL)shouldUseSDFGlyphs
{
  return self->_shouldUseSDFGlyphs;
}

- (BOOL)shouldOverrideUpscaleFactor
{
  return self->_shouldOverrideUpscaleFactor;
}

- (BOOL)shouldOverrideSuperSampleKernelSize
{
  return self->shouldOverrideSuperSampleKernelSize;
}

- (float)sdfGlyphSuperSampleKernelSize
{
  return self->_sdfGlyphSuperSampleKernelSize;
}

- (float)sdfGlyphShaderUpscaleFactor
{
  return self->_sdfGlyphShaderUpscaleFactor;
}

- (BOOL)paintLabelRoadFeatures
{
  return self->_paintLabelRoadFeatures;
}

- (BOOL)paintLabelCounts
{
  return self->_paintLabelCounts;
}

- (BOOL)paintLabelCollisionLines
{
  return self->_paintLabelCollisionLines;
}

- (BOOL)lockLabelHighlighting
{
  return self->_lockLabelHighlighting;
}

- (unsigned)labelerOutputIndex
{
  return self->_labelerOutputIndex;
}

- (BOOL)labelUpdateMapTilesContinuously
{
  return self->_labelUpdateMapTilesContinuously;
}

- (BOOL)labelTransitLineCollisionEnabled
{
  return self->_labelTransitLineCollisionEnabled;
}

- (BOOL)labelTileDecodeEnabled
{
  return self->_labelTileDecodeEnabled;
}

- (BOOL)labelShowPlaceholderIcons
{
  return self->_labelShowPlaceholderIcons;
}

- (BOOL)labelRingAnimationEnabled
{
  return self->_labelRingAnimationEnabled;
}

- (BOOL)labelOcclusionDisabled
{
  return self->_labelOcclusionDisabled;
}

- (BOOL)labelHighlighting
{
  return self->_labelHighlighting;
}

- (BOOL)labelHighlightingVerboseLoggingEnabled
{
  return self->_labelHighlightingVerboseLoggingEnabled;
}

- (BOOL)labelHighlightingTransitFeaturesOnly
{
  return self->_labelHighlightingTransitFeaturesOnly;
}

- (BOOL)labelHidePointFeatures
{
  return self->_labelHidePointFeatures;
}

- (BOOL)labelHidePhysicalFeatures
{
  return self->_labelHidePhysicalFeatures;
}

- (BOOL)labelHideLineFeatures
{
  return self->_labelHideLineFeatures;
}

- (BOOL)labelFlipAlternatePositionsEnable
{
  return self->_labelFlipAlternatePositionsEnable;
}

- (BOOL)labelFacingCullDisabled
{
  return self->_labelFacingCullDisabled;
}

- (BOOL)labelDedupingDisabled
{
  return self->_labelDedupingDisabled;
}

- (BOOL)labelDebugHoverLayers
{
  return self->_labelDebugHoverLayers;
}

- (BOOL)labelCollisionDisabled
{
  return self->_labelCollisionDisabled;
}

- (BOOL)labelCollideContinuously
{
  return self->_labelCollideContinuously;
}

- (BOOL)labelAutoOffsetRoadText
{
  return self->_labelAutoOffsetRoadText;
}

- (BOOL)labelAllowDefaultStyle
{
  return self->_labelAllowDefaultStyle;
}

- (BOOL)labelAllowDefaultIcon
{
  return self->_labelAllowDefaultIcon;
}

- (BOOL)hideDirectionalArrows
{
  return self->_hideDirectionalArrows;
}

- (BOOL)enableRouteLineLabelingDebugging
{
  return self->_enableRouteLineLabelingDebugging;
}

- (BOOL)enableRoadSignArtworkDebugging
{
  return self->_enableRoadSignArtworkDebugging;
}

- (BOOL)enableLabelAnimationTuning
{
  return self->_enableLabelAnimationTuning;
}

- (BOOL)displayTextureAtlas
{
  return self->_displayTextureAtlas;
}

- (BOOL)disableRouteAnnotationLimit
{
  return self->_disableRouteAnnotationLimit;
}

- (BOOL)disableRoadSignLimit
{
  return self->_disableRoadSignLimit;
}

- (BOOL)disableOverlayTextConsole
{
  return self->_disableOverlayTextConsole;
}

- (BOOL)disableBackgroundLabelLayout
{
  return self->_disableBackgroundLabelLayout;
}

- (int)debugOverlayOffsetY
{
  return self->_debugOverlayOffsetY;
}

- (int)debugOverlayOffsetX
{
  return self->_debugOverlayOffsetX;
}

- (BOOL)relaxTiltLimits
{
  return self->_relaxTiltLimits;
}

- (BOOL)preserveModelTile
{
  if (self->_paintTiles)
    return 1;
  if (self->_paintRoadBoundaries)
    return 1;
  if (self->_paintRoadTiles)
    return 1;
  if (self->_paintPoiTiles)
    return 1;
  if (self->_paintPointTiles)
    return 1;
  if (self->_paintPolygonTiles)
    return 1;
  if (self->_paintTopographicTiles)
    return 1;
  if (self->_paintLandcoverTiles)
    return 1;
  if (self->_paintVenues)
    return 1;
  if (self->_paintDaVinciMetaTiles)
    return 1;
  if (self->_paintVertices)
    return 1;
  if (self->_paintJunctions)
    return 1;
  if (self->_paintCoastlines)
    return 1;
  if (self->_paintBuildings)
    return 1;
  return self->_paintLoadReason;
}

- (float)farClipPlaneFactor
{
  return self->_farClipPlaneFactor;
}

- (BOOL)isLogicConsoleEnabled:(unint64_t)a3
{
  unint64_t value;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  value = self->_enabledLogicConsoles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      v5 = a3;
      if (value <= a3)
        v5 = a3 % value;
    }
    else
    {
      v5 = (value - 1) & a3;
    }
    v6 = self->_enabledLogicConsoles.__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v6)
    {
      v6 = (_QWORD *)*v6;
      if (v6)
      {
        if (v4.u32[0] < 2uLL)
        {
          v7 = value - 1;
          while (1)
          {
            v9 = v6[1];
            if (v9 == a3)
            {
              if (v6[2] == a3)
                return v6 != 0;
            }
            else if ((v9 & v7) != v5)
            {
              goto LABEL_21;
            }
            v6 = (_QWORD *)*v6;
            if (!v6)
              return v6 != 0;
          }
        }
        do
        {
          v8 = v6[1];
          if (v8 == a3)
          {
            if (v6[2] == a3)
              return v6 != 0;
          }
          else
          {
            if (v8 >= value)
              v8 %= value;
            if (v8 != v5)
              goto LABEL_21;
          }
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
    }
  }
  else
  {
LABEL_21:
    v6 = 0;
  }
  return v6 != 0;
}

- (BOOL)isAnyLogicConsoleEnabled
{
  return self->_enabledLogicConsoles.__table_.__p2_.__value_ != 0;
}

- (float)daVinciGlobeSplinedMaxZoom
{
  return self->_daVinciGlobeSplinedMaxZoom;
}

- (float)ribbonCrispness
{
  return self->_ribbonCrispness;
}

- (BOOL)daVinciShowCenterLineRoads
{
  return self->_daVinciShowCenterLineRoads;
}

- (BOOL)daVinciEnableRibbonAntialiasing
{
  return self->_daVinciEnableRibbonAntialiasing;
}

- (unsigned)anisotropy
{
  return self->_anisotropy;
}

- (BOOL)daVinciASTCTextureSideLoadEnabled
{
  return self->_daVinciASTCTextureSideLoadEnabled;
}

- (BOOL)compressedBuildingsDisabled
{
  return self->_compressedBuildingsDisabled;
}

- (BOOL)daVinciRoundBuildings
{
  return self->_daVinciRoundBuildings;
}

- (float)daVinciBuildingRoundingRadius
{
  return self->_daVinciBuildingRoundingRadius;
}

- (BOOL)enableTileClippingDebug
{
  return self->_enableTileClippingDebug;
}

- (BOOL)enableTileClipping
{
  return self->_enableTileClipping;
}

- (BOOL)daVinciWaterEnabled
{
  return self->_daVinciWaterEnabled;
}

- (BOOL)daVinciPlanarOverride
{
  return self->_daVinciPlanarOverride;
}

- (BOOL)daVinciColorCorrectionOverride
{
  return self->_daVinciColorCorrectionOverride;
}

- (BOOL)daVinciOverrideElevationScaling
{
  return self->_daVinciOverrideElevationScaling;
}

- (BOOL)daVinciForceElevatedGround
{
  return self->_daVinciForceElevatedGround;
}

- (BOOL)daVinciElevationScalingNormalsOnly
{
  return self->_daVinciElevationScalingNormalsOnly;
}

- (float)buildingPOIPitchScaleMinZoom
{
  return self->_buildingPOIPitchScaleMinZoom;
}

- (float)buildingPOIPitchScaleMaxZoom
{
  return self->_buildingPOIPitchScaleMaxZoom;
}

- (float)buildingPOIPitchScaleMaxZoomFactor
{
  return self->_buildingPOIPitchScaleMaxZoomFactor;
}

- (float)buildingPOIPitchScaleFullHeightAngle
{
  return self->_buildingPOIPitchScaleFullHeightAngle;
}

- (BOOL)daVinciPitchScaleEnabled
{
  return self->_daVinciPitchScaleEnabled;
}

- (float)daVinciTransitionDuration
{
  return self->_daVinciTransitionDuration;
}

- (unsigned)daVinciSmoothEdgeMinZ
{
  return self->_daVinciSmoothEdgeMinZ;
}

- (float)daVinciSmoothEdgeMinZAngle
{
  return self->_daVinciSmoothEdgeMinZAngle;
}

- (unsigned)daVinciSmoothEdgeMaxZ
{
  return self->_daVinciSmoothEdgeMaxZ;
}

- (float)daVinciSmoothEdgeMaxZAngle
{
  return self->_daVinciSmoothEdgeMaxZAngle;
}

- (float)routeWindshieldAnimationTime
{
  return self->_routeWindshieldAnimationTime;
}

- (float)routeIsCoveredAnimationTime
{
  return self->_routeIsCoveredAnimationTime;
}

- (float)animationTimeMultiplier
{
  float result;

  result = 10.0;
  if (!self->_slowAnimations)
    return 1.0;
  return result;
}

- (BOOL)disableStylesheetAnimations
{
  return self->_disableStylesheetAnimations;
}

- (BOOL)enableRouteShareSectionDebugging
{
  return self->_enableRouteShareSectionDebugging;
}

- (BOOL)enableEtaLabelRectDebugging
{
  return self->_enableEtaLabelRectDebugging;
}

- (BOOL)enableEtaLabelDebugging
{
  return self->_enableEtaLabelDebugging;
}

- (BOOL)daVinciAdvancedLightingEnabled
{
  return self->_daVinciAdvancedLightingEnabled;
}

- (BOOL)drawDaVinciHUD
{
  return self->_drawDaVinciHUD;
}

- (BOOL)drawDaVinciElevationScalingDebug
{
  return self->_drawDaVinciElevationScalingDebug;
}

- (BOOL)daVinciRenderingDebugShowUVs
{
  return self->_daVinciRenderingDebugShowUVs;
}

- (BOOL)daVinciRenderLineGeometry
{
  return self->_daVinciRenderLineGeometry;
}

- (BOOL)daVinciLightingDebugShowOverexposure
{
  return self->_daVinciLightingDebugShowOverexposure;
}

- (BOOL)daVinciLightingDebugShowNormals
{
  return self->_daVinciLightingDebugShowNormals;
}

- (BOOL)daVinciLightingDebugLightsOnly
{
  return self->_daVinciLightingDebugLightsOnly;
}

- (BOOL)daVinciLightingDebugAlbedoOnly
{
  return self->_daVinciLightingDebugAlbedoOnly;
}

- (float)daVinciHorizonGlowStrength
{
  return self->_daVinciHorizonGlowStrength;
}

- (float)daVinciHorizonGlowSharpness
{
  return self->_daVinciHorizonGlowSharpness;
}

- (BOOL)daVinciGlobeLighting
{
  return self->_daVinciGlobeLighting;
}

- (BOOL)daVinciEnablePBR
{
  return self->_daVinciEnablePBR;
}

- (BOOL)disableRoute
{
  return self->_disableRoute;
}

- (BOOL)shouldFreezeLayoutCamera
{
  return self->_shouldFreezeLayoutCamera;
}

- (BOOL)daVinciTintLODLevels
{
  return self->_daVinciTintLODLevels;
}

- (BOOL)daVinciShowMissingMaterials
{
  return self->_daVinciShowMissingMaterials;
}

- (BOOL)daVinciWireframeEnabled
{
  return self->_daVinciWireframeEnabled;
}

- (BOOL)daVinciTintBandStrokeWireframeEnabled
{
  return self->_daVinciTintBandStrokeWireframeEnabled;
}

- (BOOL)daVinciTintBandStrokeDistanceDebugEnabled
{
  return self->_daVinciTintBandStrokeDistanceDebugEnabled;
}

- (BOOL)daVinciTintBandFillWireframeEnabled
{
  return self->_daVinciTintBandFillWireframeEnabled;
}

- (void)setDebugCaptureNextGPUFrame:(BOOL)a3
{
  self->_debugCaptureNextGPUFrame = a3;
}

- (NSString)debugGPUFrameCaptureURL
{
  return self->_debugGPUFrameCaptureURL;
}

- (BOOL)debugCaptureNextGPUFrame
{
  return self->_debugCaptureNextGPUFrame;
}

- (BOOL)showTrafficOffset
{
  return self->_showTrafficOffset;
}

- (BOOL)enableDOF
{
  return self->_enableDOF;
}

- (float)daVinciSSAOTextureScale
{
  return self->_daVinciSSAOTextureScale;
}

- (float)daVinciRouteLineMaskScale
{
  return self->_daVinciRouteLineMaskScale;
}

- (float)transitionTimeMultiplier
{
  float result;

  result = 10.0;
  if (!self->_slowTransitions)
    return 1.0;
  return result;
}

- (BOOL)showStaticRouteWidth
{
  return self->_showStaticRouteWidth;
}

- (BOOL)dontMatchRouteLine
{
  return self->_dontMatchRouteLine;
}

- (BOOL)daVinciResourceOverrideEnabled
{
  return self->_daVinciResourceOverrideEnabled;
}

- (BOOL)showTrafficCasing
{
  return self->_showTrafficCasing;
}

- (BOOL)enableAntialiasing
{
  return self->_enableAntialiasing;
}

- (const)displayStyleOverride
{
  unint64_t v2;

  v2 = self->_mapDisplayStyleOverride - 1;
  if (v2 > 3)
    return 0;
  else
    return (const $6EFE6C6748B912A6EAC8A8E593ED1344 *)*(&off_1E42F3CD0 + v2);
}

- (BOOL)disableBuildingFootprints
{
  return self->_disableBuildingFootprints;
}

- (BOOL)daVinciCameraController
{
  return self->_daVinciCameraController;
}

- (BOOL)daVinciCameraControllerForceMercatorZoom
{
  return self->_daVinciCameraControllerForceMercatorZoom;
}

- (BOOL)enableLoggingInLockScreen
{
  return self->_enableLoggingInLockScreen;
}

- (float)dofStrength
{
  return self->_dofStrength;
}

void __33__VKDebugSettings_sharedSettings__block_invoke()
{
  VKDebugSettings *v0;
  void *v1;

  v0 = objc_alloc_init(VKDebugSettings);
  v1 = (void *)+[VKDebugSettings sharedSettings]::_sharedSettings;
  +[VKDebugSettings sharedSettings]::_sharedSettings = (uint64_t)v0;

}

- (VKDebugSettings)init
{
  VKDebugSettings *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  float v23;
  float v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *debugGPUFrameCaptureURL;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t (***v38)();
  uint64_t v39;
  uint64_t value;
  uint64_t v41;
  uint64_t v42;
  uint64_t (***v43)();
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  float v50;
  void *v51;
  void *v52;
  float v53;
  void *v54;
  float v55;
  void *v56;
  float v57;
  void *v58;
  float v59;
  void *v60;
  float v61;
  void *v62;
  float v63;
  void *v64;
  float v65;
  void *v66;
  float v67;
  void *v68;
  float v69;
  void *v70;
  float v71;
  void *v72;
  float v73;
  void *v74;
  float v75;
  void *v76;
  float v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  float v82;
  void *v83;
  float v84;
  void *v85;
  float v86;
  void *v87;
  float v88;
  void *v89;
  void *v90;
  float v91;
  void *v92;
  float v93;
  void *v94;
  uint64_t v95;
  NSString *arDebugSceneFeatureText;
  void *v97;
  void *v103;
  void *v104;
  BOOL v105;
  void *v106;
  char v107;
  char v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id to;
  id location;
  objc_super v116;
  id from;
  uint64_t (**v118)();
  id v119[2];
  uint64_t (***v120)();
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v116.receiver = self;
  v116.super_class = (Class)VKDebugSettings;
  v2 = -[VKDebugSettings init](&v116, sel_init);

  objc_initWeak(&location, v2);
  v2->_labelerOutputIndex = -1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_labelHidePointFeatures = objc_msgSend(v3, "BOOLForKey:", CFSTR("VKLabelHidePointFeatures"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_labelHideLineFeatures = objc_msgSend(v4, "BOOLForKey:", CFSTR("VKLabelHideLineFeatures"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_labelHidePhysicalFeatures = objc_msgSend(v5, "BOOLForKey:", CFSTR("VKLabelHidePhysicalFeatures"));

  v2->_labelTileDecodeEnabled = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_disableBackgroundLabelLayout = objc_msgSend(v6, "BOOLForKey:", CFSTR("VKDisableBackgroundLabelLayout"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_hideDirectionalArrows = objc_msgSend(v7, "BOOLForKey:", CFSTR("HideDirectionalArrowsKey"));

  *(_WORD *)&v2->_altitudeHighResSatellite = 257;
  *(_WORD *)&v2->_altitudeMipmapObjectTree = 257;
  v2->_altitudePrintRenderedTilesStat = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_altitudeDisableC3mTextureLoading = objc_msgSend(v8, "BOOLForKey:", CFSTR("AltitudeDisableC3mTextureLoadingKey"));

  v2->_altitudeShowTriggerbounds = 0;
  v2->_altitudeTourSpeedup = 0;
  v2->_altitudeTexturePaging = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_highlightRouteLineSnappingStatus = objc_msgSend(v9, "BOOLForKey:", CFSTR("HighlightRouteLineSnappingStatusKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_useStaticTrafficFeed = objc_msgSend(v10, "BOOLForKey:", CFSTR("VKUseStaticTrafficFeed"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_disableIconTextureAtlas = objc_msgSend(v11, "BOOLForKey:", CFSTR("VKDisableIconTextureAtlas"));

  *(_WORD *)&v2->_showTrafficCasing = 257;
  v2->_prioritizeTrafficSkeleton = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_disableStylesheetAnimations = objc_msgSend(v12, "BOOLForKey:", CFSTR("VKDisableStyleAnimations"));

  *(_WORD *)&v2->_drawPerformanceHUD = 0;
  v2->_paintOverlayFoundationAssociation = 0;
  v2->_labelTransitLineCollisionEnabled = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_labelStyleOverridesDisabled = objc_msgSend(v13, "BOOLForKey:", CFSTR("VKDisableLabelStyleOverrides"));

  v2->_ribbonCrispness = 0.8;
  if (MapsFeature_IsEnabled_ShelbyvilleTerrain())
    v14 = GEOConfigGetBOOL() ^ 1;
  else
    v14 = 0;
  v2->_enableAntialiasing = v14;
  v2->_textlessPOIsEnabled = 0;
  v2->_textlessPOIsMinZoom = 14.0;
  v2->_holdOntoStyleAttributes = 0;
  v2->_constantlyChangeTileGroup = 0;
  v2->_constantlyChangeTileGroupInterval = 5.0;
  v2->_disableRoadSignLimit = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_showNavLabelOverlay = objc_msgSend(v15, "BOOLForKey:", CFSTR("NavLabelOverlayKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_useMetalRenderer = objc_msgSend(v16, "BOOLForKey:", CFSTR("VKPreferOpenGLRendererKey")) ^ 1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableTrafficFeatureLabelDebugging = objc_msgSend(v17, "BOOLForKey:", CFSTR("VKEnableTrafficFeatureLabelDebuggingKey"));

  *(_WORD *)&v2->_enableRouteLineLabelingDebugging = 0;
  *(_WORD *)&v2->_enableARDebugConsole = 0;
  v2->_arOverrideDefaults = 0;
  *(_QWORD *)&v2->_arVirtualPlaneHeight = 0x425C0000BFC00000;
  v2->_arSwipeGesture = 1;
  v2->_arPinchGesture = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_arRenderAtNativeRate = objc_msgSend(v18, "BOOLForKey:", CFSTR("VKARRenderAtNativeRateKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_navDisplayRate = objc_msgSend(v19, "integerForKey:", CFSTR("VKNavDisplayRate"));

  v2->_etaLabelsAvoidScreenEdges = 1;
  v2->_etaLabelDebugOrientationMask = 15;
  v2->_paintKeysInView = 0;
  v2->_sdfGlyphShaderUpscaleFactor = 2.0;
  v2->_shouldOverrideSuperSampleKernelSize = 0;
  v2->_sdfGlyphSuperSampleKernelSize = 0.5;
  v2->_shouldUseSDFSuperSampling = 0;
  v2->_shouldUseSDFGlyphs = 0;
  *(_DWORD *)&v2->_paintStandardLabelMapData = 0;
  v2->_showShadowMapQuad = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_disableBuildingFootprints = objc_msgSend(v20, "BOOLForKey:", CFSTR("VKDisableBuildingFootprints"));

  v2->_muninOverrideParallax = 0;
  +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isPad");

  v23 = -0.1;
  if (v22)
    v23 = -0.08;
  v24 = 0.08;
  if (v22)
    v24 = 0.04;
  v2->_muninCameraPanOffset = v23;
  v2->_muninParallaxScale = v24;
  *(_QWORD *)&v2->_muninParallaxSpring = 0x3F40000041C80000;
  *(_QWORD *)&v2->_muninTransitionMinResolution = 0x3F8000003F000000;
  v2->_muninSlowMotion = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableMuninRoadNetworkMiniMap = objc_msgSend(v25, "BOOLForKey:", CFSTR("EnableMuninRoadNetworkMiniMapKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableMuninMiniMapRoadWidths = objc_msgSend(v26, "BOOLForKey:", CFSTR("EnableMuninMiniMapRoadWidthsKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableMuninMiniMapComposedEdgeRoadColoring = objc_msgSend(v27, "BOOLForKey:", CFSTR("EnableMuninMiniMapComposedEdgeRoadColoringKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableMuninMiniMapCollectionPoints = objc_msgSend(v28, "BOOLForKey:", CFSTR("EnableMuninMiniMapCollectionPointsKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableMuninMiniMapRoadZData = objc_msgSend(v29, "BOOLForKey:", CFSTR("EnableMuninMiniMapRoadZDataKey"));

  v2->_muninRoadNetworkMiniMapAreaInMeters = 750.0;
  v2->_muninIntermediatePointStep = 1;
  v2->_muninAvailabilityOverride = 0;
  v2->_lodOverride = 2;
  *(_WORD *)&v2->_intermediateLodOverride = 4;
  *(_OWORD *)&v2->_muninTapState.x = 0u;
  *(_OWORD *)&v2->_muninTapState.longitude = 0u;
  *(int32x4_t *)&v2->_defaultFovPortrait = vdupq_n_s32(0x42A00000u);
  *(_QWORD *)&v2->_minFov = 0x4120000041F00000;
  v2->_maxFovSpring = 15.0;
  *(_WORD *)&v2->_forceBumpNextTap = 0;
  v2->_slowMotionBump = 0;
  v2->_disableContinuousMultiSectionRoutes = 0;
  v2->_routeDebugPoints = 0;
  v2->_continuousMultiSectionRouteAdditionalOverlap = 0;
  v2->_debugCaptureNextGPUFrame = 0;
  debugGPUFrameCaptureURL = v2->_debugGPUFrameCaptureURL;
  v2->_debugGPUFrameCaptureURL = 0;

  *(_WORD *)&v2->_slowAnimations = 0;
  -[VKDebugSettings setLightingEnableAmbient:](v2, "setLightingEnableAmbient:", 1);
  -[VKDebugSettings setLightingEnableLight1:](v2, "setLightingEnableLight1:", 1);
  -[VKDebugSettings setLightingEnableLight2:](v2, "setLightingEnableLight2:", 1);
  -[VKDebugSettings setLightingEnableLight3:](v2, "setLightingEnableLight3:", 1);
  -[VKDebugSettings setLightingAccelerateTime:](v2, "setLightingAccelerateTime:", 0);
  *(_WORD *)&v2->_drawDaVinciHUD = 0;
  v2->_daVinciSmoothEdgeMinZ = 12;
  v2->_daVinciSmoothEdgeMinZAngle = 0.1;
  *(_WORD *)&v2->_daVinciSmoothEdgeMaxZ = 17;
  *(_OWORD *)&v2->_daVinciSaturationRangeMinOverride = xmmword_19FFB3970;
  v2->_daVinciPlanarOverride = 0;
  *(_OWORD *)&v2->_daVinciPlanarPixelPerMeterOverride = xmmword_19FFB58A0;
  *(_QWORD *)&v2->_daVinciRouteLineMaskScale = 0x416000003DCCCCCDLL;
  *(_WORD *)&v2->_daVinciAdvancedLightingEnabled = 1;
  v2->_daVinciSSAOOcclusionOnly = 0;
  *(_QWORD *)&v2->_daVinciSSAOTextureScale = 0x3F4CCCCD3ECCCCCDLL;
  v2->_ssaoMaxIntensity = 1.0;
  *(_QWORD *)&v2->_ssaoFalloffScale = 0x3D23D70A42200000;
  v2->_ssaoOverrideOn = 0;
  *(_QWORD *)&v2->_ssaoOverrideIntensity = 0x3F0000003F000000;
  v2->_daVinciGroundAmbientOcclusionEnabled = 1;
  *(_QWORD *)&v2->_daVinciGroundAmbientOcclusionIntensity = 0x3D8F5C293F000000;
  *(_WORD *)&v2->_hideBuildingsOnCollision = 0;
  v2->_daVinciOverrideElevationScaling = 0;
  v2->_daVinciElevationScalingMinZFactor = 9.5;
  v2->_daVinciElevationScalingMinZ = 3;
  v2->_daVinciElevationScalingMaxZFactor = 1.0;
  v2->_daVinciElevationScalingMaxZ = 12;
  v2->_daVinciElevationScalingNormalsOnly = 0;
  v2->_daVinciGlobeLighting = 1;
  v2->_daVinciWaterEnabled = 1;
  v2->_daVinciTintLODLevels = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_daVinciResourceOverrideEnabled = objc_msgSend(v31, "BOOLForKey:", CFSTR("VKDaVinciResourceOverrideEnabledKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_daVinciASTCTextureSideLoadEnabled = objc_msgSend(v32, "BOOLForKey:", CFSTR("VKDaVinciASTCTextureSideLoadEnabledKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableInjectedAssets = objc_msgSend(v33, "BOOLForKey:", CFSTR("VKEnableInjectedAssets"));

  v2->_daVinciLightingStylesOverrideEnabled = 0;
  v2->_daVinciTransitionDuration = 0.5;
  v2->_daVinciRoundBuildings = 1;
  v2->_daVinciBuildingRoundingRadius = 1.5;
  *(_WORD *)&v2->_daVinciColorBuildings = 257;
  v2->_daVinciPitchedGlobeTileSelection = 1;
  v2->_daVinciGlobeSplinedMaxZoom = 13.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_shadowMapResolution = objc_msgSend(v34, "integerForKey:", CFSTR("VKDaVinciShadowMapOverwrite"));

  v2->_daVinciShadowIntensity = 0.38;
  *(_DWORD *)&v2->_daVinciDrawCollisionMesh = 0;
  *(_QWORD *)&v2->_routeLineMaskWidth = 0x4080000040E00000;
  v2->_daVinciPitchScaleEnabled = 1;
  *(_OWORD *)&v2->_daVinciAtmosphereMaxHeight = xmmword_19FFB58C0;
  *(_DWORD *)&v2->_daVinciLightingDebugAlbedoOnly = 0;
  *(_WORD *)&v2->_daVinciRenderingDebugShowUVs = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableNavRoadSignOrientationDebugging = objc_msgSend(v35, "BOOLForKey:", CFSTR("EnableNavRoadSignOrientationDebuggingKey"));

  v2->_lightingCameraLocalTime = 1;
  *(_OWORD *)&v2->_buildingPOIPitchScaleMinZoom = xmmword_19FFB58D0;
  v36 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&to, &location);
  v37 = operator new();
  objc_moveWeak(&from, &to);
  v120 = 0;
  v118 = &off_1E42C7508;
  objc_moveWeak(v119, &from);
  v120 = &v118;
  objc_destroyWeak(&from);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable(v37, &VectorKitDebugConfig_LabelHighlighting, MEMORY[0x1E0C80D38], &v118);
  v38 = v120;
  if (v120 == &v118)
  {
    v39 = 4;
    v38 = &v118;
  }
  else
  {
    if (!v120)
      goto LABEL_13;
    v39 = 5;
  }
  (*v38)[v39]();
LABEL_13:
  value = (uint64_t)v2->_labelHighlightingValue.__ptr_.__value_;
  v2->_labelHighlightingValue.__ptr_.__value_ = (void *)v37;
  if (value)
  {
    v41 = md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable(value);
    MEMORY[0x1A1AF4E00](v41, 0x10A0C404982DDD9);
  }
  objc_destroyWeak(&to);

  v2->_labelHighlighting = *((_BYTE *)v2->_labelHighlightingValue.__ptr_.__value_ + 16);
  objc_copyWeak(&to, &location);
  v42 = operator new();
  objc_moveWeak(&from, &to);
  v120 = 0;
  v118 = &off_1E42C7550;
  objc_moveWeak(v119, &from);
  v120 = &v118;
  objc_destroyWeak(&from);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable(v42, &VectorKitDebugConfig_ShowLabelCounts, MEMORY[0x1E0C80D38], &v118);
  v43 = v120;
  if (v120 == &v118)
  {
    v44 = 4;
    v43 = &v118;
  }
  else
  {
    if (!v120)
      goto LABEL_20;
    v44 = 5;
  }
  (*v43)[v44]();
LABEL_20:
  v45 = (uint64_t)v2->_showLabelCountsValue.__ptr_.__value_;
  v2->_showLabelCountsValue.__ptr_.__value_ = (void *)v42;
  if (v45)
  {
    v46 = md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable(v45);
    MEMORY[0x1A1AF4E00](v46, 0x10A0C404982DDD9);
  }
  objc_destroyWeak(&to);

  v2->_paintLabelCounts = *((_BYTE *)v2->_showLabelCountsValue.__ptr_.__value_ + 16);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_labelRingAnimationEnabled = objc_msgSend(v47, "BOOLForKey:", CFSTR("VKLabelRingAnimationEnabled"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_labelShowPlaceholderIcons = objc_msgSend(v48, "BOOLForKey:", CFSTR("VKLabelShowPlaceholderIcons"));

  v2->_routeWidthEndTransitionDistance = 10.0;
  *(_QWORD *)&v2->_routeTrafficTransitionDistance = 0x4120000041A00000;
  *(_WORD *)&v2->_enableDaVinciStyleRoute = 1;
  v2->_showStaticRouteWidth = 0;
  *(_WORD *)&v2->_showClientStyleAttributes = 0;
  v2->_showNavLabelRouteAvoidanceOverlay = 0;
  v2->_showFlexZoneRanges = 0;
  *(_WORD *)&v2->_daVinciAridityGroundTintingEnabled = 257;
  v2->_daVinciMaterialRastersEnabled = 1;
  v2->_daVinciMetaTileOpacity = 0.5;
  v2->_enableARCameraDebugOverlay = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "floatForKey:", CFSTR("VKARDebugElevationOffset"));
  v2->_arCameraElevationOffset = v50;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_arEnableRouteLineDebugMeshes = objc_msgSend(v51, "BOOLForKey:", CFSTR("VKAREnableRouteLineDebugMeshes"));

  *(_WORD *)&v2->_arShowAllLabels = 0;
  *(_WORD *)&v2->_arRenderAvoidanceObjects = 0;
  v2->_arIsArrivalAnimationEnabled = 1;
  *(_OWORD *)&v2->_arManeuverDebugElevationOffset = xmmword_19FFB58F0;
  v2->_arDebugStylingPOILightIntensity = 1.0;
  *(_QWORD *)&v2->_skyOffsetAdjustment = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "floatForKey:", CFSTR("VKARAnimationPOIJumpOffset"));
  v2->_arJumpOffset = v53;

  if (v2->_arJumpOffset == 0.0)
    v2->_arJumpOffset = 2.5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatForKey:", CFSTR("VKARAnimationPOIJumpDuration"));
  v2->_arJumpDuration = v55;

  if (v2->_arJumpDuration == 0.0)
    v2->_arJumpDuration = 1.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "floatForKey:", CFSTR("VKARAnimationPOIJumpStart"));
  v2->_arJumpStart = v57;

  if (v2->_arJumpStart == 0.0)
    v2->_arJumpStart = 0.5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "floatForKey:", CFSTR("VKARAnimationPOIFallOffset"));
  v2->_arFallOffset = v59;

  if (v2->_arFallOffset == 0.0)
    v2->_arFallOffset = 0.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "floatForKey:", CFSTR("VKARAnimationPOIFallDuration"));
  v2->_arFallDuration = v61;

  if (v2->_arFallDuration == 0.0)
    v2->_arFallDuration = 1.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "floatForKey:", CFSTR("VKARAnimationPOIFallStart"));
  v2->_arFallStart = v63;

  if (v2->_arFallStart == 0.0)
    v2->_arFallStart = 1.5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "floatForKey:", CFSTR("VKARAnimationPOIRotateOffset"));
  v2->_arRotateOffset = v65;

  if (v2->_arRotateOffset == 0.0)
    v2->_arRotateOffset = 2.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "floatForKey:", CFSTR("VKARAnimationPOIRotateDuration"));
  v2->_arRotateDuration = v67;

  if (v2->_arRotateDuration == 0.0)
    v2->_arRotateDuration = 1.4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "floatForKey:", CFSTR("VKARAnimationPOIRotateStart"));
  v2->_arRotateStart = v69;

  if (v2->_arRotateStart == 0.0)
    v2->_arRotateStart = 0.6;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "floatForKey:", CFSTR("VKARAnimationPOIPulseOffset"));
  v2->_arPulseOffset = v71;

  if (v2->_arPulseOffset == 0.0)
    v2->_arPulseOffset = 1.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "floatForKey:", CFSTR("VKARAnimationPOIPulseDuration"));
  v2->_arPulseDuration = v73;

  if (v2->_arPulseDuration == 0.0)
    v2->_arPulseDuration = 0.75;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "floatForKey:", CFSTR("VKARAnimationPOIPulseStart"));
  v2->_arPulseStart = v75;

  if (v2->_arPulseStart == 0.0)
    v2->_arPulseStart = 2.5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "floatForKey:", CFSTR("VKARAnimationPOIPulseRepeats"));
  v2->_arPulseNumberOfRepeats = v77;

  if (v2->_arPulseNumberOfRepeats == 0.0)
    v2->_arPulseNumberOfRepeats = 2.0;
  *(_WORD *)&v2->_arDebugLockLocalizingState = 0;
  v2->_arAlwaysShowOneContinueLabel = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_arLabelingStateOverlay = objc_msgSend(v78, "BOOLForKey:", CFSTR("VKARLabelingStateOverlay"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_arDebugMiniMap = objc_msgSend(v79, "BOOLForKey:", CFSTR("VKARDebugMiniMap"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_arEnableEnvironmentMap = objc_msgSend(v80, "BOOLForKey:", CFSTR("VKAREnableAREnvironment"));

  if (!v2->_arEnableEnvironmentMap)
    v2->_arEnableEnvironmentMap = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "floatForKey:", CFSTR("VKARDebugMiniMapMapRectSize"));
  v2->_arDebugMiniMapMapRectSize = v82;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "floatForKey:", CFSTR("VKARDebugMapScreenRectSize"));
  v2->_arDebugMiniMapScreenRectSize = v84;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "floatForKey:", CFSTR("VKARDebugMapScreenRectXOffset"));
  v2->_arDebugMiniMapScreenRectXOffset = v86;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "floatForKey:", CFSTR("VKARDebugMapScreenRectYOffset"));
  v2->_arDebugMiniMapScreenRectYOffset = v88;

  if (v2->_arDebugMiniMapMapRectSize == 0.0)
    v2->_arDebugMiniMapMapRectSize = 250.0;
  if (v2->_arDebugMiniMapScreenRectSize == 0.0)
    v2->_arDebugMiniMapScreenRectSize = 1.0;
  if (v2->_arDebugMiniMapScreenRectXOffset == 0.0)
    v2->_arDebugMiniMapScreenRectXOffset = 0.0;
  if (v2->_arDebugMiniMapScreenRectYOffset == 0.0)
    v2->_arDebugMiniMapScreenRectYOffset = 0.5;
  v2->_arDebugSceneForcedLayoutType = 2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_arDebugScenePoiType = objc_msgSend(v89, "integerForKey:", CFSTR("VKARDebugScenePoiType"));

  if (!v2->_arDebugScenePoiType)
    v2->_arDebugScenePoiType = 209;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "floatForKey:", CFSTR("VKARDebugSceneFeatureHeading"));
  v2->_arDebugSceneFeatureHeading = v91;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "floatForKey:", CFSTR("VKARDebugSceneFeatureDistance"));
  v2->_arDebugSceneFeatureDistance = v93;

  if (v2->_arDebugSceneFeatureDistance == 0.0)
    v2->_arDebugSceneFeatureDistance = 20.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "stringForKey:", CFSTR("VKARDebugSceneFeatureText"));
  v95 = objc_claimAutoreleasedReturnValue();
  arDebugSceneFeatureText = v2->_arDebugSceneFeatureText;
  v2->_arDebugSceneFeatureText = (NSString *)v95;

  if (!v2->_arDebugSceneFeatureText)
    v2->_arDebugSceneFeatureText = (NSString *)CFSTR("123 Test St");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_arDebugSceneFeatureType = objc_msgSend(v97, "integerForKey:", CFSTR("VKARDebugSceneFeatureType"));

  v2->_arDebugDrawLabelFeatureBounds = 0;
  v2->_arDebugArrivalPointSphereScaleZ = 1.0;
  __asm { FMOV            V0.4S, #1.0 }
  *(_QWORD *)&v2->_arDebugArrivalPointSphereScaleX = _Q0;
  *(_WORD *)&v2->_arDebugUseLastStepAsArrivalLocation = 0;
  v2->_arEnableCameraFeed = 1;
  v2->_showRoutelineAnimation = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "objectForKey:", CFSTR("VKDaVinciGlobeCameraController_2"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v104 == 0;

  if (v105)
  {
    v2->_daVinciCameraController = 0;
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_daVinciCameraController = objc_msgSend(v106, "BOOLForKey:", CFSTR("VKDaVinciGlobeCameraController_2"));

  if (!v2->_daVinciCameraController)
  {
LABEL_68:
    v108 = 0;
    v107 = 1;
    goto LABEL_69;
  }
  v107 = 0;
  v108 = 1;
LABEL_69:
  v2->_daVinciBiasLatitudeGlobeTileSelection = v107;
  v2->_daVinciGlobeScalingCorrection = v108;
  v2->_daVinciCameraControllerForceMercatorZoom = 0;
  v2->_daVinciUseCollisionMesh = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_daVinciEntityDebugHighlighting = objc_msgSend(v109, "BOOLForKey:", CFSTR("VKDaVinciEntityDebugHighlight"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_compressedBuildingsDisabled = objc_msgSend(v110, "BOOLForKey:", CFSTR("VKDisableCompressedBuildings"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_mapDisplayStyleOverride = objc_msgSend(v111, "integerForKey:", CFSTR("VKMapDisplayStyleOverride"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_enableWindshieldOverrideButton = objc_msgSend(v112, "BOOLForKey:", CFSTR("VKEnableWindshieldOverrideButton"));

  v2->_enable3DPuck = 1;
  *(_QWORD *)&v2->_routeWindshieldAnimationTime = 0x3FC0000040400000;
  *(_WORD *)&v2->_showGRLDebugInfo = 0;
  v2->_enableTileClipping = 1;
  v2->_enableMipMaps = 1;
  *(_QWORD *)&v2->_anisotropy = 0x4013333300000010;
  v2->_enableDOF = 0;
  v2->_maxElevatedStrokeWidth = 32.0;
  *(_DWORD *)&v2->_daVinciSSAOEnableBlur = 257;
  *(_QWORD *)&v2->_daVinciSSAODepthThreshold = 0x140A00000;
  v2->_daVinciSSAOUpsampleDepthThreshold = 0.01;
  *(_QWORD *)&v2->_daVinciSSAOBlurriness = 0x3DCCCCCD40800000;
  *(_OWORD *)&v2->_dofStrength = xmmword_19FFB5910;
  *(_WORD *)&v2->_maskingOverlayMaskingDebugStroke = 0;
  v2->_trailDebugSelection = 0xA10F76A4400899;
  v2->_hillshadeOpacity = 0.8;
  *(_QWORD *)&v2->_hillshadeBlendMode = 0xBEA3D70A41300000;
  v2->_enableDebugSettingForHillShade = 0;
  v2->_labelDebugHoverLayers = 0;
  *(_QWORD *)&v2->_flyoverOctileLODConstant = 0x400000003EB33333;
  v2->_forceFlyoverUnificationMode = 0;
  *(_DWORD *)&v2->_enablePuckRouteLineSnapping = 16843009;
  *(_OWORD *)&v2->_toursPreloadHeadTime = xmmword_19FFB5920;
  v2->_flyoverSkipTileRendering = 0;
  v2->_flyoverGridNDCBias = -0.01;
  v2->_flyoverDrapeGrid = 0;
  v2->_paintFlyoverTiles = 0;
  *(_WORD *)&v2->_toursForceCompleteTileLoading = 256;
  objc_destroyWeak(&location);
  return v2;
}

- (void)setLightingEnableLight3:(BOOL)a3
{
  self->_lightingEnableLight3 = a3;
}

- (void)setLightingEnableLight2:(BOOL)a3
{
  self->_lightingEnableLight2 = a3;
}

- (void)setLightingEnableLight1:(BOOL)a3
{
  self->_lightingEnableLight1 = a3;
}

- (void)setLightingEnableAmbient:(BOOL)a3
{
  self->_lightingEnableAmbient = a3;
}

- (void)setLightingAccelerateTime:(BOOL)a3
{
  self->_lightingAccelerateTime = a3;
}

- (BOOL)daVinciUseCollisionMesh
{
  return self->_daVinciUseCollisionMesh;
}

- (BOOL)daVinciDrawCollisionMesh
{
  return self->_daVinciDrawCollisionMesh;
}

- (void)setDaVinciWaterEnabled:(BOOL)a3
{
  self->_daVinciWaterEnabled = a3;
}

- (void)setDaVinciRoundBuildings:(BOOL)a3
{
  self->_daVinciRoundBuildings = a3;
}

- (void)setDaVinciColorBuildings:(BOOL)a3
{
  id v3;

  if (self->_daVinciColorBuildings != a3)
  {
    self->_daVinciColorBuildings = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("VKShouldFlushTileCachesNotification"), 0);

  }
}

- (void)setDaVinciBuildingHeights:(BOOL)a3
{
  self->_daVinciBuildingHeights = a3;
}

- (void)setDaVinciAdvancedLightingEnabled:(BOOL)a3
{
  self->_daVinciAdvancedLightingEnabled = a3;
}

- (BOOL)daVinciEntityDebugHighlighting
{
  return self->_daVinciEntityDebugHighlighting;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 83) = 0u;
  *((_OWORD *)self + 82) = 0u;
  *((_DWORD *)self + 336) = 1065353216;
  *(_OWORD *)((char *)self + 1352) = 0u;
  return self;
}

- (BOOL)enableInjectedAssets
{
  return self->_enableInjectedAssets;
}

- (void)setArVirtualPlaneHeight:(float)a3
{
  self->_arVirtualPlaneHeight = a3;
}

- (void)setArDefaultHeight:(float)a3
{
  self->_arDefaultHeight = a3;
}

- (BOOL)arOverrideDefaults
{
  return self->_arOverrideDefaults;
}

- (BOOL)drawPerformanceHUD
{
  return self->_drawPerformanceHUD;
}

- (BOOL)labelStyleOverridesDisabled
{
  return self->_labelStyleOverridesDisabled;
}

- (BOOL)disableIconTextureAtlas
{
  return self->_disableIconTextureAtlas;
}

- (BOOL)enableDaVinciStyleRoute
{
  return self->_enableDaVinciStyleRoute;
}

- (BOOL)shouldDrawDebug
{
  if (self->_paintKeysInView)
    return 1;
  if (self->_paintS2KeysInView)
    return 1;
  if (self->_paintRoadTileData)
    return 1;
  if (self->_paintPolygonLayerData)
    return 1;
  if (self->_paintStandardLabelMapData)
    return 1;
  if (self->_paintMapTiles)
    return 1;
  if (self->_paintSelectedMapTiles)
    return 1;
  if (self->_paintTiles)
    return 1;
  if (self->_paintRoadBoundaries)
    return 1;
  if (self->_paintRoadTiles)
    return 1;
  if (self->_paintPoiTiles)
    return 1;
  if (self->_paintPointTiles)
    return 1;
  if (self->_paintPolygonTiles)
    return 1;
  if (self->_paintTopographicTiles)
    return 1;
  if (self->_paintLandcoverTiles)
    return 1;
  if (self->_paintVenues)
    return 1;
  if (self->_paintDaVinciTiles)
    return 1;
  if (self->_paintDaVinciBuildingTiles)
    return 1;
  if (self->_paintDrapedPolygons)
    return 1;
  if (self->_paintDaVinciMetaTiles)
    return 1;
  if (self->_paintDaVinciElevationRaster)
    return 1;
  if (self->_paintDaVinciMeshBounds)
    return 1;
  if (self->_paintDaVinciBuildingMeshBounds)
    return 1;
  if (self->_paintDaVinciTileBoundaryVerts)
    return 1;
  if (self->_paintDaVinciDecalBounds)
    return 1;
  if (self->_paintLabelRoadFeatures)
    return 1;
  if (self->_paintVertices)
    return 1;
  if (self->_paintJunctions)
    return 1;
  if (self->_paintCoastlines)
    return 1;
  if (self->_paintBuildings)
    return 1;
  if (self->_highlightRouteLineSnappingStatus)
    return 1;
  if (self->_highlightRouteLineSnappingRegion)
    return 1;
  if (self->_paintRoadsStitchedByName)
    return 1;
  if (self->_labelHighlighting)
    return 1;
  if (self->_drawDebugTransit)
    return 1;
  if (self->_paintLoadReason)
    return 1;
  if (self->_shouldFreezeLayoutCamera)
    return 1;
  return self->_showShadowMapQuad;
}

+ (id)keyPathsForValuesAffectingPreserveModelTile
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("paintTiles"), CFSTR("paintRoadBoundaries"), CFSTR("paintRoadTiles"), CFSTR("paintPoiTiles"), CFSTR("paintPointTiles"), CFSTR("paintPolygonTiles"), CFSTR("paintTopographicTiles"), CFSTR("paintLandcoverTiles"), CFSTR("paintVenues"), CFSTR("paintDaVinciMetaTiles"), CFSTR("paintVertices"), CFSTR("paintJunctions"), CFSTR("paintCoastlines"), CFSTR("paintBuildings"), CFSTR("paintLoadReason"), 0);
}

- (VKDebugLabelAnimationParameters)hideLabelAnimationParams
{
  return &self->_hideLabelAnimationParams;
}

- (VKDebugLabelAnimationParameters)showLabelAnimationParams
{
  return &self->_showLabelAnimationParams;
}

- (void)setShowNavLabelOverlay:(BOOL)a3
{
  id v4;

  self->_showNavLabelOverlay = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", self->_showNavLabelOverlay, CFSTR("NavLabelOverlayKey"));

}

- (void)setEnableNavRoadSignOrientationDebugging:(BOOL)a3
{
  id v4;

  self->_enableNavRoadSignOrientationDebugging = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", self->_enableNavRoadSignOrientationDebugging, CFSTR("EnableNavRoadSignOrientationDebuggingKey"));

}

- (void)setDrawPerformanceHUD:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v3 = a3;
  self->_drawPerformanceHUD = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("VKEnablePeformanceHUD");
  else
    v5 = CFSTR("VKDisablePeformanceHUD");
  v6 = v4;
  objc_msgSend(v4, "postNotificationName:object:", v5, 0);

}

- (void)setExpandedPerformanceHUD:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v3 = a3;
  self->_expandedPerformanceHUD = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("VKExtendedPeformanceHUD");
  else
    v5 = CFSTR("VKDMinimalPeformanceHUD");
  v6 = v4;
  objc_msgSend(v4, "postNotificationName:object:", v5, 0);

}

- (void)setPaintOverlayFoundationAssociation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_paintOverlayFoundationAssociation = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKPaintOverlayFoundationAssociation"));

}

- (BOOL)overlaysShouldDrawDebug
{
  return self->_highlightRouteLineSnappingStatus || self->_highlightRouteLineSnappingRegion;
}

- (void)setDaVinciEntityDebugHighlighting:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_daVinciEntityDebugHighlighting = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKDaVinciEntityDebugHighlight"));

}

- (void)setArDebugMiniMap:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_arDebugMiniMap = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKARDebugMiniMap"));

}

- (void)setArEnableEnvironmentMap:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_arEnableEnvironmentMap = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKAREnableAREnvironment"));

}

- (void)setArDebugMiniMapMapRectSize:(float)a3
{
  double v4;
  id v5;

  self->_arDebugMiniMapMapRectSize = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("VKARDebugMiniMapMapRectSize"), v4);

}

- (void)setArDebugMiniMapScreenRectSize:(float)a3
{
  double v4;
  id v5;

  self->_arDebugMiniMapScreenRectSize = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("VKARDebugMapScreenRectSize"), v4);

}

- (void)setArDebugMiniMapScreenRectXOffset:(float)a3
{
  double v4;
  id v5;

  self->_arDebugMiniMapScreenRectXOffset = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("VKARDebugMapScreenRectXOffset"), v4);

}

- (void)setArDebugMiniMapScreenRectYOffset:(float)a3
{
  double v4;
  id v5;

  self->_arDebugMiniMapScreenRectYOffset = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("VKARDebugMapScreenRectYOffset"), v4);

}

- (void)setArDebugScenePoiType:(unsigned int)a3
{
  id v4;

  self->_arDebugScenePoiType = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("VKARDebugScenePoiType"));

}

- (void)setArDebugSceneFeatureText:(id)a3
{
  NSString *v4;
  NSString *arDebugSceneFeatureText;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (NSString *)objc_msgSend(v7, "copy");
  arDebugSceneFeatureText = self->_arDebugSceneFeatureText;
  self->_arDebugSceneFeatureText = v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("VKARDebugSceneFeatureText"));

}

- (void)setArDebugSceneFeatureType:(unsigned __int8)a3
{
  unsigned int v3;
  id v4;

  v3 = a3;
  self->_arDebugSceneFeatureType = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", v3, CFSTR("VKARDebugSceneFeatureType"));

}

- (void)setArDebugSceneFeatureHeading:(float)a3
{
  double v4;
  id v5;

  self->_arDebugSceneFeatureHeading = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("VKARDebugSceneFeatureHeading"), v4);

}

- (void)setArDebugSceneFeatureDistance:(float)a3
{
  double v4;
  id v5;

  self->_arDebugSceneFeatureDistance = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("VKARDebugSceneFeatureDistance"), v4);

}

- (void)setArLabelingStateOverlay:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_arLabelingStateOverlay = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKARLabelingStateOverlay"));

}

- (void)setArEnableRouteLineDebugMeshes:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_arEnableRouteLineDebugMeshes = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKAREnableRouteLineDebugMeshes"));

}

- (void)setArDebugElevationOffset:(float)a3
{
  double v4;
  id v5;

  self->_arCameraElevationOffset = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("VKARDebugElevationOffset"), v4);

}

- (void)setHideDirectionalArrows:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hideDirectionalArrows = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("HideDirectionalArrowsKey"));

}

- (void)setDisableBackgroundLabelLayout:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_disableBackgroundLabelLayout = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKDisableBackgroundLabelLayout"));

}

- (void)setLabelStyleOverridesDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_labelStyleOverridesDisabled = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKDisableLabelStyleOverrides"));

}

- (void)setDisableIconTextureAtlas:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_disableIconTextureAtlas = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKDisableIconTextureAtlas"));

}

- (void)setLabelHidePointFeatures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_labelHidePointFeatures = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKLabelHidePointFeatures"));

}

- (void)setLabelHideLineFeatures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_labelHideLineFeatures = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKLabelHideLineFeatures"));

}

- (void)setLabelHidePhysicalFeatures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_labelHidePhysicalFeatures = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKLabelHidePhysicalFeatures"));

}

- (void)setLabelRingAnimationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_labelRingAnimationEnabled = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKLabelRingAnimationEnabled"));

}

- (void)setLabelShowPlaceholderIcons:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_labelShowPlaceholderIcons = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKLabelShowPlaceholderIcons"));

}

- (void)setDaVinciPitchScaleEnabled:(BOOL)a3
{
  self->_daVinciPitchScaleEnabled = a3;
}

- (void)setEnableTrafficFeatureLabelDebugging:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enableTrafficFeatureLabelDebugging = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKEnableTrafficFeatureLabelDebuggingKey"));

}

- (void)setIsInstalledInLockScreen:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;

  if (self->_isInstalledInLockScreen != a3)
  {
    self->_isInstalledInLockScreen = 1;
    v10 = "IS NOT";
    if (a3)
      v10 = "IS";
    VKLockScreenLog(CFSTR("%s installed in lock screen"), (uint64_t)a2, a3, v3, v4, v5, v6, v7, (uint64_t)v10);
    self->_isInstalledInLockScreen = a3;
  }
}

- (void)setHighlightRouteLineSnappingStatus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_highlightRouteLineSnappingStatus = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("HighlightRouteLineSnappingStatusKey"));

}

- (void)setHighlightRouteLineSnappingRegion:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_highlightRouteLineSnappingRegion = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("HighlightRouteLineSnappingRegionKey"));

}

- (void)setEnableMuninMiniMapRoadWidths:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enableMuninMiniMapRoadWidths = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("EnableMuninMiniMapRoadWidthsKey"));

}

- (void)setEnableMuninMiniMapCollectionPoints:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enableMuninMiniMapCollectionPoints = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("EnableMuninMiniMapCollectionPointsKey"));

}

- (void)setEnableMuninMiniMapRoadZData:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enableMuninMiniMapRoadZData = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("EnableMuninMiniMapRoadZDataKey"));

}

- (void)setEnableMuninMiniMapComposedEdgeRoadColoring:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enableMuninMiniMapComposedEdgeRoadColoring = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("EnableMuninMiniMapComposedEdgeRoadColoringKey"));

}

- (void)setEnableMuninRoadNetworkMiniMap:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enableMuninRoadNetworkMiniMap = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("EnableMuninRoadNetworkMiniMapKey"));

}

- (void)setCompressedBuildingsDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_compressedBuildingsDisabled = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKDisableCompressedBuildings"));

}

- (void)setShadowMapResolution:(int64_t)a3
{
  id v4;

  self->_shadowMapResolution = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("VKDaVinciShadowMapOverwrite"));

}

- (void)setDaVinciResourceOverrideEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_daVinciResourceOverrideEnabled = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKDaVinciResourceOverrideEnabledKey"));

}

- (void)setDaVinciASTCTextureSideLoadEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_daVinciASTCTextureSideLoadEnabled = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKDaVinciASTCTextureSideLoadEnabledKey"));

}

- (void)setEnableInjectedAssets:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enableInjectedAssets = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKEnableInjectedAssets"));

}

- (void)setDisableBuildingFootprints:(BOOL)a3
{
  id v4;

  self->_disableBuildingFootprints = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", self->_disableBuildingFootprints, CFSTR("VKDisableBuildingFootprints"));

}

- (unsigned)numPerformanceGroups
{
  return 32;
}

- (id)nameForPerformanceGroup:(unsigned int)a3
{
  uint64_t v4;
  __int128 v5;
  int v6;
  std::string *p_p;
  void *v8;
  std::string __p;

  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  v4 = *(_QWORD *)(ggl::Performance::Counters::instance(void)::counters + 24) + 24 * a3;
  if (*(char *)(v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v4, *(_QWORD *)(v4 + 8));
    v6 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_5;
  }
  else
  {
    v5 = *(_OWORD *)v4;
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v4 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
    v6 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_5:
      if (!v6)
        return 0;
      p_p = &__p;
      goto LABEL_10;
    }
  }
  if (!__p.__r_.__value_.__l.__size_)
  {
    v8 = 0;
LABEL_14:
    operator delete(__p.__r_.__value_.__l.__data_);
    return v8;
  }
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, __p.__r_.__value_.__r.__words[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_14;
  return v8;
}

- (void)showPerformanceGroup:(unsigned int)a3
{
  char v3;
  uint64_t v4;

  v3 = a3;
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  v4 = ggl::Performance::Counters::instance(void)::counters;
  *(_DWORD *)(ggl::Performance::Counters::instance(void)::counters + 48) |= 1 << v3;
  *(_BYTE *)(v4 + 52) = 1;
}

- (void)hidePerformanceGroup:(unsigned int)a3
{
  char v3;
  uint64_t v4;

  v3 = a3;
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  v4 = ggl::Performance::Counters::instance(void)::counters;
  *(_DWORD *)(ggl::Performance::Counters::instance(void)::counters + 48) &= ~(1 << v3);
  *(_BYTE *)(v4 + 52) = 1;
}

- (BOOL)isPerformanceGroupShown:(unsigned int)a3
{
  char v3;

  v3 = a3;
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1)
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_40952);
  return (*(_DWORD *)(ggl::Performance::Counters::instance(void)::counters + 48) >> v3) & 1;
}

- (void)addTileToPaint:(GEOTileSetRegion *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->_maxX;
  *(_QWORD *)&self->_selectedMapTilesToPaint._minY = *(_QWORD *)&a3->_minY;
  *(_OWORD *)&self->_selectedMapTilesToPaint._maxX = v3;
}

- (void)setAltitudeDisableC3mTextureLoading:(BOOL)a3
{
  id v4;

  self->_altitudeDisableC3mTextureLoading = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", self->_altitudeDisableC3mTextureLoading, CFSTR("AltitudeDisableC3mTextureLoadingKey"));

}

- (void)setUseMetalRenderer:(BOOL)a3
{
  id v4;

  self->_useMetalRenderer = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", !self->_useMetalRenderer, CFSTR("VKPreferOpenGLRendererKey"));

}

- (void)setEnableAntialiasing:(BOOL)a3
{
  self->_enableAntialiasing = a3;
}

- (void)setConstantlyChangeTileGroup:(BOOL)a3
{
  id v4;

  self->_constantlyChangeTileGroup = a3;
  -[VKDebugSettings constantlyChangeTileGroupInterval](self, "constantlyChangeTileGroupInterval");
  -[VKDebugSettings setConstantlyChangeTileGroupInterval:](self, "setConstantlyChangeTileGroupInterval:");
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstantlyChangeTileGroup:", self->_constantlyChangeTileGroup);

}

- (void)setConstantlyChangeTileGroupInterval:(double)a3
{
  id v4;

  self->_constantlyChangeTileGroupInterval = a3;
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstantlyChangeTileGroupInterval:", self->_constantlyChangeTileGroupInterval);

}

- (void)setArRenderAtNativeRate:(BOOL)a3
{
  id v4;

  self->_arRenderAtNativeRate = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", self->_arRenderAtNativeRate, CFSTR("VKARRenderAtNativeRateKey"));

}

- (void)setNavDisplayRate:(unint64_t)a3
{
  id v4;

  self->_navDisplayRate = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("VKNavDisplayRate"));

}

- (void)setDaVinciCameraController:(BOOL)a3
{
  id v5;
  id v6;

  self->_daVinciCameraController = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", self->_daVinciCameraController, CFSTR("VKDaVinciGlobeCameraController_2"));

  self->_daVinciBiasLatitudeGlobeTileSelection = !a3;
  self->_daVinciGlobeScalingCorrection = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("VKShouldFlushTileCachesNotification"), 0);

}

- (void)setForceFlyoverUnificationMode:(BOOL)a3
{
  self->_forceFlyoverUnificationMode = a3;
}

- (void)setMapDisplayStyleOverride:(unint64_t)a3
{
  id v4;

  self->_mapDisplayStyleOverride = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("VKMapDisplayStyleOverride"));

}

- (void)setEnableWindshieldOverrideButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_enableWindshieldOverrideButton = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VKEnableWindshieldOverrideButton"));

}

- (void)setLogicConsole:(unint64_t)a3 enabled:(BOOL)a4
{
  unordered_set<unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<unsigned long long>> *p_enabledLogicConsoles;

  p_enabledLogicConsoles = &self->_enabledLogicConsoles;
  if (a4)
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)p_enabledLogicConsoles, a3, a3);
  else
    std::__hash_table<std::__hash_value_type<geo::handle<md::AssociationItem>,md::Counter>,std::__unordered_map_hasher<geo::handle<md::AssociationItem>,std::__hash_value_type<geo::handle<md::AssociationItem>,md::Counter>,std::hash<geo::handle<md::AssociationItem>>,std::equal_to<geo::handle<md::AssociationItem>>,true>,std::__unordered_map_equal<geo::handle<md::AssociationItem>,std::__hash_value_type<geo::handle<md::AssociationItem>,md::Counter>,std::equal_to<geo::handle<md::AssociationItem>>,std::hash<geo::handle<md::AssociationItem>>,true>,std::allocator<std::__hash_value_type<geo::handle<md::AssociationItem>,md::Counter>>>::__erase_unique<geo::handle<md::AssociationItem>>(p_enabledLogicConsoles, a3);
}

- (void)setEnableDOF:(BOOL)a3
{
  if (self->_enableDOF != a3)
    self->_enableDOF = a3;
}

- (void)setDisableOverlayTextConsole:(BOOL)a3
{
  self->_disableOverlayTextConsole = a3;
}

- (BOOL)paintMapTiles
{
  return self->_paintMapTiles;
}

- (void)setPaintMapTiles:(BOOL)a3
{
  self->_paintMapTiles = a3;
}

- (BOOL)paintSelectedMapTiles
{
  return self->_paintSelectedMapTiles;
}

- (void)setPaintSelectedMapTiles:(BOOL)a3
{
  self->_paintSelectedMapTiles = a3;
}

- (GEOTileSetRegion)selectedMapTilesToPaint
{
  *retstr = *(GEOTileSetRegion *)&self->_minX;
  return self;
}

- (void)setSelectedMapTilesToPaint:(GEOTileSetRegion *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->_maxX;
  *(_QWORD *)&self->_selectedMapTilesToPaint._minY = *(_QWORD *)&a3->_minY;
  *(_OWORD *)&self->_selectedMapTilesToPaint._maxX = v3;
}

- (BOOL)paintTiles
{
  return self->_paintTiles;
}

- (void)setPaintTiles:(BOOL)a3
{
  self->_paintTiles = a3;
}

- (BOOL)paintRoadBoundaries
{
  return self->_paintRoadBoundaries;
}

- (void)setPaintRoadBoundaries:(BOOL)a3
{
  self->_paintRoadBoundaries = a3;
}

- (BOOL)paintRoadTiles
{
  return self->_paintRoadTiles;
}

- (void)setPaintRoadTiles:(BOOL)a3
{
  self->_paintRoadTiles = a3;
}

- (BOOL)paintPoiTiles
{
  return self->_paintPoiTiles;
}

- (void)setPaintPoiTiles:(BOOL)a3
{
  self->_paintPoiTiles = a3;
}

- (BOOL)paintPointTiles
{
  return self->_paintPointTiles;
}

- (void)setPaintPointTiles:(BOOL)a3
{
  self->_paintPointTiles = a3;
}

- (BOOL)paintPolygonTiles
{
  return self->_paintPolygonTiles;
}

- (void)setPaintPolygonTiles:(BOOL)a3
{
  self->_paintPolygonTiles = a3;
}

- (BOOL)paintTopographicTiles
{
  return self->_paintTopographicTiles;
}

- (void)setPaintTopographicTiles:(BOOL)a3
{
  self->_paintTopographicTiles = a3;
}

- (BOOL)paintLandcoverTiles
{
  return self->_paintLandcoverTiles;
}

- (void)setPaintLandcoverTiles:(BOOL)a3
{
  self->_paintLandcoverTiles = a3;
}

- (BOOL)paintVenues
{
  return self->_paintVenues;
}

- (void)setPaintVenues:(BOOL)a3
{
  self->_paintVenues = a3;
}

- (BOOL)hideBuildingsOnCollision
{
  return self->_hideBuildingsOnCollision;
}

- (void)setHideBuildingsOnCollision:(BOOL)a3
{
  self->_hideBuildingsOnCollision = a3;
}

- (BOOL)hideAssetsOnCollision
{
  return self->_hideAssetsOnCollision;
}

- (void)setHideAssetsOnCollision:(BOOL)a3
{
  self->_hideAssetsOnCollision = a3;
}

- (BOOL)paintDaVinciTiles
{
  return self->_paintDaVinciTiles;
}

- (void)setPaintDaVinciTiles:(BOOL)a3
{
  self->_paintDaVinciTiles = a3;
}

- (BOOL)paintFlyoverTiles
{
  return self->_paintFlyoverTiles;
}

- (void)setPaintFlyoverTiles:(BOOL)a3
{
  self->_paintFlyoverTiles = a3;
}

- (BOOL)paintDaVinciBuildingTiles
{
  return self->_paintDaVinciBuildingTiles;
}

- (void)setPaintDaVinciBuildingTiles:(BOOL)a3
{
  self->_paintDaVinciBuildingTiles = a3;
}

- (BOOL)paintDrapedPolygons
{
  return self->_paintDrapedPolygons;
}

- (void)setPaintDrapedPolygons:(BOOL)a3
{
  self->_paintDrapedPolygons = a3;
}

- (BOOL)paintDaVinciMetaTiles
{
  return self->_paintDaVinciMetaTiles;
}

- (void)setPaintDaVinciMetaTiles:(BOOL)a3
{
  self->_paintDaVinciMetaTiles = a3;
}

- (float)daVinciMetaTileOpacity
{
  return self->_daVinciMetaTileOpacity;
}

- (void)setDaVinciMetaTileOpacity:(float)a3
{
  self->_daVinciMetaTileOpacity = a3;
}

- (BOOL)paintDaVinciMeshBounds
{
  return self->_paintDaVinciMeshBounds;
}

- (void)setPaintDaVinciMeshBounds:(BOOL)a3
{
  self->_paintDaVinciMeshBounds = a3;
}

- (BOOL)paintDaVinciBuildingMeshBounds
{
  return self->_paintDaVinciBuildingMeshBounds;
}

- (void)setPaintDaVinciBuildingMeshBounds:(BOOL)a3
{
  self->_paintDaVinciBuildingMeshBounds = a3;
}

- (BOOL)paintDaVinciTileBoundaryVerts
{
  return self->_paintDaVinciTileBoundaryVerts;
}

- (void)setPaintDaVinciTileBoundaryVerts:(BOOL)a3
{
  self->_paintDaVinciTileBoundaryVerts = a3;
}

- (BOOL)paintDaVinciDecalBounds
{
  return self->_paintDaVinciDecalBounds;
}

- (void)setPaintDaVinciDecalBounds:(BOOL)a3
{
  self->_paintDaVinciDecalBounds = a3;
}

- (BOOL)paintDaVinciElevationRaster
{
  return self->_paintDaVinciElevationRaster;
}

- (void)setPaintDaVinciElevationRaster:(BOOL)a3
{
  self->_paintDaVinciElevationRaster = a3;
}

- (BOOL)paintVertices
{
  return self->_paintVertices;
}

- (void)setPaintVertices:(BOOL)a3
{
  self->_paintVertices = a3;
}

- (BOOL)paintJunctions
{
  return self->_paintJunctions;
}

- (void)setPaintJunctions:(BOOL)a3
{
  self->_paintJunctions = a3;
}

- (BOOL)paintCoastlines
{
  return self->_paintCoastlines;
}

- (void)setPaintCoastlines:(BOOL)a3
{
  self->_paintCoastlines = a3;
}

- (BOOL)paintBuildings
{
  return self->_paintBuildings;
}

- (void)setPaintBuildings:(BOOL)a3
{
  self->_paintBuildings = a3;
}

- (BOOL)paintLoadReason
{
  return self->_paintLoadReason;
}

- (void)setPaintLoadReason:(BOOL)a3
{
  self->_paintLoadReason = a3;
}

- (void)setDisableRoute:(BOOL)a3
{
  self->_disableRoute = a3;
}

- (void)setLabelHighlighting:(BOOL)a3
{
  self->_labelHighlighting = a3;
}

- (void)setLockLabelHighlighting:(BOOL)a3
{
  self->_lockLabelHighlighting = a3;
}

- (void)setShowClientStyleAttributes:(BOOL)a3
{
  self->_showClientStyleAttributes = a3;
}

- (void)setShowLabelsNavState:(BOOL)a3
{
  self->_showLabelsNavState = a3;
}

- (void)setShowFlexZoneRanges:(BOOL)a3
{
  self->_showFlexZoneRanges = a3;
}

- (BOOL)transitHighlighting
{
  return self->_transitHighlighting;
}

- (void)setTransitHighlighting:(BOOL)a3
{
  self->_transitHighlighting = a3;
}

- (void)setLabelFacingCullDisabled:(BOOL)a3
{
  self->_labelFacingCullDisabled = a3;
}

- (void)setLabelDedupingDisabled:(BOOL)a3
{
  self->_labelDedupingDisabled = a3;
}

- (void)setLabelCollisionDisabled:(BOOL)a3
{
  self->_labelCollisionDisabled = a3;
}

- (void)setLabelCollideContinuously:(BOOL)a3
{
  self->_labelCollideContinuously = a3;
}

- (void)setLabelFlipAlternatePositionsEnable:(BOOL)a3
{
  self->_labelFlipAlternatePositionsEnable = a3;
}

- (void)setLabelTileDecodeEnabled:(BOOL)a3
{
  self->_labelTileDecodeEnabled = a3;
}

- (void)setLabelAllowDefaultStyle:(BOOL)a3
{
  self->_labelAllowDefaultStyle = a3;
}

- (BOOL)labelUseDefaultStyle
{
  return self->_labelUseDefaultStyle;
}

- (void)setLabelUseDefaultStyle:(BOOL)a3
{
  self->_labelUseDefaultStyle = a3;
}

- (void)setLabelAllowDefaultIcon:(BOOL)a3
{
  self->_labelAllowDefaultIcon = a3;
}

- (void)setLabelUpdateMapTilesContinuously:(BOOL)a3
{
  self->_labelUpdateMapTilesContinuously = a3;
}

- (BOOL)enableDitherTransparency
{
  return self->_enableDitherTransparency;
}

- (void)setEnableDitherTransparency:(BOOL)a3
{
  self->_enableDitherTransparency = a3;
}

- (void)setLabelAutoOffsetRoadText:(BOOL)a3
{
  self->_labelAutoOffsetRoadText = a3;
}

- (BOOL)labelPOIUpdatesDisabled
{
  return self->_labelPOIUpdatesDisabled;
}

- (void)setLabelPOIUpdatesDisabled:(BOOL)a3
{
  self->_labelPOIUpdatesDisabled = a3;
}

- (void)setDontMatchRouteLine:(BOOL)a3
{
  self->_dontMatchRouteLine = a3;
}

- (BOOL)dontMapMatchToSnappedRouteLine
{
  return self->_dontMapMatchToSnappedRouteLine;
}

- (void)setDontMapMatchToSnappedRouteLine:(BOOL)a3
{
  self->_dontMapMatchToSnappedRouteLine = a3;
}

- (BOOL)highlightRouteLineSnappingStatus
{
  return self->_highlightRouteLineSnappingStatus;
}

- (BOOL)dontVerifyRouteToTransitSnapping
{
  return self->_dontVerifyRouteToTransitSnapping;
}

- (void)setDontVerifyRouteToTransitSnapping:(BOOL)a3
{
  self->_dontVerifyRouteToTransitSnapping = a3;
}

- (BOOL)showManeuverPoints
{
  return self->_showManeuverPoints;
}

- (void)setShowManeuverPoints:(BOOL)a3
{
  self->_showManeuverPoints = a3;
}

- (BOOL)paintRoadSigns
{
  return self->_paintRoadSigns;
}

- (void)setPaintRoadSigns:(BOOL)a3
{
  self->_paintRoadSigns = a3;
}

- (BOOL)paintLabelBounds
{
  return self->_paintLabelBounds;
}

- (void)setPaintLabelBounds:(BOOL)a3
{
  self->_paintLabelBounds = a3;
}

- (void)setPaintLabelRoadFeatures:(BOOL)a3
{
  self->_paintLabelRoadFeatures = a3;
}

- (void)setPaintLabelCollisionLines:(BOOL)a3
{
  self->_paintLabelCollisionLines = a3;
}

- (void)setDisplayTextureAtlas:(BOOL)a3
{
  self->_displayTextureAtlas = a3;
}

- (void)setTextureAtlasIndex:(unsigned __int8)a3
{
  self->_textureAtlasIndex = a3;
}

- (void)setTextureAtlasPageIndex:(unsigned __int16)a3
{
  self->_textureAtlasPageIndex = a3;
}

- (void)setPaintLabelCounts:(BOOL)a3
{
  self->_paintLabelCounts = a3;
}

- (void)setLabelerOutputIndex:(unsigned __int8)a3
{
  self->_labelerOutputIndex = a3;
}

- (BOOL)paintTransitCounts
{
  return self->_paintTransitCounts;
}

- (void)setPaintTransitCounts:(BOOL)a3
{
  self->_paintTransitCounts = a3;
}

- (void)setTextlessPOIsEnabled:(BOOL)a3
{
  self->_textlessPOIsEnabled = a3;
}

- (void)setTextlessPOIsMinZoom:(float)a3
{
  self->_textlessPOIsMinZoom = a3;
}

- (BOOL)loadGreenTraffic
{
  return self->_loadGreenTraffic;
}

- (void)setLoadGreenTraffic:(BOOL)a3
{
  self->_loadGreenTraffic = a3;
}

- (BOOL)useStaticTrafficFeed
{
  return self->_useStaticTrafficFeed;
}

- (void)setUseStaticTrafficFeed:(BOOL)a3
{
  self->_useStaticTrafficFeed = a3;
}

- (void)setShowTrafficCasing:(BOOL)a3
{
  self->_showTrafficCasing = a3;
}

- (BOOL)texturedTrafficCasing
{
  return self->_texturedTrafficCasing;
}

- (void)setTexturedTrafficCasing:(BOOL)a3
{
  self->_texturedTrafficCasing = a3;
}

- (void)setPrioritizeTrafficSkeleton:(BOOL)a3
{
  self->_prioritizeTrafficSkeleton = a3;
}

- (BOOL)paintRoadsStitchedByName
{
  return self->_paintRoadsStitchedByName;
}

- (void)setPaintRoadsStitchedByName:(BOOL)a3
{
  self->_paintRoadsStitchedByName = a3;
}

- (BOOL)realisticWireframeEnabled
{
  return self->_realisticWireframeEnabled;
}

- (void)setRealisticWireframeEnabled:(BOOL)a3
{
  self->_realisticWireframeEnabled = a3;
}

- (BOOL)altitudePauseLoading
{
  return self->_altitudePauseLoading;
}

- (void)setAltitudePauseLoading:(BOOL)a3
{
  self->_altitudePauseLoading = a3;
}

- (BOOL)altitudeFreezeViewNode
{
  return self->_altitudeFreezeViewNode;
}

- (void)setAltitudeFreezeViewNode:(BOOL)a3
{
  self->_altitudeFreezeViewNode = a3;
}

- (BOOL)altitudeTexturePaging
{
  return self->_altitudeTexturePaging;
}

- (void)setAltitudeTexturePaging:(BOOL)a3
{
  self->_altitudeTexturePaging = a3;
}

- (BOOL)altitudeShowTileBounds
{
  return self->_altitudeShowTileBounds;
}

- (void)setAltitudeShowTileBounds:(BOOL)a3
{
  self->_altitudeShowTileBounds = a3;
}

- (BOOL)altitudeMipmapSatellite
{
  return self->_altitudeMipmapSatellite;
}

- (void)setAltitudeMipmapSatellite:(BOOL)a3
{
  self->_altitudeMipmapSatellite = a3;
}

- (BOOL)altitudeMipmapFlyover
{
  return self->_altitudeMipmapFlyover;
}

- (void)setAltitudeMipmapFlyover:(BOOL)a3
{
  self->_altitudeMipmapFlyover = a3;
}

- (BOOL)altitudeMipmapObjectTree
{
  return self->_altitudeMipmapObjectTree;
}

- (void)setAltitudeMipmapObjectTree:(BOOL)a3
{
  self->_altitudeMipmapObjectTree = a3;
}

- (BOOL)altitudeShowNightLight
{
  return self->_altitudeShowNightLight;
}

- (void)setAltitudeShowNightLight:(BOOL)a3
{
  self->_altitudeShowNightLight = a3;
}

- (BOOL)altitudePrintRenderedTilesStat
{
  return self->_altitudePrintRenderedTilesStat;
}

- (void)setAltitudePrintRenderedTilesStat:(BOOL)a3
{
  self->_altitudePrintRenderedTilesStat = a3;
}

- (BOOL)altitudeDisableC3mTextureLoading
{
  return self->_altitudeDisableC3mTextureLoading;
}

- (float)skyOffsetAdjustment
{
  return self->_skyOffsetAdjustment;
}

- (void)setSkyOffsetAdjustment:(float)a3
{
  self->_skyOffsetAdjustment = a3;
}

- (float)gridZAdjustment
{
  return self->_gridZAdjustment;
}

- (void)setGridZAdjustment:(float)a3
{
  self->_gridZAdjustment = a3;
}

- (BOOL)altitudeShowTriggerBounds
{
  return self->_altitudeShowTriggerbounds;
}

- (void)setAltitudeShowTriggerBounds:(BOOL)a3
{
  self->_altitudeShowTriggerbounds = a3;
}

- (BOOL)altitudeHighResSatellite
{
  return self->_altitudeHighResSatellite;
}

- (void)setAltitudeHighResSatellite:(BOOL)a3
{
  self->_altitudeHighResSatellite = a3;
}

- (BOOL)disableTransitLineDrawing
{
  return self->_disableTransitLineDrawing;
}

- (void)setDisableTransitLineDrawing:(BOOL)a3
{
  self->_disableTransitLineDrawing = a3;
}

- (BOOL)disableTransitLineMerging
{
  return self->_disableTransitLineMerging;
}

- (void)setDisableTransitLineMerging:(BOOL)a3
{
  self->_disableTransitLineMerging = a3;
}

- (BOOL)disableTransitLineGroupMerging
{
  return self->_disableTransitLineGroupMerging;
}

- (void)setDisableTransitLineGroupMerging:(BOOL)a3
{
  self->_disableTransitLineGroupMerging = a3;
}

- (BOOL)dumpTransitTileContents
{
  return self->_dumpTransitTileContents;
}

- (void)setDumpTransitTileContents:(BOOL)a3
{
  self->_dumpTransitTileContents = a3;
}

- (BOOL)dumpRouteAndPath
{
  return self->_dumpRouteAndPath;
}

- (void)setDumpRouteAndPath:(BOOL)a3
{
  self->_dumpRouteAndPath = a3;
}

- (BOOL)disableIntraLinkTransitLineCrossings
{
  return self->_disableIntraLinkTransitLineCrossings;
}

- (void)setDisableIntraLinkTransitLineCrossings:(BOOL)a3
{
  self->_disableIntraLinkTransitLineCrossings = a3;
}

- (BOOL)useMetalRenderer
{
  return self->_useMetalRenderer;
}

- (BOOL)navCameraForceComplexIntersection
{
  return self->_navCameraForceComplexIntersection;
}

- (void)setNavCameraForceComplexIntersection:(BOOL)a3
{
  self->_navCameraForceComplexIntersection = a3;
}

- (void)setRibbonCrispness:(float)a3
{
  self->_ribbonCrispness = a3;
}

- (BOOL)highlightUndergroundRouteGeometry
{
  return self->_highlightUndergroundRouteGeometry;
}

- (void)setHighlightUndergroundRouteGeometry:(BOOL)a3
{
  self->_highlightUndergroundRouteGeometry = a3;
}

- (float)routeTrafficTransitionDistance
{
  return self->_routeTrafficTransitionDistance;
}

- (void)setRouteTrafficTransitionDistance:(float)a3
{
  self->_routeTrafficTransitionDistance = a3;
}

- (float)routeWidthStartTransitionDistance
{
  return self->_routeWidthStartTransitionDistance;
}

- (void)setRouteWidthStartTransitionDistance:(float)a3
{
  self->_routeWidthStartTransitionDistance = a3;
}

- (float)routeWidthEndTransitionDistance
{
  return self->_routeWidthEndTransitionDistance;
}

- (void)setRouteWidthEndTransitionDistance:(float)a3
{
  self->_routeWidthEndTransitionDistance = a3;
}

- (void)setEnableDaVinciStyleRoute:(BOOL)a3
{
  self->_enableDaVinciStyleRoute = a3;
}

- (BOOL)enableDynamicRouteWidth
{
  return self->_enableDynamicRouteWidth;
}

- (void)setEnableDynamicRouteWidth:(BOOL)a3
{
  self->_enableDynamicRouteWidth = a3;
}

- (void)setShowStaticRouteWidth:(BOOL)a3
{
  self->_showStaticRouteWidth = a3;
}

- (float)altitudeLodScale
{
  return self->_altitudeLodScale;
}

- (void)setAltitudeLodScale:(float)a3
{
  self->_altitudeLodScale = a3;
}

- (float)altitudeTileQualityThreshold
{
  return self->_altitudeTileQualityThreshold;
}

- (void)setAltitudeTileQualityThreshold:(float)a3
{
  self->_altitudeTileQualityThreshold = a3;
}

- (float)altitudeHideMeshTime
{
  return self->_altitudeHideMeshTime;
}

- (void)setAltitudeHideMeshTime:(float)a3
{
  self->_altitudeHideMeshTime = a3;
}

- (float)altitudeFadeSpeed
{
  return self->_altitudeFadeSpeed;
}

- (void)setAltitudeFadeSpeed:(float)a3
{
  self->_altitudeFadeSpeed = a3;
}

- (BOOL)altitudeTourSpeedup
{
  return self->_altitudeTourSpeedup;
}

- (void)setAltitudeTourSpeedup:(BOOL)a3
{
  self->_altitudeTourSpeedup = a3;
}

- (float)altitudeTourSpeedupFactor
{
  return self->_altitudeTourSpeedupFactor;
}

- (void)setAltitudeTourSpeedupFactor:(float)a3
{
  self->_altitudeTourSpeedupFactor = a3;
}

- (BOOL)isInstalledInLockScreen
{
  return self->_isInstalledInLockScreen;
}

- (void)setEnableLoggingInLockScreen:(BOOL)a3
{
  self->_enableLoggingInLockScreen = a3;
}

- (BOOL)useBuildingShadowTexture
{
  return self->_useBuildingShadowTexture;
}

- (void)setUseBuildingShadowTexture:(BOOL)a3
{
  self->_useBuildingShadowTexture = a3;
}

- (void)setLayoutContinuously:(BOOL)a3
{
  self->_layoutContinuously = a3;
}

- (void)setDisableStylesheetAnimations:(BOOL)a3
{
  self->_disableStylesheetAnimations = a3;
}

- (BOOL)expandedPerformanceHUD
{
  return self->_expandedPerformanceHUD;
}

- (BOOL)trackingCameraZoomFurther
{
  return self->_trackingCameraZoomFurther;
}

- (void)setTrackingCameraZoomFurther:(BOOL)a3
{
  self->_trackingCameraZoomFurther = a3;
}

- (BOOL)holdOntoStyleAttributes
{
  return self->_holdOntoStyleAttributes;
}

- (void)setHoldOntoStyleAttributes:(BOOL)a3
{
  self->_holdOntoStyleAttributes = a3;
}

- (BOOL)drawDebugTransit
{
  return self->_drawDebugTransit;
}

- (void)setDrawDebugTransit:(BOOL)a3
{
  self->_drawDebugTransit = a3;
}

- (void)setLabelTransitLineCollisionEnabled:(BOOL)a3
{
  self->_labelTransitLineCollisionEnabled = a3;
}

- (void)setLabelHighlightingVerboseLoggingEnabled:(BOOL)a3
{
  self->_labelHighlightingVerboseLoggingEnabled = a3;
}

- (void)setLabelHighlightingTransitFeaturesOnly:(BOOL)a3
{
  self->_labelHighlightingTransitFeaturesOnly = a3;
}

- (void)setLabelOcclusionDisabled:(BOOL)a3
{
  self->_labelOcclusionDisabled = a3;
}

- (void)setDebugOverlayOffsetX:(int)a3
{
  self->_debugOverlayOffsetX = a3;
}

- (void)setDebugOverlayOffsetY:(int)a3
{
  self->_debugOverlayOffsetY = a3;
}

- (BOOL)paintOverlayFoundationAssociation
{
  return self->_paintOverlayFoundationAssociation;
}

- ($25311016DA3E46AB78CD7EC23DF2C833)landmark2DStrokeSettings
{
  float maxAngle;
  uint64_t v3;
  $25311016DA3E46AB78CD7EC23DF2C833 result;

  maxAngle = self->_landmark2DStrokeSettings.maxAngle;
  v3 = *(_QWORD *)&self->_landmark2DStrokeSettings.borders;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = *((float *)&v3 + 1);
  result.var4 = maxAngle;
  return result;
}

- (void)setLandmark2DStrokeSettings:(id)a3
{
  self->_landmark2DStrokeSettings = ($3D5FDE895075FE5374A9954EBA22A7BA)a3;
}

- (void)setShouldUseTestTileLoader:(BOOL)a3
{
  self->_shouldUseTestTileLoader = a3;
}

- (BOOL)constantlyChangeTileGroup
{
  return self->_constantlyChangeTileGroup;
}

- (double)constantlyChangeTileGroupInterval
{
  return self->_constantlyChangeTileGroupInterval;
}

- (void)setDisableRoadSignLimit:(BOOL)a3
{
  self->_disableRoadSignLimit = a3;
}

- (BOOL)showNavLabelOverlay
{
  return self->_showNavLabelOverlay;
}

- (BOOL)showNavLabelRouteAvoidanceOverlay
{
  return self->_showNavLabelRouteAvoidanceOverlay;
}

- (void)setShowNavLabelRouteAvoidanceOverlay:(BOOL)a3
{
  self->_showNavLabelRouteAvoidanceOverlay = a3;
}

- (void)setEnableRouteLineLabelingDebugging:(BOOL)a3
{
  self->_enableRouteLineLabelingDebugging = a3;
}

- (void)setDisableRouteAnnotationLimit:(BOOL)a3
{
  self->_disableRouteAnnotationLimit = a3;
}

- (void)setEnableEtaLabelDebugging:(BOOL)a3
{
  self->_enableEtaLabelDebugging = a3;
}

- (void)setEnableRouteShareSectionDebugging:(BOOL)a3
{
  self->_enableRouteShareSectionDebugging = a3;
}

- (void)setEnableEtaLabelRectDebugging:(BOOL)a3
{
  self->_enableEtaLabelRectDebugging = a3;
}

- (unint64_t)etaLabelDebugScore
{
  return self->_etaLabelDebugScore;
}

- (void)setEtaLabelDebugScore:(unint64_t)a3
{
  self->_etaLabelDebugScore = a3;
}

- (unsigned)etaLabelDebugOrientationMask
{
  return self->_etaLabelDebugOrientationMask;
}

- (void)setEtaLabelDebugOrientationMask:(unsigned int)a3
{
  self->_etaLabelDebugOrientationMask = a3;
}

- (BOOL)enableRouteIntersectionTesting
{
  return self->_enableRouteIntersectionTesting;
}

- (void)setEnableRouteIntersectionTesting:(BOOL)a3
{
  self->_enableRouteIntersectionTesting = a3;
}

- (BOOL)etaLabelsAvoidScreenEdges
{
  return self->_etaLabelsAvoidScreenEdges;
}

- (void)setEtaLabelsAvoidScreenEdges:(BOOL)a3
{
  self->_etaLabelsAvoidScreenEdges = a3;
}

- (BOOL)forceEtaLabelPlacement
{
  return self->_forceEtaLabelPlacement;
}

- (void)setForceEtaLabelPlacement:(BOOL)a3
{
  self->_forceEtaLabelPlacement = a3;
}

- (BOOL)traceEtaDebugLog
{
  return self->_traceEtaDebugLog;
}

- (void)setTraceEtaDebugLog:(BOOL)a3
{
  self->_traceEtaDebugLog = a3;
}

- (BOOL)enableARDebugConsole
{
  return self->_enableARDebugConsole;
}

- (void)setEnableARDebugConsole:(BOOL)a3
{
  self->_enableARDebugConsole = a3;
}

- (BOOL)enableAROmniTileLoader
{
  return self->_enableAROmniTileLoader;
}

- (void)setEnableAROmniTileLoader:(BOOL)a3
{
  self->_enableAROmniTileLoader = a3;
}

- (void)setArOverrideDefaults:(BOOL)a3
{
  self->_arOverrideDefaults = a3;
}

- (float)arVirtualPlaneHeight
{
  return self->_arVirtualPlaneHeight;
}

- (float)arDefaultHeight
{
  return self->_arDefaultHeight;
}

- (unint64_t)arSwipeGesture
{
  return self->_arSwipeGesture;
}

- (void)setArSwipeGesture:(unint64_t)a3
{
  self->_arSwipeGesture = a3;
}

- (unint64_t)arPinchGesture
{
  return self->_arPinchGesture;
}

- (void)setArPinchGesture:(unint64_t)a3
{
  self->_arPinchGesture = a3;
}

- (BOOL)arRenderAtNativeRate
{
  return self->_arRenderAtNativeRate;
}

- (unint64_t)navDisplayRate
{
  return self->_navDisplayRate;
}

- (BOOL)paintKeysInView
{
  return self->_paintKeysInView;
}

- (void)setPaintKeysInView:(BOOL)a3
{
  self->_paintKeysInView = a3;
}

- (BOOL)paintS2KeysInView
{
  return self->_paintS2KeysInView;
}

- (void)setPaintS2KeysInView:(BOOL)a3
{
  self->_paintS2KeysInView = a3;
}

- (BOOL)paintStandardLabelMapData
{
  return self->_paintStandardLabelMapData;
}

- (void)setPaintStandardLabelMapData:(BOOL)a3
{
  self->_paintStandardLabelMapData = a3;
}

- (BOOL)paintPolygonLayerData
{
  return self->_paintPolygonLayerData;
}

- (void)setPaintPolygonLayerData:(BOOL)a3
{
  self->_paintPolygonLayerData = a3;
}

- (BOOL)paintRoadTileData
{
  return self->_paintRoadTileData;
}

- (void)setPaintRoadTileData:(BOOL)a3
{
  self->_paintRoadTileData = a3;
}

- (void)setEnableRoadSignArtworkDebugging:(BOOL)a3
{
  self->_enableRoadSignArtworkDebugging = a3;
}

- (BOOL)showShadowMapQuad
{
  return self->_showShadowMapQuad;
}

- (void)setShowShadowMapQuad:(BOOL)a3
{
  self->_showShadowMapQuad = a3;
}

- (BOOL)muninDebugLayer
{
  return self->_muninDebugLayer;
}

- (void)setMuninDebugLayer:(BOOL)a3
{
  self->_muninDebugLayer = a3;
}

- (BOOL)muninGraphConnections
{
  return self->_muninGraphConnections;
}

- (void)setMuninGraphConnections:(BOOL)a3
{
  self->_muninGraphConnections = a3;
}

- (BOOL)muninShowRigTransitionInfo
{
  return self->_muninShowRigTransitionInfo;
}

- (void)setMuninShowRigTransitionInfo:(BOOL)a3
{
  self->_muninShowRigTransitionInfo = a3;
}

- (BOOL)muninShowLODInfo
{
  return self->_muninShowLODInfo;
}

- (void)setMuninShowLODInfo:(BOOL)a3
{
  self->_muninShowLODInfo = a3;
}

- (BOOL)muninIgnorePlacesMetadata
{
  return self->_muninIgnorePlacesMetadata;
}

- (void)setMuninIgnorePlacesMetadata:(BOOL)a3
{
  self->_muninIgnorePlacesMetadata = a3;
}

- (BOOL)muninOverrideParallax
{
  return self->_muninOverrideParallax;
}

- (void)setMuninOverrideParallax:(BOOL)a3
{
  self->_muninOverrideParallax = a3;
}

- (float)muninCameraPanOffset
{
  return self->_muninCameraPanOffset;
}

- (void)setMuninCameraPanOffset:(float)a3
{
  self->_muninCameraPanOffset = a3;
}

- (float)muninParallaxSpring
{
  return self->_muninParallaxSpring;
}

- (void)setMuninParallaxSpring:(float)a3
{
  self->_muninParallaxSpring = a3;
}

- (float)muninParallaxDamper
{
  return self->_muninParallaxDamper;
}

- (void)setMuninParallaxDamper:(float)a3
{
  self->_muninParallaxDamper = a3;
}

- (float)muninParallaxScale
{
  return self->_muninParallaxScale;
}

- (void)setMuninParallaxScale:(float)a3
{
  self->_muninParallaxScale = a3;
}

- (float)muninTransitionMinResolution
{
  return self->_muninTransitionMinResolution;
}

- (void)setMuninTransitionMinResolution:(float)a3
{
  self->_muninTransitionMinResolution = a3;
}

- (float)muninTransitionMaxResolution
{
  return self->_muninTransitionMaxResolution;
}

- (void)setMuninTransitionMaxResolution:(float)a3
{
  self->_muninTransitionMaxResolution = a3;
}

- (BOOL)muninSlowMotion
{
  return self->_muninSlowMotion;
}

- (void)setMuninSlowMotion:(BOOL)a3
{
  self->_muninSlowMotion = a3;
}

- (BOOL)enableMuninRoadNetworkMiniMap
{
  return self->_enableMuninRoadNetworkMiniMap;
}

- (float)muninRoadNetworkMiniMapAreaInMeters
{
  return self->_muninRoadNetworkMiniMapAreaInMeters;
}

- (void)setMuninRoadNetworkMiniMapAreaInMeters:(float)a3
{
  self->_muninRoadNetworkMiniMapAreaInMeters = a3;
}

- (BOOL)enableMuninMiniMapRoadWidths
{
  return self->_enableMuninMiniMapRoadWidths;
}

- (BOOL)enableMuninMiniMapComposedEdgeRoadColoring
{
  return self->_enableMuninMiniMapComposedEdgeRoadColoring;
}

- (BOOL)enableMuninMiniMapCollectionPoints
{
  return self->_enableMuninMiniMapCollectionPoints;
}

- (BOOL)enableMuninMiniMapRoadZData
{
  return self->_enableMuninMiniMapRoadZData;
}

- (unint64_t)muninIntermediatePointStep
{
  return self->_muninIntermediatePointStep;
}

- (void)setMuninIntermediatePointStep:(unint64_t)a3
{
  self->_muninIntermediatePointStep = a3;
}

- (unint64_t)muninAvailabilityOverride
{
  return self->_muninAvailabilityOverride;
}

- (void)setMuninAvailabilityOverride:(unint64_t)a3
{
  self->_muninAvailabilityOverride = a3;
}

- (BOOL)overrideLod
{
  return self->_overrideLod;
}

- (void)setOverrideLod:(BOOL)a3
{
  self->_overrideLod = a3;
}

- (unsigned)lodOverride
{
  return self->_lodOverride;
}

- (void)setLodOverride:(unsigned __int8)a3
{
  self->_lodOverride = a3;
}

- (BOOL)overrideIntermediateLod
{
  return self->_overrideIntermediateLod;
}

- (void)setOverrideIntermediateLod:(BOOL)a3
{
  self->_overrideIntermediateLod = a3;
}

- (unsigned)intermediateLodOverride
{
  return self->_intermediateLodOverride;
}

- (void)setIntermediateLodOverride:(unsigned __int8)a3
{
  self->_intermediateLodOverride = a3;
}

- (BOOL)muninReplayLastTap
{
  return self->_muninReplayLastTap;
}

- (void)setMuninReplayLastTap:(BOOL)a3
{
  self->_muninReplayLastTap = a3;
}

- ($9DB4204096BA361EBCEA4D052588F96C)muninTapState
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[12].var0;
  *(_OWORD *)&retstr->var3 = v3;
  return self;
}

- (void)setMuninTapState:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_muninTapState.x = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_muninTapState.longitude = v3;
}

- (BOOL)muninOverrideFov
{
  return self->_muninOverrideFov;
}

- (void)setMuninOverrideFov:(BOOL)a3
{
  self->_muninOverrideFov = a3;
}

- (float)defaultFovPortrait
{
  return self->_defaultFovPortrait;
}

- (void)setDefaultFovPortrait:(float)a3
{
  self->_defaultFovPortrait = a3;
}

- (float)maxFovPortrait
{
  return self->_maxFovPortrait;
}

- (void)setMaxFovPortrait:(float)a3
{
  self->_maxFovPortrait = a3;
}

- (float)defaultFovLandscape
{
  return self->_defaultFovLandscape;
}

- (void)setDefaultFovLandscape:(float)a3
{
  self->_defaultFovLandscape = a3;
}

- (float)maxFovLandscape
{
  return self->_maxFovLandscape;
}

- (void)setMaxFovLandscape:(float)a3
{
  self->_maxFovLandscape = a3;
}

- (float)minFov
{
  return self->_minFov;
}

- (void)setMinFov:(float)a3
{
  self->_minFov = a3;
}

- (float)minFovSpring
{
  return self->_minFovSpring;
}

- (void)setMinFovSpring:(float)a3
{
  self->_minFovSpring = a3;
}

- (float)maxFovSpring
{
  return self->_maxFovSpring;
}

- (void)setMaxFovSpring:(float)a3
{
  self->_maxFovSpring = a3;
}

- (BOOL)forceBumpNextTap
{
  return self->_forceBumpNextTap;
}

- (void)setForceBumpNextTap:(BOOL)a3
{
  self->_forceBumpNextTap = a3;
}

- (BOOL)forceBumpAll
{
  return self->_forceBumpAll;
}

- (void)setForceBumpAll:(BOOL)a3
{
  self->_forceBumpAll = a3;
}

- (BOOL)slowMotionBump
{
  return self->_slowMotionBump;
}

- (void)setSlowMotionBump:(BOOL)a3
{
  self->_slowMotionBump = a3;
}

- (float)arJumpOffset
{
  return self->_arJumpOffset;
}

- (void)setArJumpOffset:(float)a3
{
  self->_arJumpOffset = a3;
}

- (float)arJumpDuration
{
  return self->_arJumpDuration;
}

- (void)setArJumpDuration:(float)a3
{
  self->_arJumpDuration = a3;
}

- (float)arJumpStart
{
  return self->_arJumpStart;
}

- (void)setArJumpStart:(float)a3
{
  self->_arJumpStart = a3;
}

- (float)arFallStart
{
  return self->_arFallStart;
}

- (void)setArFallStart:(float)a3
{
  self->_arFallStart = a3;
}

- (float)arFallOffset
{
  return self->_arFallOffset;
}

- (void)setArFallOffset:(float)a3
{
  self->_arFallOffset = a3;
}

- (float)arFallDuration
{
  return self->_arFallDuration;
}

- (void)setArFallDuration:(float)a3
{
  self->_arFallDuration = a3;
}

- (float)arRotateStart
{
  return self->_arRotateStart;
}

- (void)setArRotateStart:(float)a3
{
  self->_arRotateStart = a3;
}

- (float)arRotateOffset
{
  return self->_arRotateOffset;
}

- (void)setArRotateOffset:(float)a3
{
  self->_arRotateOffset = a3;
}

- (float)arRotateDuration
{
  return self->_arRotateDuration;
}

- (void)setArRotateDuration:(float)a3
{
  self->_arRotateDuration = a3;
}

- (float)arPulseStart
{
  return self->_arPulseStart;
}

- (void)setArPulseStart:(float)a3
{
  self->_arPulseStart = a3;
}

- (float)arPulseOffset
{
  return self->_arPulseOffset;
}

- (void)setArPulseOffset:(float)a3
{
  self->_arPulseOffset = a3;
}

- (float)arPulseDuration
{
  return self->_arPulseDuration;
}

- (void)setArPulseDuration:(float)a3
{
  self->_arPulseDuration = a3;
}

- (float)arPulseNumberOfRepeats
{
  return self->_arPulseNumberOfRepeats;
}

- (void)setArPulseNumberOfRepeats:(float)a3
{
  self->_arPulseNumberOfRepeats = a3;
}

- (BOOL)showRoutelineAnimation
{
  return self->_showRoutelineAnimation;
}

- (void)setShowRoutelineAnimation:(BOOL)a3
{
  self->_showRoutelineAnimation = a3;
}

- (void)setOverrideAmbient:(id)a3
{
  self->_overrideAmbient = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- (void)setOverrideLight1:(id)a3
{
  self->_overrideLight1 = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overrideLight2
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_overrideLight2.r;
  g = self->_overrideLight2.g;
  b = self->_overrideLight2.b;
  a = self->_overrideLight2.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setOverrideLight2:(id)a3
{
  self->_overrideLight2 = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overrideLight3
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_overrideLight3.r;
  g = self->_overrideLight3.g;
  b = self->_overrideLight3.b;
  a = self->_overrideLight3.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setOverrideLight3:(id)a3
{
  self->_overrideLight3 = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- (void)setOverrideLight1Azimuth:(float)a3
{
  self->_overrideLight1Azimuth = a3;
}

- (void)setOverrideLight1Altitude:(float)a3
{
  self->_overrideLight1Altitude = a3;
}

- (float)overrideLight2Azimuth
{
  return self->_overrideLight2Azimuth;
}

- (void)setOverrideLight2Azimuth:(float)a3
{
  self->_overrideLight2Azimuth = a3;
}

- (float)overrideLight2Altitude
{
  return self->_overrideLight2Altitude;
}

- (void)setOverrideLight2Altitude:(float)a3
{
  self->_overrideLight2Altitude = a3;
}

- (float)overrideLight3Azimuth
{
  return self->_overrideLight3Azimuth;
}

- (void)setOverrideLight3Azimuth:(float)a3
{
  self->_overrideLight3Azimuth = a3;
}

- (float)overrideLight3Altitude
{
  return self->_overrideLight3Altitude;
}

- (void)setOverrideLight3Altitude:(float)a3
{
  self->_overrideLight3Altitude = a3;
}

- (void)setLightingOverrideAmbient:(BOOL)a3
{
  self->_lightingOverrideAmbient = a3;
}

- (void)setLightingOverrideLight1:(BOOL)a3
{
  self->_lightingOverrideLight1 = a3;
}

- (BOOL)lightingOverrideLight2
{
  return self->_lightingOverrideLight2;
}

- (void)setLightingOverrideLight2:(BOOL)a3
{
  self->_lightingOverrideLight2 = a3;
}

- (BOOL)lightingOverrideLight3
{
  return self->_lightingOverrideLight3;
}

- (void)setLightingOverrideLight3:(BOOL)a3
{
  self->_lightingOverrideLight3 = a3;
}

- (BOOL)lightingEnableLight2
{
  return self->_lightingEnableLight2;
}

- (BOOL)lightingEnableLight3
{
  return self->_lightingEnableLight3;
}

- (BOOL)lightingAccelerateTime
{
  return self->_lightingAccelerateTime;
}

- (BOOL)lightingCameraLocalTime
{
  return self->_lightingCameraLocalTime;
}

- (void)setLightingCameraLocalTime:(BOOL)a3
{
  self->_lightingCameraLocalTime = a3;
}

- (void)setShouldUseSDFGlyphs:(BOOL)a3
{
  self->_shouldUseSDFGlyphs = a3;
}

- (void)setShouldOverrideUpscaleFactor:(BOOL)a3
{
  self->_shouldOverrideUpscaleFactor = a3;
}

- (void)setSdfGlyphShaderUpscaleFactor:(float)a3
{
  self->_sdfGlyphShaderUpscaleFactor = a3;
}

- (void)setShouldOverrideSuperSampleKernelSize:(BOOL)a3
{
  self->shouldOverrideSuperSampleKernelSize = a3;
}

- (void)setSdfGlyphSuperSampleKernelSize:(float)a3
{
  self->_sdfGlyphSuperSampleKernelSize = a3;
}

- (void)setShouldUseSDFSuperSampling:(BOOL)a3
{
  self->_shouldUseSDFSuperSampling = a3;
}

- (void)setShouldFreezeLayoutCamera:(BOOL)a3
{
  self->_shouldFreezeLayoutCamera = a3;
}

- (BOOL)enableNavRoadSignOrientationDebugging
{
  return self->_enableNavRoadSignOrientationDebugging;
}

- (BOOL)disableContinuousMultiSectionRoutes
{
  return self->_disableContinuousMultiSectionRoutes;
}

- (void)setDisableContinuousMultiSectionRoutes:(BOOL)a3
{
  self->_disableContinuousMultiSectionRoutes = a3;
}

- (unint64_t)routeDebugPoints
{
  return self->_routeDebugPoints;
}

- (void)setRouteDebugPoints:(unint64_t)a3
{
  self->_routeDebugPoints = a3;
}

- (unsigned)continuousMultiSectionRouteAdditionalOverlap
{
  return self->_continuousMultiSectionRouteAdditionalOverlap;
}

- (void)setContinuousMultiSectionRouteAdditionalOverlap:(unsigned int)a3
{
  self->_continuousMultiSectionRouteAdditionalOverlap = a3;
}

- (void)setDebugGPUFrameCaptureURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (BOOL)slowAnimations
{
  return self->_slowAnimations;
}

- (void)setSlowAnimations:(BOOL)a3
{
  self->_slowAnimations = a3;
}

- (BOOL)slowTransitions
{
  return self->_slowTransitions;
}

- (void)setSlowTransitions:(BOOL)a3
{
  self->_slowTransitions = a3;
}

- (void)setEnableTileClipping:(BOOL)a3
{
  self->_enableTileClipping = a3;
}

- (void)setEnableTileClippingDebug:(BOOL)a3
{
  self->_enableTileClippingDebug = a3;
}

- (void)setEnableLabelAnimationTuning:(BOOL)a3
{
  self->_enableLabelAnimationTuning = a3;
}

- (BOOL)tuneForwardLabelAnimation
{
  return self->_tuneForwardLabelAnimation;
}

- (void)setTuneForwardLabelAnimation:(BOOL)a3
{
  self->_tuneForwardLabelAnimation = a3;
}

- (unint64_t)labelAnimationTuningElement
{
  return self->_labelAnimationTuningElement;
}

- (void)setLabelAnimationTuningElement:(unint64_t)a3
{
  self->_labelAnimationTuningElement = a3;
}

- (void)setBuildingPOIPitchScaleMinZoom:(float)a3
{
  self->_buildingPOIPitchScaleMinZoom = a3;
}

- (void)setBuildingPOIPitchScaleMaxZoom:(float)a3
{
  self->_buildingPOIPitchScaleMaxZoom = a3;
}

- (void)setBuildingPOIPitchScaleMaxZoomFactor:(float)a3
{
  self->_buildingPOIPitchScaleMaxZoomFactor = a3;
}

- (void)setBuildingPOIPitchScaleFullHeightAngle:(float)a3
{
  self->_buildingPOIPitchScaleFullHeightAngle = a3;
}

- (void)setDaVinciRouteLineMaskScale:(float)a3
{
  self->_daVinciRouteLineMaskScale = a3;
}

- (float)daVinciRouteLineMaskBlurSigma
{
  return self->_daVinciRouteLineMaskBlurSigma;
}

- (void)setDaVinciRouteLineMaskBlurSigma:(float)a3
{
  self->_daVinciRouteLineMaskBlurSigma = a3;
}

- (void)setDrawDaVinciHUD:(BOOL)a3
{
  self->_drawDaVinciHUD = a3;
}

- (void)setDaVinciWireframeEnabled:(BOOL)a3
{
  self->_daVinciWireframeEnabled = a3;
}

- (void)setDaVinciRenderLineGeometry:(BOOL)a3
{
  self->_daVinciRenderLineGeometry = a3;
}

- (BOOL)daVinciSSAOOcclusionOnly
{
  return self->_daVinciSSAOOcclusionOnly;
}

- (void)setDaVinciSSAOOcclusionOnly:(BOOL)a3
{
  self->_daVinciSSAOOcclusionOnly = a3;
}

- (void)setDaVinciSSAOTextureScale:(float)a3
{
  self->_daVinciSSAOTextureScale = a3;
}

- (float)daVinciSSAODepthTextureScale
{
  return self->_daVinciSSAODepthTextureScale;
}

- (void)setDaVinciSSAODepthTextureScale:(float)a3
{
  self->_daVinciSSAODepthTextureScale = a3;
}

- (BOOL)daVinciSSAOEnableBlur
{
  return self->_daVinciSSAOEnableBlur;
}

- (void)setDaVinciSSAOEnableBlur:(BOOL)a3
{
  self->_daVinciSSAOEnableBlur = a3;
}

- (BOOL)daVinciSSAOHighSampleCountEnabled
{
  return self->_daVinciSSAOHighSampleCountEnabled;
}

- (void)setDaVinciSSAOHighSampleCountEnabled:(BOOL)a3
{
  self->_daVinciSSAOHighSampleCountEnabled = a3;
}

- (BOOL)daVinciSSAODepthAwareBlurEnabled
{
  return self->_daVinciSSAODepthAwareBlurEnabled;
}

- (void)setDaVinciSSAODepthAwareBlurEnabled:(BOOL)a3
{
  self->_daVinciSSAODepthAwareBlurEnabled = a3;
}

- (BOOL)daVinciSSAODepthAwareUpsampleEnabled
{
  return self->_daVinciSSAODepthAwareUpsampleEnabled;
}

- (void)setDaVinciSSAODepthAwareUpsampleEnabled:(BOOL)a3
{
  self->_daVinciSSAODepthAwareUpsampleEnabled = a3;
}

- (float)daVinciSSAODepthThreshold
{
  return self->_daVinciSSAODepthThreshold;
}

- (void)setDaVinciSSAODepthThreshold:(float)a3
{
  self->_daVinciSSAODepthThreshold = a3;
}

- (unsigned)daVinciSSAOBlurSize
{
  return self->_daVinciSSAOBlurSize;
}

- (void)setDaVinciSSAOBlurSize:(unsigned int)a3
{
  self->_daVinciSSAOBlurSize = a3;
}

- (float)daVinciSSAOBlurriness
{
  return self->_daVinciSSAOBlurriness;
}

- (void)setDaVinciSSAOBlurriness:(float)a3
{
  self->_daVinciSSAOBlurriness = a3;
}

- (float)daVinciSSAODepthBlurriness
{
  return self->_daVinciSSAODepthBlurriness;
}

- (void)setDaVinciSSAODepthBlurriness:(float)a3
{
  self->_daVinciSSAODepthBlurriness = a3;
}

- (float)daVinciSSAOUpsampleDepthThreshold
{
  return self->_daVinciSSAOUpsampleDepthThreshold;
}

- (void)setDaVinciSSAOUpsampleDepthThreshold:(float)a3
{
  self->_daVinciSSAOUpsampleDepthThreshold = a3;
}

- (float)ssaoFalloffScale
{
  return self->_ssaoFalloffScale;
}

- (void)setSsaoFalloffScale:(float)a3
{
  self->_ssaoFalloffScale = a3;
}

- (float)ssaoMaxDistance
{
  return self->_ssaoMaxDistance;
}

- (void)setSsaoMaxDistance:(float)a3
{
  self->_ssaoMaxDistance = a3;
}

- (void)setSsaoMaxIntensity:(float)a3
{
  self->_ssaoMaxIntensity = a3;
}

- (void)setSsaoOverrideOn:(BOOL)a3
{
  self->_ssaoOverrideOn = a3;
}

- (void)setSsaoOverrideIntensity:(float)a3
{
  self->_ssaoOverrideIntensity = a3;
}

- (void)setSsaoOverrideRadius:(float)a3
{
  self->_ssaoOverrideRadius = a3;
}

- (void)setDaVinciGroundAmbientOcclusionEnabled:(BOOL)a3
{
  self->_daVinciGroundAmbientOcclusionEnabled = a3;
}

- (void)setDaVinciGroundAmbientOcclusionIntensity:(float)a3
{
  self->_daVinciGroundAmbientOcclusionIntensity = a3;
}

- (void)setDaVinciGroundAmbientOcclusionRadius:(float)a3
{
  self->_daVinciGroundAmbientOcclusionRadius = a3;
}

- (void)setDaVinciSmoothEdgeMinZAngle:(float)a3
{
  self->_daVinciSmoothEdgeMinZAngle = a3;
}

- (void)setDaVinciSmoothEdgeMinZ:(unsigned __int8)a3
{
  self->_daVinciSmoothEdgeMinZ = a3;
}

- (void)setDaVinciSmoothEdgeMaxZAngle:(float)a3
{
  self->_daVinciSmoothEdgeMaxZAngle = a3;
}

- (void)setDaVinciSmoothEdgeMaxZ:(unsigned __int8)a3
{
  self->_daVinciSmoothEdgeMaxZ = a3;
}

- (void)setDaVinciColorCorrectionOverride:(BOOL)a3
{
  self->_daVinciColorCorrectionOverride = a3;
}

- (float)daVinciSaturationRangeMinOverride
{
  return self->_daVinciSaturationRangeMinOverride;
}

- (void)setDaVinciSaturationRangeMinOverride:(float)a3
{
  self->_daVinciSaturationRangeMinOverride = a3;
}

- (float)daVinciSaturationRangeMaxOverride
{
  return self->_daVinciSaturationRangeMaxOverride;
}

- (void)setDaVinciSaturationRangeMaxOverride:(float)a3
{
  self->_daVinciSaturationRangeMaxOverride = a3;
}

- (float)daVinciBrightnessRangeMinOverride
{
  return self->_daVinciBrightnessRangeMinOverride;
}

- (void)setDaVinciBrightnessRangeMinOverride:(float)a3
{
  self->_daVinciBrightnessRangeMinOverride = a3;
}

- (float)daVinciBrightnessRangeMaxOverride
{
  return self->_daVinciBrightnessRangeMaxOverride;
}

- (void)setDaVinciBrightnessRangeMaxOverride:(float)a3
{
  self->_daVinciBrightnessRangeMaxOverride = a3;
}

- (void)setDaVinciPlanarOverride:(BOOL)a3
{
  self->_daVinciPlanarOverride = a3;
}

- (float)daVinciPlanarPixelPerMeterOverride
{
  return self->_daVinciPlanarPixelPerMeterOverride;
}

- (void)setDaVinciPlanarPixelPerMeterOverride:(float)a3
{
  self->_daVinciPlanarPixelPerMeterOverride = a3;
}

- (float)daVinciPlanarTilingOverride
{
  return self->_daVinciPlanarTilingOverride;
}

- (void)setDaVinciPlanarTilingOverride:(float)a3
{
  self->_daVinciPlanarTilingOverride = a3;
}

- (float)daVinciPlanarOffsetOverride
{
  return self->_daVinciPlanarOffsetOverride;
}

- (void)setDaVinciPlanarOffsetOverride:(float)a3
{
  self->_daVinciPlanarOffsetOverride = a3;
}

- (void)setDaVinciShowCenterLineRoads:(BOOL)a3
{
  self->_daVinciShowCenterLineRoads = a3;
}

- (void)setDaVinciEnableRibbonAntialiasing:(BOOL)a3
{
  self->_daVinciEnableRibbonAntialiasing = a3;
}

- (void)setDaVinciTransitionDuration:(float)a3
{
  self->_daVinciTransitionDuration = a3;
}

- (void)setDaVinciOverrideElevationScaling:(BOOL)a3
{
  self->_daVinciOverrideElevationScaling = a3;
}

- (float)daVinciElevationScalingMinZFactor
{
  return self->_daVinciElevationScalingMinZFactor;
}

- (void)setDaVinciElevationScalingMinZFactor:(float)a3
{
  self->_daVinciElevationScalingMinZFactor = a3;
}

- (float)daVinciElevationScalingMaxZFactor
{
  return self->_daVinciElevationScalingMaxZFactor;
}

- (void)setDaVinciElevationScalingMaxZFactor:(float)a3
{
  self->_daVinciElevationScalingMaxZFactor = a3;
}

- (unsigned)daVinciElevationScalingMinZ
{
  return self->_daVinciElevationScalingMinZ;
}

- (void)setDaVinciElevationScalingMinZ:(unsigned __int8)a3
{
  self->_daVinciElevationScalingMinZ = a3;
}

- (unsigned)daVinciElevationScalingMaxZ
{
  return self->_daVinciElevationScalingMaxZ;
}

- (void)setDaVinciElevationScalingMaxZ:(unsigned __int8)a3
{
  self->_daVinciElevationScalingMaxZ = a3;
}

- (void)setDaVinciForceElevatedGround:(BOOL)a3
{
  self->_daVinciForceElevatedGround = a3;
}

- (void)setDaVinciBuildingRoundingRadius:(float)a3
{
  self->_daVinciBuildingRoundingRadius = a3;
}

- (void)setDaVinciEnablePBR:(BOOL)a3
{
  self->_daVinciEnablePBR = a3;
}

- (void)setDrawDaVinciElevationScalingDebug:(BOOL)a3
{
  self->_drawDaVinciElevationScalingDebug = a3;
}

- (void)setDaVinciElevationScalingNormalsOnly:(BOOL)a3
{
  self->_daVinciElevationScalingNormalsOnly = a3;
}

- (void)setDaVinciGlobeLighting:(BOOL)a3
{
  self->_daVinciGlobeLighting = a3;
}

- (void)setDaVinciLightingStylesOverrideEnabled:(BOOL)a3
{
  self->_daVinciLightingStylesOverrideEnabled = a3;
}

- (void)setDaVinciShowMissingMaterials:(BOOL)a3
{
  self->_daVinciShowMissingMaterials = a3;
}

- (BOOL)daVinciShowStackingVenues
{
  return self->_daVinciShowStackingVenues;
}

- (void)setDaVinciShowStackingVenues:(BOOL)a3
{
  self->_daVinciShowStackingVenues = a3;
}

- (void)setDaVinciTintLODLevels:(BOOL)a3
{
  self->_daVinciTintLODLevels = a3;
}

- (void)setDaVinciDebugRasterStyleAttribute:(unsigned __int16)a3
{
  self->_daVinciDebugRasterStyleAttribute = a3;
}

- (void)setDaVinciAridityGroundTintingEnabled:(BOOL)a3
{
  self->_daVinciAridityGroundTintingEnabled = a3;
}

- (void)setDaVinciTemperatureGroundTintingEnabled:(BOOL)a3
{
  self->_daVinciTemperatureGroundTintingEnabled = a3;
}

- (void)setDaVinciMaterialRastersEnabled:(BOOL)a3
{
  self->_daVinciMaterialRastersEnabled = a3;
}

- (BOOL)daVinciPitchedGlobeTileSelection
{
  return self->_daVinciPitchedGlobeTileSelection;
}

- (void)setDaVinciPitchedGlobeTileSelection:(BOOL)a3
{
  self->_daVinciPitchedGlobeTileSelection = a3;
}

- (void)setDaVinciGlobeSplinedMaxZoom:(float)a3
{
  self->_daVinciGlobeSplinedMaxZoom = a3;
}

- (BOOL)daVinciGlobeScalingCorrection
{
  return self->_daVinciGlobeScalingCorrection;
}

- (void)setDaVinciGlobeScalingCorrection:(BOOL)a3
{
  self->_daVinciGlobeScalingCorrection = a3;
}

- (int64_t)shadowMapResolution
{
  return self->_shadowMapResolution;
}

- (void)setDaVinciShadowIntensity:(float)a3
{
  self->_daVinciShadowIntensity = a3;
}

- (float)daVinciAtmosphereMaxHeight
{
  return self->_daVinciAtmosphereMaxHeight;
}

- (void)setDaVinciAtmosphereMaxHeight:(float)a3
{
  self->_daVinciAtmosphereMaxHeight = a3;
}

- (float)daVinciAtmosphereColorMidpoint
{
  return self->_daVinciAtmosphereColorMidpoint;
}

- (void)setDaVinciAtmosphereColorMidpoint:(float)a3
{
  self->_daVinciAtmosphereColorMidpoint = a3;
}

- (void)setDaVinciHorizonGlowSharpness:(float)a3
{
  self->_daVinciHorizonGlowSharpness = a3;
}

- (void)setDaVinciHorizonGlowStrength:(float)a3
{
  self->_daVinciHorizonGlowStrength = a3;
}

- (void)setDaVinciLightingDebugAlbedoOnly:(BOOL)a3
{
  self->_daVinciLightingDebugAlbedoOnly = a3;
}

- (void)setDaVinciLightingDebugLightsOnly:(BOOL)a3
{
  self->_daVinciLightingDebugLightsOnly = a3;
}

- (void)setDaVinciLightingDebugShowOverexposure:(BOOL)a3
{
  self->_daVinciLightingDebugShowOverexposure = a3;
}

- (void)setDaVinciLightingDebugShowNormals:(BOOL)a3
{
  self->_daVinciLightingDebugShowNormals = a3;
}

- (void)setDaVinciRenderingDebugShowUVs:(BOOL)a3
{
  self->_daVinciRenderingDebugShowUVs = a3;
}

- (void)setDaVinciLightingDebugShowLitSphere:(BOOL)a3
{
  self->_daVinciLightingDebugShowLitSphere = a3;
}

- (BOOL)daVinciBiasLatitudeGlobeTileSelection
{
  return self->_daVinciBiasLatitudeGlobeTileSelection;
}

- (void)setDaVinciBiasLatitudeGlobeTileSelection:(BOOL)a3
{
  self->_daVinciBiasLatitudeGlobeTileSelection = a3;
}

- (void)setDaVinciCameraControllerForceMercatorZoom:(BOOL)a3
{
  self->_daVinciCameraControllerForceMercatorZoom = a3;
}

- (void)setDaVinciUseCollisionMesh:(BOOL)a3
{
  self->_daVinciUseCollisionMesh = a3;
}

- (void)setDaVinciDrawCollisionMesh:(BOOL)a3
{
  self->_daVinciDrawCollisionMesh = a3;
}

- (void)setDaVinciTintBandFillWireframeEnabled:(BOOL)a3
{
  self->_daVinciTintBandFillWireframeEnabled = a3;
}

- (void)setDaVinciTintBandStrokeWireframeEnabled:(BOOL)a3
{
  self->_daVinciTintBandStrokeWireframeEnabled = a3;
}

- (void)setDaVinciTintBandStrokeDistanceDebugEnabled:(BOOL)a3
{
  self->_daVinciTintBandStrokeDistanceDebugEnabled = a3;
}

- (float)routeLineMaskWidth
{
  return self->_routeLineMaskWidth;
}

- (void)setRouteLineMaskWidth:(float)a3
{
  self->_routeLineMaskWidth = a3;
}

- (float)routeLineMaskAlphaFalloff
{
  return self->_routeLineMaskAlphaFalloff;
}

- (void)setRouteLineMaskAlphaFalloff:(float)a3
{
  self->_routeLineMaskAlphaFalloff = a3;
}

- (void)setRelaxTiltLimits:(BOOL)a3
{
  self->_relaxTiltLimits = a3;
}

- (float)maxElevatedStrokeWidth
{
  return self->_maxElevatedStrokeWidth;
}

- (void)setMaxElevatedStrokeWidth:(float)a3
{
  self->_maxElevatedStrokeWidth = a3;
}

- (BOOL)enableARCameraDebugOverlay
{
  return self->_enableARCameraDebugOverlay;
}

- (void)setEnableARCameraDebugOverlay:(BOOL)a3
{
  self->_enableARCameraDebugOverlay = a3;
}

- (BOOL)arLabelingStateOverlay
{
  return self->_arLabelingStateOverlay;
}

- (BOOL)arDebugMiniMap
{
  return self->_arDebugMiniMap;
}

- (BOOL)arEnableEnvironmentMap
{
  return self->_arEnableEnvironmentMap;
}

- (float)arDebugMiniMapMapRectSize
{
  return self->_arDebugMiniMapMapRectSize;
}

- (float)arDebugMiniMapScreenRectSize
{
  return self->_arDebugMiniMapScreenRectSize;
}

- (float)arDebugMiniMapScreenRectXOffset
{
  return self->_arDebugMiniMapScreenRectXOffset;
}

- (float)arDebugMiniMapScreenRectYOffset
{
  return self->_arDebugMiniMapScreenRectYOffset;
}

- (unsigned)arDebugScenePoiType
{
  return self->_arDebugScenePoiType;
}

- (unsigned)arDebugSceneForcedLayoutType
{
  return self->_arDebugSceneForcedLayoutType;
}

- (void)setArDebugSceneForcedLayoutType:(unsigned __int8)a3
{
  self->_arDebugSceneForcedLayoutType = a3;
}

- (float)arDebugSceneFeatureDistance
{
  return self->_arDebugSceneFeatureDistance;
}

- (float)arDebugSceneFeatureHeading
{
  return self->_arDebugSceneFeatureHeading;
}

- (NSString)arDebugSceneFeatureText
{
  return self->_arDebugSceneFeatureText;
}

- (unsigned)arDebugSceneFeatureType
{
  return self->_arDebugSceneFeatureType;
}

- (float)arCameraElevationOffset
{
  return self->_arCameraElevationOffset;
}

- (void)setArCameraElevationOffset:(float)a3
{
  self->_arCameraElevationOffset = a3;
}

- (BOOL)arEnableRouteLineDebugMeshes
{
  return self->_arEnableRouteLineDebugMeshes;
}

- (BOOL)arShowAllLabels
{
  return self->_arShowAllLabels;
}

- (void)setArShowAllLabels:(BOOL)a3
{
  self->_arShowAllLabels = a3;
}

- (BOOL)arForceOccludedStyling
{
  return self->_arForceOccludedStyling;
}

- (void)setArForceOccludedStyling:(BOOL)a3
{
  self->_arForceOccludedStyling = a3;
}

- (BOOL)arRenderAvoidanceObjects
{
  return self->_arRenderAvoidanceObjects;
}

- (void)setArRenderAvoidanceObjects:(BOOL)a3
{
  self->_arRenderAvoidanceObjects = a3;
}

- (BOOL)arRenderAvoidanceObjectsIntersection
{
  return self->_arRenderAvoidanceObjectsIntersection;
}

- (void)setArRenderAvoidanceObjectsIntersection:(BOOL)a3
{
  self->_arRenderAvoidanceObjectsIntersection = a3;
}

- (BOOL)arIsArrivalAnimationEnabled
{
  return self->_arIsArrivalAnimationEnabled;
}

- (void)setArIsArrivalAnimationEnabled:(BOOL)a3
{
  self->_arIsArrivalAnimationEnabled = a3;
}

- (float)arManeuverDebugElevationOffset
{
  return self->_arManeuverDebugElevationOffset;
}

- (void)setArManeuverDebugElevationOffset:(float)a3
{
  self->_arManeuverDebugElevationOffset = a3;
}

- (float)arDebugStylingBaseScalingFactor
{
  return self->_arDebugStylingBaseScalingFactor;
}

- (void)setArDebugStylingBaseScalingFactor:(float)a3
{
  self->_arDebugStylingBaseScalingFactor = a3;
}

- (float)arDebugStylingPOIIconScaleFactor
{
  return self->_arDebugStylingPOIIconScaleFactor;
}

- (void)setArDebugStylingPOIIconScaleFactor:(float)a3
{
  self->_arDebugStylingPOIIconScaleFactor = a3;
}

- (float)arDebugStylingPOIEnvMapIntensity
{
  return self->_arDebugStylingPOIEnvMapIntensity;
}

- (void)setArDebugStylingPOIEnvMapIntensity:(float)a3
{
  self->_arDebugStylingPOIEnvMapIntensity = a3;
}

- (float)arDebugStylingPOILightIntensity
{
  return self->_arDebugStylingPOILightIntensity;
}

- (void)setArDebugStylingPOILightIntensity:(float)a3
{
  self->_arDebugStylingPOILightIntensity = a3;
}

- (BOOL)arDebugLockLocalizingState
{
  return self->_arDebugLockLocalizingState;
}

- (void)setArDebugLockLocalizingState:(BOOL)a3
{
  self->_arDebugLockLocalizingState = a3;
}

- (BOOL)arForceLabelsViewOriented
{
  return self->_arForceLabelsViewOriented;
}

- (void)setArForceLabelsViewOriented:(BOOL)a3
{
  self->_arForceLabelsViewOriented = a3;
}

- (BOOL)arAlwaysShowOneContinueLabel
{
  return self->_arAlwaysShowOneContinueLabel;
}

- (void)setArAlwaysShowOneContinueLabel:(BOOL)a3
{
  self->_arAlwaysShowOneContinueLabel = a3;
}

- (BOOL)arDebugDrawMeshFeatureBounds
{
  return self->_arDebugDrawMeshFeatureBounds;
}

- (void)setArDebugDrawMeshFeatureBounds:(BOOL)a3
{
  self->_arDebugDrawMeshFeatureBounds = a3;
}

- (BOOL)arDebugDrawLabelFeatureBounds
{
  return self->_arDebugDrawLabelFeatureBounds;
}

- (void)setArDebugDrawLabelFeatureBounds:(BOOL)a3
{
  self->_arDebugDrawLabelFeatureBounds = a3;
}

- (BOOL)arDebugUseLastStepAsArrivalLocation
{
  return self->_arDebugUseLastStepAsArrivalLocation;
}

- (void)setArDebugUseLastStepAsArrivalLocation:(BOOL)a3
{
  self->_arDebugUseLastStepAsArrivalLocation = a3;
}

- (float)arDebugArrivalPointSphereScaleX
{
  return self->_arDebugArrivalPointSphereScaleX;
}

- (void)setArDebugArrivalPointSphereScaleX:(float)a3
{
  self->_arDebugArrivalPointSphereScaleX = a3;
}

- (float)arDebugArrivalPointSphereScaleY
{
  return self->_arDebugArrivalPointSphereScaleY;
}

- (void)setArDebugArrivalPointSphereScaleY:(float)a3
{
  self->_arDebugArrivalPointSphereScaleY = a3;
}

- (float)arDebugArrivalPointSphereScaleZ
{
  return self->_arDebugArrivalPointSphereScaleZ;
}

- (void)setArDebugArrivalPointSphereScaleZ:(float)a3
{
  self->_arDebugArrivalPointSphereScaleZ = a3;
}

- (unint64_t)mapDisplayStyleOverride
{
  return self->_mapDisplayStyleOverride;
}

- (BOOL)arEnableCameraFeed
{
  return self->_arEnableCameraFeed;
}

- (void)setArEnableCameraFeed:(BOOL)a3
{
  self->_arEnableCameraFeed = a3;
}

- (BOOL)enableWindshieldOverrideButton
{
  return self->_enableWindshieldOverrideButton;
}

- (BOOL)shouldForceWindshieldMode
{
  return self->_shouldForceWindshieldMode;
}

- (void)setShouldForceWindshieldMode:(BOOL)a3
{
  self->_shouldForceWindshieldMode = a3;
}

- (BOOL)enable3DPuck
{
  return self->_enable3DPuck;
}

- (void)setEnable3DPuck:(BOOL)a3
{
  self->_enable3DPuck = a3;
}

- (void)setRouteWindshieldAnimationTime:(float)a3
{
  self->_routeWindshieldAnimationTime = a3;
}

- (void)setRouteIsCoveredAnimationTime:(float)a3
{
  self->_routeIsCoveredAnimationTime = a3;
}

- (void)setShowGRLDebugInfo:(BOOL)a3
{
  self->_showGRLDebugInfo = a3;
}

- (void)setShowTrafficOffset:(BOOL)a3
{
  self->_showTrafficOffset = a3;
}

- (BOOL)enableMipMaps
{
  return self->_enableMipMaps;
}

- (void)setEnableMipMaps:(BOOL)a3
{
  self->_enableMipMaps = a3;
}

- (void)setAnisotropy:(unsigned int)a3
{
  self->_anisotropy = a3;
}

- (void)setFarClipPlaneFactor:(float)a3
{
  self->_farClipPlaneFactor = a3;
}

- (BOOL)enablePuckRouteLineSnapping
{
  return self->_enablePuckRouteLineSnapping;
}

- (void)setEnablePuckRouteLineSnapping:(BOOL)a3
{
  self->_enablePuckRouteLineSnapping = a3;
}

- (void)setDofStrength:(float)a3
{
  self->_dofStrength = a3;
}

- (float)maskingOverlayOpacityFactor
{
  return self->_maskingOverlayOpacityFactor;
}

- (void)setMaskingOverlayOpacityFactor:(float)a3
{
  self->_maskingOverlayOpacityFactor = a3;
}

- (float)maskingOverlayRadiusEdgeRatio
{
  return self->_maskingOverlayRadiusEdgeRatio;
}

- (void)setMaskingOverlayRadiusEdgeRatio:(float)a3
{
  self->_maskingOverlayRadiusEdgeRatio = a3;
}

- (float)maskingOverlayRadiusZoomCorrectionStep
{
  return self->_maskingOverlayRadiusZoomCorrectionStep;
}

- (void)setMaskingOverlayRadiusZoomCorrectionStep:(float)a3
{
  self->_maskingOverlayRadiusZoomCorrectionStep = a3;
}

- (BOOL)maskingOverlayMaskingDebugStroke
{
  return self->_maskingOverlayMaskingDebugStroke;
}

- (void)setMaskingOverlayMaskingDebugStroke:(BOOL)a3
{
  self->_maskingOverlayMaskingDebugStroke = a3;
}

- (BOOL)maskingOverlayIgnoreFallbackStyle
{
  return self->_maskingOverlayIgnoreFallbackStyle;
}

- (void)setMaskingOverlayIgnoreFallbackStyle:(BOOL)a3
{
  self->_maskingOverlayIgnoreFallbackStyle = a3;
}

- (unint64_t)trailDebugSelection
{
  return self->_trailDebugSelection;
}

- (void)setTrailDebugSelection:(unint64_t)a3
{
  self->_trailDebugSelection = a3;
}

- (float)hillshadeOpacity
{
  return self->_hillshadeOpacity;
}

- (void)setHillshadeOpacity:(float)a3
{
  self->_hillshadeOpacity = a3;
}

- (float)hillshadeBlendMode
{
  return self->_hillshadeBlendMode;
}

- (void)setHillshadeBlendMode:(float)a3
{
  self->_hillshadeBlendMode = a3;
}

- (BOOL)enableDebugSettingForHillShade
{
  return self->_enableDebugSettingForHillShade;
}

- (void)setEnableDebugSettingForHillShade:(BOOL)a3
{
  self->_enableDebugSettingForHillShade = a3;
}

- (float)trailJunctionElevationOffset
{
  return self->_trailJunctionElevationOffset;
}

- (void)setTrailJunctionElevationOffset:(float)a3
{
  self->_trailJunctionElevationOffset = a3;
}

- (void)setLabelDebugHoverLayers:(BOOL)a3
{
  self->_labelDebugHoverLayers = a3;
}

- (float)flyoverOctileLODConstant
{
  return self->_flyoverOctileLODConstant;
}

- (void)setFlyoverOctileLODConstant:(float)a3
{
  self->_flyoverOctileLODConstant = a3;
}

- (float)flyoverOctileLODMaxRefineDistance
{
  return self->_flyoverOctileLODMaxRefineDistance;
}

- (void)setFlyoverOctileLODMaxRefineDistance:(float)a3
{
  self->_flyoverOctileLODMaxRefineDistance = a3;
}

- (BOOL)forceFlyoverUnificationMode
{
  return self->_forceFlyoverUnificationMode;
}

- (BOOL)flyoverSkipTileRendering
{
  return self->_flyoverSkipTileRendering;
}

- (void)setFlyoverSkipTileRendering:(BOOL)a3
{
  self->_flyoverSkipTileRendering = a3;
}

- (float)flyoverGridNDCBias
{
  return self->_flyoverGridNDCBias;
}

- (void)setFlyoverGridNDCBias:(float)a3
{
  self->_flyoverGridNDCBias = a3;
}

- (BOOL)flyoverDrapeGrid
{
  return self->_flyoverDrapeGrid;
}

- (void)setFlyoverDrapeGrid:(BOOL)a3
{
  self->_flyoverDrapeGrid = a3;
}

- (BOOL)tourUsePreloadPosition
{
  return self->_tourUsePreloadPosition;
}

- (void)setTourUsePreloadPosition:(BOOL)a3
{
  self->_tourUsePreloadPosition = a3;
}

- (float)toursPreloadHeadTime
{
  return self->_toursPreloadHeadTime;
}

- (void)setToursPreloadHeadTime:(float)a3
{
  self->_toursPreloadHeadTime = a3;
}

- (float)toursAnimationSpeed
{
  return self->_toursAnimationSpeed;
}

- (void)setToursAnimationSpeed:(float)a3
{
  self->_toursAnimationSpeed = a3;
}

- (BOOL)toursCorrectElevation
{
  return self->_toursCorrectElevation;
}

- (void)setToursCorrectElevation:(BOOL)a3
{
  self->_toursCorrectElevation = a3;
}

- (BOOL)toursModulateSpeed
{
  return self->_toursModulateSpeed;
}

- (void)setToursModulateSpeed:(BOOL)a3
{
  self->_toursModulateSpeed = a3;
}

- (BOOL)toursPreloadSlowsSpeed
{
  return self->_toursPreloadSlowsSpeed;
}

- (void)setToursPreloadSlowsSpeed:(BOOL)a3
{
  self->_toursPreloadSlowsSpeed = a3;
}

- (float)toursInterestingViewSpeed
{
  return self->_toursInterestingViewSpeed;
}

- (void)setToursInterestingViewSpeed:(float)a3
{
  self->_toursInterestingViewSpeed = a3;
}

- (float)toursViewRecoverySpeed
{
  return self->_toursViewRecoverySpeed;
}

- (void)setToursViewRecoverySpeed:(float)a3
{
  self->_toursViewRecoverySpeed = a3;
}

- (BOOL)toursForceCompleteTileLoading
{
  return self->_toursForceCompleteTileLoading;
}

- (void)setToursForceCompleteTileLoading:(BOOL)a3
{
  self->_toursForceCompleteTileLoading = a3;
}

- (BOOL)correctBumpiness
{
  return self->_correctBumpiness;
}

- (void)setCorrectBumpiness:(BOOL)a3
{
  self->_correctBumpiness = a3;
}

- (void).cxx_destruct
{
  void *value;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *next;
  _QWORD *v8;
  void **v9;

  value = self->_showLabelCountsValue.__ptr_.__value_;
  self->_showLabelCountsValue.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)value);
    MEMORY[0x1A1AF4E00](v4, 0x10A0C404982DDD9);
  }
  v5 = self->_labelHighlightingValue.__ptr_.__value_;
  self->_labelHighlightingValue.__ptr_.__value_ = 0;
  if (v5)
  {
    v6 = md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v5);
    MEMORY[0x1A1AF4E00](v6, 0x10A0C404982DDD9);
  }
  next = self->_enabledLogicConsoles.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v8 = (_QWORD *)*next;
      operator delete(next);
      next = v8;
    }
    while (v8);
  }
  v9 = self->_enabledLogicConsoles.__table_.__bucket_list_.__ptr_.__value_;
  self->_enabledLogicConsoles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v9)
    operator delete(v9);
  objc_storeStrong((id *)&self->_arDebugSceneFeatureText, 0);
  objc_storeStrong((id *)&self->_debugGPUFrameCaptureURL, 0);
}

- (uint64_t)init
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)init
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setLabelHighlighting:", *(unsigned __int8 *)(WeakRetained[169] + 16));

}

- (id)init
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E42C7508;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
