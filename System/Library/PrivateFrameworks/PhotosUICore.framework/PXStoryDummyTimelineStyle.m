@implementation PXStoryDummyTimelineStyle

void __242___PXStoryDummyTimelineStyle_enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition_displayAssets_assetContentInfos_finalPlaybackStyles_startTime_durationInfo_separatorEffectParameters_separatorEffectContext_buffer_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "numberOfClips");
  switch(v3)
  {
    case 3:
      switch(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "threeUpKenBurnsKind"))
      {
        case 0:
          goto LABEL_8;
        case 1:
LABEL_10:
          v10 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsDistance");
          objc_msgSend(v20, "getParameters:forOppositePansWithDistance:", v10);
          goto LABEL_15;
        case 2:
LABEL_11:
          v11 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsDistance");
          objc_msgSend(v20, "getParameters:forParallelPansWithDistance:", v11);
          goto LABEL_15;
        case 3:
LABEL_9:
          v6 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsRotationInDegrees");
          PXDegreesToRadians();
          v8 = v7;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsScale");
          objc_msgSend(v20, "getParameters:forRotationWithAngle:scale:", v6, v8, v9);
LABEL_15:
          v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
          goto LABEL_16;
        default:
          goto LABEL_17;
      }
    case 2:
      switch(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "twoUpKenBurnsKind"))
      {
        case 0:
          goto LABEL_8;
        case 1:
          v14 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsScale");
          v16 = v15;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsRelativeTransformOrigin");
          objc_msgSend(v20, "getParameters:forZoomWithScale:relativeTransformOrigin:", v14, v16, v17, v18);
          goto LABEL_15;
        case 2:
          goto LABEL_10;
        case 3:
          goto LABEL_11;
        case 4:
          goto LABEL_9;
        case 5:
          v19 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsDistance");
          objc_msgSend(v20, "getParameters:forSplitAssetOppositePansWithDistance:", v19);
          goto LABEL_15;
        default:
          goto LABEL_17;
      }
    case 1:
      switch(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "oneUpKenBurnsKind"))
      {
        case 0:
          goto LABEL_8;
        case 1:
          v4 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsScale");
          objc_msgSend(v20, "getParameters:forZoomWithScale:", v4);
          goto LABEL_15;
        case 2:
          v12 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsPanDirection");
          v13 = PXRectEdgeOpposite();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "kenBurnsDistance");
          objc_msgSend(v20, "getParameters:forPanWithCameraMovingTowardsEdge:distance:", v12, v13);
          goto LABEL_15;
        case 3:
          goto LABEL_9;
        default:
          goto LABEL_17;
      }
    default:
LABEL_8:
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_16:
      v5();
      break;
  }
LABEL_17:

}

@end
