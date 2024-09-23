@implementation PXFlexMusicPathfinder

- (PXFlexMusicPathfinder)initWithSong:(id)a3
{
  id v5;
  PXFlexMusicPathfinder *v6;
  PXFlexMusicPathfinder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFlexMusicPathfinder;
  v6 = -[PXFlexMusicPathfinder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_song, a3);

  return v7;
}

- (PXFlexMusicPathfinder)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicPathfinder.m"), 34, CFSTR("%s is not available as initializer"), "-[PXFlexMusicPathfinder init]");

  abort();
}

- (void)findPathFromCurrentTime:(id *)a3 inRendition:(id)a4 withTargetRemainder:(id *)a5 tolerance:(id *)a6 result:(id)a7
{
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int32_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  __CFString *v40;
  void (*v41)(_QWORD *, _QWORD, CMTimeRange *);
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void (*v48)(_QWORD *, void *, CMTime *);
  void *v49;
  void *v50;
  _QWORD *v51;
  void *v52;
  uint64_t v53;
  void *v55;
  CMTime v57;
  CMTime v58;
  _QWORD v59[4];
  __int128 v60;
  int64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;
  int32_t v65;
  CMTime v66;
  __int128 v67;
  int64_t var3;
  __int128 v69;
  int64_t v70;
  CMTime v71;
  CMTime rhs;
  CMTime lhs;
  CMTimeRange range;
  CMTime duration;
  CMTime start;
  uint64_t v77;
  uint64_t v78;
  BOOL (*v79)(uint64_t, uint64_t);
  void *v80;
  id v81;
  CMTime v82;
  CMTime v83;
  CMTime buf;
  CMTimeRange time;
  _QWORD v86[4];

  v86[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a7;
  -[PXFlexMusicPathfinder _loadRenditionsIfNeeded](self, "_loadRenditionsIfNeeded");
  -[PXFlexMusicPathfinder song](self, "song");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackA");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v13, "clips");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  objc_msgSend(v14, "clips");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v18, "count") + v17);

  objc_msgSend(v13, "clips");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v20);

  objc_msgSend(v14, "clips");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("position"), 1);
  v86[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortUsingDescriptors:", v23);

  v24 = objc_msgSend(v12, "sampleRate");
  memset(&v83, 0, sizeof(v83));
  time.start = (CMTime)*a3;
  CMTimeConvertScale(&v83, &time.start, v24, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  objc_msgSend(v19, "count");
  v77 = MEMORY[0x1E0C809B0];
  v78 = 3221225472;
  v79 = __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke;
  v80 = &unk_1E512F9C8;
  v25 = v19;
  v82 = v83;
  v81 = v25;
  v26 = PXLastIndexInSortedRangePassingTest();
  if (v26 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&time, 0, sizeof(time));
    CMTimeMake(&start, objc_msgSend(v27, "position"), v24);
    CMTimeMake(&duration, objc_msgSend(v27, "duration"), v24);
    CMTimeRangeMake(&time, &start, &duration);
    range = time;
    lhs = v83;
    if (CMTimeRangeContainsTime(&range, &lhs))
    {
      if (v27)
      {
        v51 = v11;
        memset(&time, 0, 24);
        CMTimeMake(&time.start, objc_msgSend(v27, "position"), v24);
        memset(&range, 0, 24);
        lhs = (CMTime)*a3;
        rhs = time.start;
        CMTimeSubtract(&range.start, &lhs, &rhs);
        memset(&lhs, 0, sizeof(lhs));
        CMTimeMake(&v71, objc_msgSend(v27, "offset"), v24);
        rhs = range.start;
        CMTimeAdd(&lhs, &rhs, &v71);
        v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v12, "idealDurations");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_10;
        v62[3] = &unk_1E512FA18;
        v52 = v12;
        v63 = v12;
        v65 = v24;
        v66 = lhs;
        v67 = *(_OWORD *)&a5->var0;
        var3 = a5->var3;
        v69 = *(_OWORD *)&a6->var0;
        v70 = a6->var3;
        v30 = v28;
        v64 = v30;
        objc_msgSend(v29, "enumerateObjectsUsingBlock:", v62);

        objc_msgSend(v30, "allKeys");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_2;
        v59[3] = &__block_descriptor_56_e29_q24__0__NSValue_8__NSValue_16l;
        v60 = *(_OWORD *)&a5->var0;
        v61 = a5->var3;
        objc_msgSend(v31, "sortedArrayUsingComparator:", v59);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "firstObject");
        v53 = objc_claimAutoreleasedReturnValue();

        memset(&rhs, 0, sizeof(rhs));
        v55 = v32;
        objc_msgSend(v32, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v30;
        objc_msgSend(v30, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "lastObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37)
          objc_msgSend(v37, "CMTimeValue");
        else
          memset(&rhs, 0, sizeof(rhs));

        PLAudioPlaybackGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v42;
        v11 = v51;
        v12 = v52;
        v44 = (void *)v53;
        if (v53)
        {
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            v45 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v55, "firstObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v46;
            if (v46)
              objc_msgSend(v46, "CMTimeValue");
            else
              memset(&v57, 0, sizeof(v57));
            buf = (CMTime)*a5;
            CMTimeSubtract(&v58, &buf, &v57);
            objc_msgSend(v45, "numberWithDouble:", CMTimeGetSeconds(&v58));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf.value) = 138412290;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v47;
            _os_log_impl(&dword_1A6789000, v43, OS_LOG_TYPE_DEBUG, "Found best match path with delta (%@)", (uint8_t *)&buf, 0xCu);

            v44 = (void *)v53;
          }
        }
        else if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl(&dword_1A6789000, v43, OS_LOG_TYPE_ERROR, "Could not find match path within tolerance", (uint8_t *)&buf, 2u);
        }

        v48 = (void (*)(_QWORD *, void *, CMTime *))v51[2];
        buf = rhs;
        v48(v51, v44, &buf);

        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  PLAudioPlaybackGetLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    v40 = (__CFString *)CMTimeCopyDescription(0, &time.start);
    LODWORD(time.start.value) = 138412546;
    *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v10;
    LOWORD(time.start.flags) = 2112;
    *(_QWORD *)((char *)&time.start.flags + 2) = v40;
    _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_ERROR, "Failed to find clip in rendition: %@ containing time %@", (uint8_t *)&time, 0x16u);

  }
  v41 = (void (*)(_QWORD *, _QWORD, CMTimeRange *))v11[2];
  *(_OWORD *)&time.start.value = *MEMORY[0x1E0CA2E18];
  time.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v41(v11, 0, &time);
