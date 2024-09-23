@implementation PXStoryPacingControllerDecisionHistory

void __69___PXStoryPacingControllerDecisionHistory_descriptionWithShortStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  CMTime v31;
  _BYTE v32[56];
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  _OWORD v47[2];
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v3 = a2;
  v4 = objc_msgSend(v3, "decisionsCount");
  if (v4 >= 1)
  {
    v29 = a1;
    v5 = v4 + 1;
    v6 = 240 * v4 - 112;
    v30 = v3;
    do
    {
      v7 = objc_msgSend(v3, "decisions") + v6;
      v8 = *(_QWORD *)(v7 - 128);
      v9 = *(_OWORD *)(v7 - 104);
      v52 = *(_OWORD *)(v7 - 120);
      v53 = v9;
      v54 = *(_OWORD *)(v7 - 88);
      v50 = *(_OWORD *)(v7 - 72);
      v51 = *(_QWORD *)(v7 - 56);
      v10 = *(_OWORD *)(v7 - 48);
      v49 = *(_QWORD *)(v7 - 32);
      v11 = *(_QWORD *)v7;
      v12 = *(_OWORD *)(v7 + 8);
      v47[1] = *(_OWORD *)(v7 + 24);
      v48 = v10;
      v47[0] = v12;
      v13 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 40))
      {
        v14 = *(_OWORD *)(v7 - 104);
        *(_OWORD *)&v32[8] = *(_OWORD *)(v7 - 120);
        *(_OWORD *)&v32[24] = v14;
        *(_OWORD *)&v32[40] = *(_OWORD *)(v7 - 88);
        v33 = *(_OWORD *)(v7 - 72);
        v34 = *(_QWORD *)(v7 - 56);
        v35 = *(_OWORD *)(v7 - 48);
        v36 = *(_QWORD *)(v7 - 32);
        v38 = *(_QWORD *)(v7 - 8);
        v37 = *(_OWORD *)(v7 - 24);
        *(_QWORD *)v32 = v8;
        v39 = v11;
        v15 = *(_OWORD *)(v7 + 24);
        v40 = *(_OWORD *)(v7 + 8);
        v41 = v15;
        v16 = *(_OWORD *)(v7 + 40);
        v46 = *(_QWORD *)(v7 + 104);
        v17 = *(_OWORD *)(v7 + 88);
        v44 = *(_OWORD *)(v7 + 72);
        v45 = v17;
        v18 = *(_OWORD *)(v7 + 56);
        v42 = v16;
        v43 = v18;
        PXStoryPacingDecisionDescription((uint64_t)v32);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@\n"), v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("Unspecified");
        if (v11 <= 4)
          v20 = off_1E5117580[v11];
        v21 = v20;
        *(_OWORD *)v32 = *(_OWORD *)((char *)v47 + 8);
        *(_QWORD *)&v32[16] = *((_QWORD *)&v47[1] + 1);
        PXStoryTimeDescription((CMTime *)v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)v32 = v50;
        *(_QWORD *)&v32[16] = v51;
        PXStoryTimeDescription((CMTime *)v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)v32 = v48;
        *(_QWORD *)&v32[16] = v49;
        PXStoryTimeDescription((CMTime *)v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)v32 = v52;
        *(_OWORD *)&v32[16] = v53;
        *(_OWORD *)&v32[32] = v54;
        PXStoryTimeRangeDescription((uint64_t)v32);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("Segment: %@, Cue Type: %@, Cue Time: %@, Original Duration: %@, Adjusted Duration: %@, Allowed Range: %@\n"), v19, v21, v22, v23, v24, v25);

        a1 = v29;
        v3 = v30;
      }

      --v5;
      v6 -= 240;
    }
    while (v5 > 1);
  }
  v26 = *(void **)(a1 + 32);
  objc_msgSend(v3, "resetReason");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "targetRemainingDuration");
  else
    memset(&v31, 0, sizeof(v31));
  PXStoryTimeDescription(&v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendFormat:", CFSTR("  Reset: %@ (%@ Remaining)\n"), v27, v28);

}

__n128 __72___PXStoryPacingControllerDecisionHistory_firstPacingDecisionAfterTime___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  CMTime *v6;
  unint64_t v7;
  uint64_t v8;
  __n128 result;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CMTime v21;
  CMTime time1;
  uint64_t v23;
  uint64_t v24;

  if (a2 >= 2)
  {
    v23 = v3;
    v24 = v4;
    v6 = (CMTime *)(a1 + 40);
    v7 = a2 + 1;
    v8 = a3 + 240 * a2 - 240;
    do
    {
      time1 = *(CMTime *)(v8 + 144);
      v21 = *v6;
      if (CMTimeCompare(&time1, &v21) < 1)
        break;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(_OWORD *)(v8 + 96);
      v13 = *(_OWORD *)(v8 + 48);
      v12 = *(_OWORD *)(v8 + 64);
      *(_OWORD *)(v10 + 112) = *(_OWORD *)(v8 + 80);
      *(_OWORD *)(v10 + 128) = v11;
      *(_OWORD *)(v10 + 80) = v13;
      *(_OWORD *)(v10 + 96) = v12;
      v14 = *(_OWORD *)(v8 + 160);
      v16 = *(_OWORD *)(v8 + 112);
      v15 = *(_OWORD *)(v8 + 128);
      *(_OWORD *)(v10 + 176) = *(_OWORD *)(v8 + 144);
      *(_OWORD *)(v10 + 192) = v14;
      *(_OWORD *)(v10 + 144) = v16;
      *(_OWORD *)(v10 + 160) = v15;
      v17 = *(_OWORD *)(v8 + 224);
      v19 = *(_OWORD *)(v8 + 176);
      v18 = *(_OWORD *)(v8 + 192);
      *(_OWORD *)(v10 + 240) = *(_OWORD *)(v8 + 208);
      *(_OWORD *)(v10 + 256) = v17;
      *(_OWORD *)(v10 + 208) = v19;
      *(_OWORD *)(v10 + 224) = v18;
      result = *(__n128 *)v8;
      v20 = *(_OWORD *)(v8 + 32);
      *(_OWORD *)(v10 + 48) = *(_OWORD *)(v8 + 16);
      *(_OWORD *)(v10 + 64) = v20;
      *(__n128 *)(v10 + 32) = result;
      --v7;
      v8 -= 240;
    }
    while (v7 > 2);
  }
  return result;
}

@end
