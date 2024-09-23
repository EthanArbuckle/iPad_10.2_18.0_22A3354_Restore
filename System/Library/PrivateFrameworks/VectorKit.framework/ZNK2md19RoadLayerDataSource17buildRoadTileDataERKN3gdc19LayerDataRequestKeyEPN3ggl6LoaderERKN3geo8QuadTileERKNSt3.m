@implementation ZNK2md19RoadLayerDataSource17buildRoadTileDataERKN3gdc19LayerDataRequestKeyEPN3ggl6LoaderERKN3geo8QuadTileERKNSt3

_QWORD *___ZNK2md19RoadLayerDataSource17buildRoadTileDataERKN3gdc19LayerDataRequestKeyEPN3ggl6LoaderERKN3geo8QuadTileERKNSt3__16vectorINSC_10shared_ptrINS_21GEOVectorTileResourceEEENSC_9allocatorISG_EEEERKNSC_13unordered_setINS_21RoadFeatureAndSectionENSC_4hashISN_EENSC_8equal_toISN_EENSH_ISN_EEEEONSC_10unique_ptrINS_19DaVinciTrafficLayerENSC_14default_deleteISX_EEEEONSW_INS_17CasedTrafficLayerENSY_IS12_EEEERKN3gss19FeatureAttributeSetENSE_INS5_17ConstantDataTypedINS5_4Tile4ViewEEEEENSE_INS1A_INS1B_9TransformEEEEERKNSE_INS_27TrafficSkeletonTileResourceEEERKNSD_INSE_INS_26TrafficDynamicTileResourceEEENSH_IS1N_EEEEONSD_INS1_8Resource12LoadMetadataENSH_IS1T_EEEE_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16[32];
  char v17[32];
  char v18[32];
  char v19[32];

  v3 = result;
  if (*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 72))
  {
    v4 = *(_QWORD *)(result[5] + 8);
    v5 = (_QWORD *)operator new();
    v6 = *(_QWORD *)(v3[4] + 8) + 48;
    v19[0] = 0;
    v19[24] = 0;
    md::RoadLayer::RoadLayer(v5, a2, v6, v3 + 12, v3 + 14, v19, 0);
    result = *(_QWORD **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v5;
    if (result)
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
  }
  if (*(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 72))
  {
    v7 = *(_QWORD *)(v3[7] + 8);
    v8 = operator new();
    v9 = *(_QWORD *)(v3[6] + 8) + 48;
    v18[0] = 0;
    v18[24] = 0;
    md::PatternedLayer::PatternedLayer(v8, a2, v9, v3 + 12, v3 + 14, v18, 0);
    result = *(_QWORD **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v8;
    if (result)
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
  }
  if (*(_QWORD *)(*(_QWORD *)(v3[8] + 8) + 72))
  {
    v10 = *(_QWORD *)(v3[9] + 8);
    v11 = (_QWORD *)operator new();
    v12 = *(_QWORD *)(v3[8] + 8) + 48;
    v17[0] = 0;
    v17[24] = 0;
    md::RoadLayer::RoadLayer(v11, a2, v12, v3 + 12, v3 + 14, v17, 0);
    result = *(_QWORD **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = v11;
    if (result)
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
  }
  if (*(_QWORD *)(*(_QWORD *)(v3[10] + 8) + 72))
  {
    v13 = *(_QWORD *)(v3[11] + 8);
    v14 = operator new();
    v15 = *(_QWORD *)(v3[10] + 8) + 48;
    v16[0] = 0;
    v16[24] = 0;
    md::PatternedLayer::PatternedLayer(v14, a2, v15, v3 + 12, v3 + 14, v16, 0);
    result = *(_QWORD **)(v13 + 48);
    *(_QWORD *)(v13 + 48) = v14;
    if (result)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
  }
  return result;
}

@end