LABEL_10:

}

- (void)_loadRenditionsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSArray *v7;
  NSArray *renditions;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (!self->_renditions)
  {
    -[PXFlexMusicPathfinder song](self, "song");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idealDurations");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__PXFlexMusicPathfinder__loadRenditionsIfNeeded__block_invoke;
    v10[3] = &unk_1E512FA60;
    v11 = v3;
    v12 = v4;
    v5 = v4;
    v6 = v3;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
    v7 = (NSArray *)objc_msgSend(v5, "copy");
    renditions = self->_renditions;
    self->_renditions = v7;

  }
}

- (FMSong)song
{
  return self->_song;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_renditions, 0);
}

void __48__PXFlexMusicPathfinder__loadRenditionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = 0uLL;
  v8 = 0;
  if (a2)
    objc_msgSend(a2, "CMTimeValue");
  v3 = *(void **)(a1 + 32);
  v5 = v7;
  v6 = v8;
  objc_msgSend(v3, "renditionForDuration:withOptions:", &v5, MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

BOOL __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "position") <= *(_QWORD *)(a1 + 40);

  return v4;
}

void __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
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
  void *v14;
  void *v15;
  CMTime v16;
  CMTime lhs;
  CMTime v18;
  _QWORD v19[6];
  int v20;
  __int128 v21;
  uint64_t v22;
  CMTime v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  CMTime v39;
  __int128 v40;
  uint64_t v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v40 = 0uLL;
  v41 = 0;
  if (v3)
    objc_msgSend(v3, "CMTimeValue");
  v5 = *(void **)(a1 + 32);
  v28 = v40;
  v29 = v41;
  objc_msgSend(v5, "renditionForDuration:withOptions:", &v28, MEMORY[0x1E0C9AA70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v39, 0, sizeof(v39));
  CMTimeMake(&v39, objc_msgSend(v6, "duration"), *(_DWORD *)(a1 + 48));
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__160082;
  v37 = __Block_byref_object_dispose__160083;
  v38 = 0;
  *(_QWORD *)&v28 = 0;
  *((_QWORD *)&v28 + 1) = &v28;
  v29 = 0x3810000000;
  v30 = &unk_1A7E74EE7;
  v31 = *MEMORY[0x1E0CA2E18];
  v32 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(v6, "trackB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clips");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackA");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clips");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_11;
  v19[3] = &unk_1E512F9F0;
  v20 = *(_DWORD *)(a1 + 48);
  v21 = *(_OWORD *)(a1 + 52);
  v22 = *(_QWORD *)(a1 + 68);
  v23 = v39;
  v25 = *(_QWORD *)(a1 + 92);
  v24 = *(_OWORD *)(a1 + 76);
  v27 = *(_QWORD *)(a1 + 116);
  v26 = *(_OWORD *)(a1 + 100);
  v19[4] = &v33;
  v19[5] = &v28;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v19);

  if (v34[5])
  {
    memset(&v18, 0, sizeof(v18));
    lhs = v39;
    v16 = *(CMTime *)(*((_QWORD *)&v28 + 1) + 32);
    CMTimeSubtract(&v18, &lhs, &v16);
    v42[0] = v6;
    lhs = *(CMTime *)(*((_QWORD *)&v28 + 1) + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &lhs);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);
    lhs = v18;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &lhs);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v33, 8);

}

uint64_t __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  CMTime v9;
  CMTime time1;
  CMTime v11;
  CMTime v12;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v16;

  v5 = a2;
  v6 = a3;
  memset(&v16, 0, sizeof(v16));
  if (v5)
    objc_msgSend(v5, "CMTimeValue");
  else
    memset(&lhs, 0, sizeof(lhs));
  rhs = *(CMTime *)(a1 + 32);
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&v16, &time);
  memset(&rhs, 0, sizeof(rhs));
  if (v6)
    objc_msgSend(v6, "CMTimeValue");
  else
    memset(&v11, 0, sizeof(v11));
  time1 = *(CMTime *)(a1 + 32);
  CMTimeSubtract(&v12, &v11, &time1);
  CMTimeAbsoluteValue(&rhs, &v12);
  time1 = v16;
  v9 = rhs;
  v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

void __98__PXFlexMusicPathfinder_findPathFromCurrentTime_inRendition_withTargetRemainder_tolerance_result___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  CMTime v8;
  CMTime time1;
  CMTime v10;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange v17;
  CMTime v18;

  v7 = a2;
  memset(&v18, 0, sizeof(v18));
  CMTimeMake(&v18, objc_msgSend(v7, "offset"), *(_DWORD *)(a1 + 48));
  memset(&v17, 0, sizeof(v17));
  CMTimeMake(&duration, objc_msgSend(v7, "duration"), *(_DWORD *)(a1 + 48));
  start.start = v18;
  CMTimeRangeMake(&v17, &start.start, &duration);
  start = v17;
  time = *(CMTime *)(a1 + 52);
  if (CMTimeRangeContainsTime(&start, &time))
  {
    memset(&start, 0, 24);
    CMTimeMake(&start.start, objc_msgSend(v7, "position"), *(_DWORD *)(a1 + 48));
    memset(&time, 0, sizeof(time));
    lhs = *(CMTime *)(a1 + 52);
    rhs = v18;
    CMTimeSubtract(&time, &lhs, &rhs);
    memset(&lhs, 0, sizeof(lhs));
    rhs = start.start;
    time2 = time;
    CMTimeAdd(&lhs, &rhs, &time2);
    memset(&rhs, 0, sizeof(rhs));
    time2 = *(CMTime *)(a1 + 76);
    v10 = lhs;
    CMTimeSubtract(&rhs, &time2, &v10);
    time2 = rhs;
    v10 = *(CMTime *)(a1 + 100);
    CMTimeSubtract(&v8, &time2, &v10);
    CMTimeAbsoluteValue(&time1, &v8);
    time2 = *(CMTime *)(a1 + 124);
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = lhs;
    }
    *a4 = 1;
  }

}

@end
