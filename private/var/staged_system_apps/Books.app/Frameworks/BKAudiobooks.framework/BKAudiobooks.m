void sub_3FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4018(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  Float64 Seconds;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  _QWORD *v27;
  void *v28;
  id obj;
  _QWORD block[4];
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  CMTime v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime time;
  CMTime buf[2];
  _BYTE v44[128];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v28 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "player"));
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentLoadedTimeRanges"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v39;
      v15 = &stru_39448;
      do
      {
        v16 = 0;
        v17 = v15;
        do
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v16);
          memset(buf, 0, sizeof(buf));
          if (v18)
            objc_msgSend(v18, "CMTimeRangeValue");
          v37 = buf[0];
          v19 = CMTimeGetSeconds(&v37);
          v37 = buf[1];
          v20 = CMTimeGetSeconds(&v37);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
          objc_msgSend(v10, "addObject:", v21);

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
          objc_msgSend(v11, "addObject:", v22);

          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v17, "stringByAppendingFormat:", CFSTR("(%f,%f) "), *(_QWORD *)&v19, *(_QWORD *)&v20));
          v16 = (char *)v16 + 1;
          v17 = v15;
        }
        while (v13 != v16);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v13);
    }
    else
    {
      v15 = &stru_39448;
    }

    v23 = BKAudiobooksBKAVLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0].value) = 134218242;
      *(Float64 *)((char *)&buf[0].value + 4) = Seconds;
      LOWORD(buf[0].flags) = 2114;
      *(_QWORD *)((char *)&buf[0].flags + 2) = v15;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "currentTime=%f cachedTimeRanges=%{public}@", (uint8_t *)buf, 0x16u);
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_4414;
    v32[3] = &unk_38698;
    v33 = v5;
    v25 = v10;
    v34 = v25;
    v26 = v11;
    v35 = v26;
    v3 = v28;
    v36 = v28;
    v27 = objc_retainBlock(v32);
    if (v27)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v27[2])(v27);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_4474;
        block[3] = &unk_386C0;
        v31 = v27;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

  }
}

void sub_4414(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  void (**v4)(void);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "player:loadedTimeRangesDidChange:durations:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v3 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 56));
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

uint64_t sub_4474(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_4668(uint64_t a1)
{
  uint64_t v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1 + 32;
  if ((objc_msgSend(*(id *)(a1 + 32), "isPlayable") & 1) == 0)
  {
    v2 = BKAudiobooksBKAVLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_21338(v1, v3, v4, v5, v6, v7, v8, v9);

  }
}

void sub_4860(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

void sub_4BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4C38(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "observedTimes"));
  objc_msgSend(WeakRetained, "setNeedsToUpdateTimeObservers:", objc_msgSend(v3, "count") != 0);

  if (a1[4])
  {
    v4 = BKAudiobooksBKAVLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_recreateCurrentAssetWithRestoreTime: _seekToTime: %{public}@", buf, 0xCu);
    }

    objc_msgSend(a1[4], "doubleValue");
    v8 = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_4DC0;
    v11[3] = &unk_38760;
    v12 = a1[4];
    v13 = a1[5];
    objc_msgSend(WeakRetained, "_seekToTime:completionHandler:", v11, v8);

  }
  else
  {
    v9 = objc_retainBlock(a1[5]);
    v10 = v9;
    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);

  }
}

void sub_4DC0(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;

  if ((a2 & 1) == 0)
  {
    v4 = BKAudiobooksBKAVLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_recreateCurrentAssetWithRestoreTime: _seekToTime to %{public}@ did not finish", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = objc_retainBlock(*(id *)(a1 + 40));
  v8 = v7;
  if (v7)
    (*((void (**)(id, uint64_t))v7 + 2))(v7, a2);

}

void sub_4E98(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setAsset:", v4);

  v5 = objc_retainBlock(*(id *)(a1 + 32));
  v6 = v5;
  if (v5)
    (*((void (**)(id))v5 + 2))(v5);

}

uint64_t sub_5030(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_5040(uint64_t a1)
{

}

void sub_5048(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_5640(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "scrubPausableDispatchAfterGeneration") == *(id *)(a1 + 40))
    WeakRetained[14] = 1;

}

void sub_5758(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;

  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9))
  {
    v2 = BKAudiobooksStreamingLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9);
      v5 = *(unsigned __int8 *)(a1 + 40);
      v7[0] = 67109376;
      v7[1] = v4;
      v8 = 1024;
      v9 = v5;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "IsStalling %d -> %d", (uint8_t *)v7, 0xEu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = *(_BYTE *)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    objc_msgSend(v6, "player:stallingStateDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

uint64_t sub_5850(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_5928(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;

  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10))
  {
    v2 = BKAudiobooksStreamingLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10);
      v5 = *(unsigned __int8 *)(a1 + 40);
      v7[0] = 67109376;
      v7[1] = v4;
      v8 = 1024;
      v9 = v5;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "IsLoadingResource %d -> %d", (uint8_t *)v7, 0xEu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = *(_BYTE *)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    objc_msgSend(v6, "player:loadingResourcesStateDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

uint64_t sub_5A20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_63E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_643C(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_64B0;
    block[3] = &unk_38710;
    block[4] = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

id sub_64B0(uint64_t a1)
{
  _DWORD *v2;
  int v3;
  void *v4;
  double v5;

  v2 = *(_DWORD **)(a1 + 32);
  v3 = v2[6];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "player"));
  LODWORD(v5) = v3;
  objc_msgSend(v4, "setVolume:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioParameters");
}

void sub_64F8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsLoadingResources:", 0);

}

void sub_652C(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "player"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "outputContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contextID"));
  v4 = objc_msgSend(v3, "copy");
  objc_msgSend(WeakRetained, "setOutputContextID:", v4);

}

id sub_6AF4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = BKAudiobooksBKAVLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "onRouteChange: pause", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "pause");
}

uint64_t sub_6B64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_6F44(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  float v7;
  float v8;
  id v9;
  NSObject *v10;
  float v11;
  int v12;
  int v13;
  id v14;
  double v15;
  _QWORD block[4];
  id v17;
  id v18;
  int v19;
  float v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessLog"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

    objc_msgSend(v5, "indicatedBitrate");
    v7 = v6;
    objc_msgSend(WeakRetained, "lastBitrate");
    if (v8 != v7)
    {
      v9 = BKAudiobooksStreamingLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "lastBitrate");
        *(_DWORD *)buf = 134218240;
        v22 = v11;
        v23 = 2048;
        v24 = v7;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Bit Rate %.0f -> %.0f.", buf, 0x16u);
      }

      objc_msgSend(WeakRetained, "lastBitrate");
      v13 = v12;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_70F0;
      block[3] = &unk_388B8;
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
      v18 = WeakRetained;
      v19 = v13;
      v20 = v7;
      v14 = v17;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      *(float *)&v15 = v7;
      objc_msgSend(WeakRetained, "setLastBitrate:", v15);

    }
  }

}

id sub_70F0(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  return objc_msgSend(*(id *)(a1 + 32), "player:bitrateChangedFrom:to:", *(_QWORD *)(a1 + 40), a2, a3);
}

void sub_7240(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  void *v6;
  id v7;
  id v8;

  if ((_DWORD)a2)
  {
    v4 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "pendingCurrentTime");
    if (vabdd_f64(v4, v5) < 0.01)
      objc_msgSend(*(id *)(a1 + 32), "setPendingCurrentTime:", 1.79769313e308);
    if (objc_msgSend(*(id *)(a1 + 32), "isCurrentTimeValid"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      objc_msgSend(v6, "player:positionDidChange:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

    }
  }
  v7 = objc_retainBlock(*(id *)(a1 + 40));
  if (v7)
  {
    v8 = v7;
    (*((void (**)(id, uint64_t))v7 + 2))(v7, a2);
    v7 = v8;
  }

}

void sub_7588(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;

  if ((a2 & 1) == 0)
  {
    v4 = BKAudiobooksBKAVLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 134217984;
      v10 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_seekToTime to %lf did not finish (setCurrentTime)", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = objc_retainBlock(*(id *)(a1 + 32));
  v8 = v7;
  if (v7)
    (*((void (**)(id, uint64_t))v7 + 2))(v7, a2);

}

void sub_78D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_78F4(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  double v4;
  _QWORD *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9[2];

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && WeakRetained[19] == *(_QWORD *)(a1 + 40))
  {
    *((_BYTE *)WeakRetained + 13) = 1;
    LODWORD(v4) = 0;
    objc_msgSend(WeakRetained, "_playWithSeekTime:fadeIn:", *((double *)WeakRetained + 13), v4);
    v6 = (void *)(v5[19] + 1);
    v5[19] = v6;
    v7 = dispatch_time(0, 200000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_79E8;
    v8[3] = &unk_38800;
    objc_copyWeak(v9, v2);
    v9[1] = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
    objc_destroyWeak(v9);
  }

}

void sub_79E8(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*((_QWORD *)WeakRetained + 19) == *(_QWORD *)(a1 + 40))
    WeakRetained[14] = 1;

}

void sub_7A24(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;

  if ((a2 & 1) == 0)
  {
    v4 = BKAudiobooksBKAVLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 134217984;
      v10 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_seekToTime to %lf did not finish (_handleScrubPlayPreviewAtTime:completion:)", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = objc_retainBlock(*(id *)(a1 + 32));
  v8 = v7;
  if (v7)
    (*((void (**)(id, uint64_t))v7 + 2))(v7, a2);

}

void sub_848C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double Seconds;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  CMTime time;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pendingCurrentTime");
  v4 = *(void **)(a1 + 32);
  if (v5 == 1.79769313e308)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

  }
  else
  {
    objc_msgSend(v4, "pendingCurrentTime");
    Seconds = v8;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = *(void **)(a1 + 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Seconds));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_85F0;
  v13[3] = &unk_38980;
  objc_copyWeak(&v15, &location);
  v12 = v3;
  v14 = v12;
  objc_msgSend(v10, "_recreateCurrentAssetWithRestoreTime:completion:", v11, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void sub_85CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_85F0(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_86BC;
  v6[3] = &unk_38958;
  objc_copyWeak(&v8, v4);
  v9 = a2;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_activateSessionWithCompletion:", v6);

  objc_destroyWeak(&v8);
}

void sub_86A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_86BC(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (a2 && WeakRetained && *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "updateTimeObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "player"));
    objc_msgSend(v8, "playbackRate");
    objc_msgSend(v5, "playImmediatelyAtRate:");

  }
  v6 = objc_retainBlock(*(id *)(a1 + 32));
  v7 = v6;
  if (v6)
    (*((void (**)(id))v6 + 2))(v6);

}

void sub_8750(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8828;
  v6[3] = &unk_389D0;
  objc_copyWeak(&v8, &location);
  v5 = v3;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "_activateSessionWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void sub_880C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_8828(id *a1, int a2)
{
  id WeakRetained;
  void *v5;
  float v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  int v16;
  int v17;
  double v18;
  _QWORD v19[5];
  id v20;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "updateTimeObservers");
    objc_msgSend(v5, "playFadeInTime");
    if (fabsf(v6) >= 0.01)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "player"));
      LODWORD(v14) = 0;
      objc_msgSend(v13, "setRate:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "player"));
      objc_msgSend(a1[4], "playbackRate");
      v17 = v16;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_8970;
      v19[3] = &unk_38760;
      v19[4] = v5;
      v20 = a1[5];
      LODWORD(v18) = v17;
      objc_msgSend(v15, "prerollAtRate:completionHandler:", v19, v18);

      goto LABEL_8;
    }
    objc_msgSend(v5, "playbackRate");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "player"));
    LODWORD(v10) = v8;
    objc_msgSend(v9, "setRate:", v10);

  }
  v11 = objc_retainBlock(a1[5]);
  v12 = v11;
  if (v11)
    (*((void (**)(id))v11 + 2))(v11);

LABEL_8:
}

void sub_8970(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  float v5;
  double v6;
  id v7;
  void *v8;
  CMTime v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "player"));
  objc_msgSend(*(id *)(a1 + 32), "playbackRate");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "playFadeInTime");
  CMTimeMakeWithSeconds(&v9, v5, 1000000000);
  LODWORD(v6) = v4;
  objc_msgSend(v2, "setRate:withVolumeRampDuration:", &v9, v6);

  v7 = objc_retainBlock(*(id *)(a1 + 40));
  v8 = v7;
  if (v7)
    (*((void (**)(id))v7 + 2))(v7);

}

uint64_t sub_8A08(uint64_t a1, char a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;

  if ((a2 & 1) == 0)
  {
    v3 = BKAudiobooksBKAVLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingCurrentTime");
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_seekToTime to %lf did not finish (_playWithSeekTime)", (uint8_t *)&v7, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_8B54(uint64_t a1, char a2, void *a3)
{
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8BF8;
  block[3] = &unk_38A20;
  v8 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_8BF8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!*(_BYTE *)(a1 + 48) || *(_QWORD *)(a1 + 32))
  {
    v2 = BKAudiobooksBKAVLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_215D4(a1, v3, v4, v5, v6, v7, v8, v9);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_9590(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_95B8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "outputContextID"));
    LODWORD(v3) = objc_msgSend(v3, "isEqualToString:", v4);

    WeakRetained = v6;
    if ((_DWORD)v3)
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 56);
      objc_msgSend(v6, "_reevaluateInternalVolumeWithContextCanSetVolume:volume:", *(unsigned __int8 *)(a1 + 60), v5);
      WeakRetained = v6;
    }
  }

}

uint64_t sub_9634(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_9B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9B4C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;

  v2 = BKAudiobooksBKAVLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v8 = 134217984;
    v9 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "observed time: %.1f", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v7 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "player:didReachPosition:", v7, *(double *)(a1 + 40));

}

void sub_A080(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_A0A8(uint64_t a1, CMTime *a2)
{
  id WeakRetained;
  void *v4;
  float v5;
  double Seconds;
  double v7;
  void *v8;
  CMTime v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_actualRate");
    if (v5 > 0.0)
    {
      v9 = *a2;
      Seconds = CMTimeGetSeconds(&v9);
      objc_msgSend(v4, "lastPosition");
      if (vabdd_f64(Seconds, v7) >= 0.00999999978)
      {
        objc_msgSend(v4, "setLastPosition:", Seconds);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
        objc_msgSend(v8, "player:positionDidChange:", v4, Seconds);

      }
    }
  }

}

void sub_A6CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_A6DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_A718(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_A77C(id a1)
{
  BKAudiobookPersistenceController *v1;
  void *v2;

  v1 = objc_opt_new(BKAudiobookPersistenceController);
  v2 = (void *)qword_44D80;
  qword_44D80 = (uint64_t)v1;

}

void sub_A90C(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stores"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", *(_QWORD *)(a1 + 32)));
    objc_msgSend(v5, "setStores:", v4);

    WeakRetained = v5;
  }

}

void sub_AAA4(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  void *v19;
  id v20;
  id obj;
  void *v22;
  _QWORD block[4];
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];

  v2 = dispatch_group_create();
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v20 = WeakRetained;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stores"));
    if (*(_BYTE *)(a1 + 64))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stores"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_38B00));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v6));

      v4 = (void *)v7;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v2);
          v12 = BKAudiobooksPersistenceLog();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetID"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shortName"));
            *(_DWORD *)buf = 138478083;
            v41 = v14;
            v42 = 2114;
            v43 = v15;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Checking for bookmark on assetID %{private}@ on store %{public}@", buf, 0x16u);

          }
          v16 = *(_QWORD *)(a1 + 32);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_AE64;
          v30[3] = &unk_38B50;
          objc_copyWeak(&v35, (id *)(a1 + 56));
          v31 = v2;
          v32 = *(id *)(a1 + 32);
          v33 = v11;
          v34 = v22;
          objc_msgSend(v11, "bookmarkTimeForAudiobook:completion:", v16, v30);

          objc_destroyWeak(&v35);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v8);
    }

    global_queue = dispatch_get_global_queue(2, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B1F4;
    block[3] = &unk_38BB8;
    v24 = v2;
    v25 = *(id *)(a1 + 32);
    v26 = v22;
    v27 = v20;
    v19 = *(void **)(a1 + 48);
    v28 = *(_QWORD *)(a1 + 40);
    v29 = v19;
    dispatch_async(v18, block);

    WeakRetained = v20;
  }

}

void sub_AE40(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL sub_AE5C(id a1, BKAudiobookBookmarkPersisting *a2, NSDictionary *a3)
{
  return -[BKAudiobookBookmarkPersisting isLocal](a2, "isLocal", a3);
}

void sub_AE64(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  NSObject **WeakRetained;
  NSObject **v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  double v24;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = WeakRetained[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_AFC0;
    block[3] = &unk_38B28;
    v18 = v7;
    v19 = v8;
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(a1 + 56);
    v20 = v12;
    v21 = v13;
    v22 = v14;
    v24 = a4;
    v23 = *(id *)(a1 + 32);
    dispatch_async(v11, block);

  }
  else
  {
    v15 = BKAudiobooksPersistenceLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "self nil", buf, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void sub_AFC0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;

  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    v8 = BKAudiobooksPersistenceLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "assetID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "shortName"));
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138478339;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Found bookmark on assetID %{private}@ on store %{public}@ error: %{public}@", buf, 0x20u);

    }
    v13 = *(void **)(a1 + 64);
    v3 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 80), CFSTR("bookmark time")));
    v14 = *(_QWORD *)(a1 + 32);
    v18[0] = v3;
    v18[1] = v14;
    v17[1] = CFSTR("timestamp");
    v17[2] = CFSTR("source");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "shortName"));
    v18[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    objc_msgSend(v13, "addObject:", v16);

  }
  else
  {
    v2 = BKAudiobooksPersistenceLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "assetID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "shortName"));
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138478595;
      v20 = v4;
      v21 = 2114;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "No bookmark for assetID %{private}@ on store %{public}@ date: %@ error: %{public}@", buf, 0x2Au);

    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_B1F4(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v2 = *(NSObject **)(a1 + 32);
  v3 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v2, v3))
  {
    v4 = BKAudiobooksPersistenceLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_217A4(a1, v5);

  }
  v6 = *(void **)(a1 + 48);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_B2E4;
  v10[3] = &unk_38698;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 64);
  v11 = v8;
  v12 = v9;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 72);
  dispatch_async(v7, v10);

}

void sub_B2E4(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;

  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[4], "sortUsingComparator:", &stru_38B90);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "lastObject"));
    v3 = objc_opt_class(NSNumber);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bookmark time")));
    v5 = BUDynamicCast(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("timestamp")));
    objc_msgSend(a1[5], "_rollbackAmountForLastPlayedDate:", v9);
    v11 = v10;
    objc_msgSend(a1[6], "duration");
    if (v8 > v12 + -5.0)
    {
      v13 = BKAudiobooksPersistenceLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "assetID"));
        v27 = 138412290;
        v28 = v15;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "For %@ bookmark time is past our last viable bookmark time. Resetting to zero.", (uint8_t *)&v27, 0xCu);

      }
      v11 = 0.0;
      v8 = 0.0;
    }
    v16 = BKAudiobooksPersistenceLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "assetID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("source")));
      v20 = a1[4];
      v27 = 138478851;
      v28 = v18;
      v29 = 2048;
      v30 = v8;
      v31 = 2114;
      v32 = v9;
      v33 = 2114;
      v34 = v19;
      v35 = 2114;
      v36 = v20;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "For %{private}@ picking bookmark time %lf dated %{public}@ from source %{public}@.  Whole list of available bookmarks: %{public}@", (uint8_t *)&v27, 0x34u);

    }
    v21 = objc_retainBlock(a1[7]);
    v22 = v21;
    if (v21)
      (*((void (**)(id, void *, _QWORD, double, double))v21 + 2))(v21, v9, 0, v8, v11);

  }
  else
  {
    v23 = BKAudiobooksPersistenceLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "assetID"));
      v27 = 138477827;
      v28 = v25;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "For audiobook %{private}@, cannot find a bookmark time.", (uint8_t *)&v27, 0xCu);

    }
    v26 = objc_retainBlock(a1[7]);
    v2 = v26;
    if (v26)
      (*((void (**)(id, _QWORD, _QWORD, double, double))v26 + 2))(v26, 0, 0, 0.0, 0.0);
  }

}

int64_t sub_B5E8(id a1, NSDictionary *a2, NSDictionary *a3)
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", CFSTR("timestamp")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("timestamp")));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

void sub_B78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_B7A4(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  _BYTE v27[128];

  v2 = dispatch_group_create();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_BA40;
  v25[4] = sub_BA50;
  v26 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stores"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v9 = *(_QWORD *)(a1 + 56);
          if (v9 >= (uint64_t)objc_msgSend(v8, "eventThreshold", v13))
          {
            dispatch_group_enter(v2);
            v10 = *(double *)(a1 + 64);
            v11 = *(_QWORD *)(a1 + 32);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_BA58;
            v17[3] = &unk_38C30;
            objc_copyWeak(&v20, (id *)(a1 + 48));
            v19 = v25;
            v18 = v2;
            objc_msgSend(v8, "saveBookmarkTime:audiobook:completion:", v11, v17, v10);

            objc_destroyWeak(&v20);
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v5);
    }

    v12 = *((_QWORD *)v13 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_BB48;
    block[3] = &unk_38C58;
    v15 = *(id *)(a1 + 40);
    v16 = v25;
    dispatch_group_notify(v2, v12, block);

    WeakRetained = v13;
  }

  _Block_object_dispose(v25, 8);
}

void sub_BA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_BA40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_BA50(uint64_t a1)
{

}

void sub_BA58(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BB10;
  block[3] = &unk_38C08;
  v10 = v3;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v7 = v3;
  dispatch_async(v5, block);

}

void sub_BB10(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5)
    v4 = *(void **)(a1 + 32);
  objc_storeStrong(v3, v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_BB48(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_retainBlock(*(id *)(a1 + 32));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(id, _QWORD))v2 + 2))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v2 = v3;
  }

}

void sub_BEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_BF04(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = BKAudiobooksPersistenceLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_21858((uint64_t)v6, v10);

  }
  else
  {
    objc_msgSend(WeakRetained, "saveBookmarkTime:audiobook:importance:completion:", *(_QWORD *)(a1 + 32), 5, 0, a2);
  }

}

__CFString *NSStringFromBKAudiobookPlayerState(unint64_t a1)
{
  if (a1 >= 5)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected value %ld"), a1));
  else
    return off_38CC8[a1];
}

void sub_CE2C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = BKAudiobooksStreamingLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Finished fetching decryption key with error: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  v9 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v9, "finishLoadingWithError:", v6);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentInformationRequest"));
    objc_msgSend(v10, "setContentType:", AVStreamingKeyDeliveryPersistentContentKeyType);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataRequest"));
    objc_msgSend(v11, "respondWithData:", v5);

    objc_msgSend(*(id *)(a1 + 32), "finishLoading");
  }

}

void sub_CF54(_Unwind_Exception *exception_object, int a2, ...)
{
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  va_list va;

  va_start(va, a2);
  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    objc_msgSend(*(id *)(v2 + 32), "finishLoadingWithError:", 0);
    v4 = BKAudiobooksStreamingLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reason"));
      sub_218CC(v6, (uint8_t *)va, v5);
    }

    objc_end_catch();
    JUMPOUT(0xCF18);
  }
  _Unwind_Resume(exception_object);
}

void sub_D150(id a1)
{
  id v1;
  NSObject *v2;
  BKAudiobookNowPlayingAdaptorMediaLibrary *v3;
  void *v4;
  BKAudiobookNowPlayingAdaptorMediaLibrary *v5;
  void *v6;
  BKAudiobookNowPlayingAdaptorMediaLibrary *v7;
  void *v8;
  __int16 v9[8];

  v1 = BKAudiobooksNowPlayingAdaptorLog();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "initializing BKAudiobookNowPlayingAdaptor", (uint8_t *)v9, 2u);
  }

  v3 = [BKAudiobookNowPlayingAdaptorMediaLibrary alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  v5 = -[BKAudiobookNowPlayingAdaptor initWithPlayer:](v3, "initWithPlayer:", v4);

  v6 = (void *)qword_44D98;
  qword_44D98 = (uint64_t)v5;
  v7 = v5;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPNowPlayingInfoCenter defaultCenter](MPNowPlayingInfoCenter, "defaultCenter"));
  objc_msgSend(v8, "setPlaybackQueueDataSource:", v7);

}

void sub_DF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_DF58(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2)
    a2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetID"));
  if (objc_msgSend(*(id *)(a1 + 32), "isAudiobookPreview"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nowPlayingAudiobookArtworkForPreviews"));

    if (v6)
    {
      v7 = BKAudiobooksNowPlayingAdaptorLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Returning artwork for previewed audiobook.", buf, 2u);
      }

      v9 = *(_QWORD *)(a1 + 48);
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nowPlayingAudiobookArtworkForPreviews"));
      (*(void (**)(uint64_t, NSObject *, _QWORD))(v9 + 16))(v9, v10, 0);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "artworkCompletionBlocks"));

      if (v13)
      {
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "artworkCompletionBlocks"));
        v15 = objc_retainBlock(*(id *)(a1 + 48));
        objc_msgSend(v14, "addObject:", v15);
      }
      else
      {
        v14 = objc_retainBlock(*(id *)(a1 + 48));
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v14));
        objc_msgSend(*(id *)(a1 + 40), "setArtworkCompletionBlocks:", v15);
      }

      v22 = BKAudiobooksNowPlayingAdaptorLog();
      v10 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "No artwork available for audiobook preview. Fetching artwork.", buf, 2u);
      }
    }

  }
  else if (!a2
         && (v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "genericCoverProvider"))) != 0
         && (v17 = (void *)v16, v18 = objc_msgSend(v5, "length"), v17, v18))
  {
    v19 = BKAudiobooksNowPlayingAdaptorLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Generating artwork for active audiobook. None available already on the audiobook.", buf, 2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "genericCoverProvider"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_E260;
    v23[3] = &unk_38D40;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v21, "fetchCoverForAssetID:size:completion:", v5, v23, *(double *)(a1 + 64), *(double *)(a1 + 72));

  }
  else
  {
    v11 = BKAudiobooksNowPlayingAdaptorLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Returning artwork for active audiobook found on the current audiobook.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_E260(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;
  CGSize v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", a2));
  v7 = BKAudiobooksNowPlayingAdaptorLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "size");
    v9 = NSStringFromCGSize(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Finished generating artwork for active audiobook (%{public}@)", (uint8_t *)&v11, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id BKAudiobooksLog()
{
  if (qword_44DA8 != -1)
    dispatch_once(&qword_44DA8, &stru_38D88);
  return (id)qword_44DA0;
}

void sub_EC48(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks");
  v2 = (void *)qword_44DA0;
  qword_44DA0 = (uint64_t)v1;

}

id BKAudiobooksBKAVLog()
{
  if (qword_44DB8 != -1)
    dispatch_once(&qword_44DB8, &stru_38DA8);
  return (id)qword_44DB0;
}

void sub_ECB8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.BKAVPlayer");
  v2 = (void *)qword_44DB0;
  qword_44DB0 = (uint64_t)v1;

}

id BKAudiobooksSleepTimerLog()
{
  if (qword_44DC8 != -1)
    dispatch_once(&qword_44DC8, &stru_38DC8);
  return (id)qword_44DC0;
}

void sub_ED28(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.sleepTimer");
  v2 = (void *)qword_44DC0;
  qword_44DC0 = (uint64_t)v1;

}

id BKAudiobooksMediaRemoteLog()
{
  if (qword_44DD8 != -1)
    dispatch_once(&qword_44DD8, &stru_38DE8);
  return (id)qword_44DD0;
}

void sub_ED98(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.mediaRemote");
  v2 = (void *)qword_44DD0;
  qword_44DD0 = (uint64_t)v1;

}

id BKAudiobooksNowPlayingAdaptorLog()
{
  if (qword_44DE8 != -1)
    dispatch_once(&qword_44DE8, &stru_38E08);
  return (id)qword_44DE0;
}

void sub_EE08(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.nowPlayingAdaptor");
  v2 = (void *)qword_44DE0;
  qword_44DE0 = (uint64_t)v1;

}

id BKAudiobooksSkipControllerLog()
{
  if (qword_44DF8 != -1)
    dispatch_once(&qword_44DF8, &stru_38E28);
  return (id)qword_44DF0;
}

void sub_EE78(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.skipController");
  v2 = (void *)qword_44DF0;
  qword_44DF0 = (uint64_t)v1;

}

id BKAudiobooksPersistenceLog()
{
  if (qword_44E08 != -1)
    dispatch_once(&qword_44E08, &stru_38E48);
  return (id)qword_44E00;
}

void sub_EEE8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.persistence");
  v2 = (void *)qword_44E00;
  qword_44E00 = (uint64_t)v1;

}

id BKAudiobooksPersistenceCloudKitLog()
{
  if (qword_44E18 != -1)
    dispatch_once(&qword_44E18, &stru_38E68);
  return (id)qword_44E10;
}

void sub_EF58(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.persistence.cloudkit");
  v2 = (void *)qword_44E10;
  qword_44E10 = (uint64_t)v1;

}

id BKAudiobooksPersistenceMediaLibraryLocalLog()
{
  if (qword_44E28 != -1)
    dispatch_once(&qword_44E28, &stru_38E88);
  return (id)qword_44E20;
}

void sub_EFC8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.persistence.ml.local");
  v2 = (void *)qword_44E20;
  qword_44E20 = (uint64_t)v1;

}

id BKAudiobooksPersistenceMediaLibraryDAAPLog()
{
  if (qword_44E38 != -1)
    dispatch_once(&qword_44E38, &stru_38EA8);
  return (id)qword_44E30;
}

void sub_F038(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.persistence.ml.daap");
  v2 = (void *)qword_44E30;
  qword_44E30 = (uint64_t)v1;

}

id BKBTClassicLog()
{
  if (qword_44E48 != -1)
    dispatch_once(&qword_44E48, &stru_38EC8);
  return (id)qword_44E40;
}

void sub_F0A8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKBTClassic");
  v2 = (void *)qword_44E40;
  qword_44E40 = (uint64_t)v1;

}

id BKAudiobooksStreamingLog()
{
  if (qword_44E58 != -1)
    dispatch_once(&qword_44E58, &stru_38EE8);
  return (id)qword_44E50;
}

void sub_F118(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BKAudiobooks.HLSStreaming");
  v2 = (void *)qword_44E50;
  qword_44E50 = (uint64_t)v1;

}

id BKAudiobooksBundle()
{
  if (qword_44E68 != -1)
    dispatch_once(&qword_44E68, &stru_38F08);
  return (id)qword_44E60;
}

void sub_F1F8(id a1)
{
  NSBundle *v1;
  uint64_t v2;
  void *v3;

  v1 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BKAudiobooksBundleLookupClass));
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_44E60;
  qword_44E60 = v2;

}

void sub_F5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_F60C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setGuid:", v4);

  v6 = BKAudiobooksLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Received GUID for audiobook: %@", (uint8_t *)&v8, 0xCu);
  }

}

void sub_F874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_F890(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 4, a2);
  v6 = objc_retainBlock(*(id *)(a1 + 32));
  v7 = v6;
  if (v6)
    (*((void (**)(id, id))v6 + 2))(v6, v8);

}

void sub_F988(uint64_t a1, void *a2)
{
  void (**v3)(id, id);
  id v4;

  v4 = a2;
  v3 = (void (**)(id, id))objc_retainBlock(*(id *)(a1 + 32));
  if (v3)
    v3[2](v3, objc_msgSend(objc_retainAutorelease(v4), "CGImage"));

}

void sub_113CC(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_skipTimerFired");
    WeakRetained = v2;
  }

}

void sub_11720(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_seekTimerFired");
    WeakRetained = v2;
  }

}

void sub_125F0(id a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v5 = objc_msgSend(v1, "mutableCopy");

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(",-")));
  objc_msgSend(v5, "formUnionWithCharacterSet:", v2);

  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)qword_44E70;
  qword_44E70 = (uint64_t)v3;

}

void sub_14D0C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(void);
  void (**v10)(void);
  void (*v11)(void);
  void (**v12)(void);

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = BKAudiobooksLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21B00(a1, (uint64_t)v6, v8);

    v9 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 40));
    v10 = v9;
    if (v9)
    {
      v11 = v9[2];
LABEL_8:
      v11();
    }
  }
  else
  {
    v12 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 40));
    v10 = v12;
    if (v12)
    {
      v11 = v12[2];
      goto LABEL_8;
    }
  }

}

void sub_14E84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = BKAudiobooksLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21C14((uint64_t)v6, v8, v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1551C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_15948(id a1)
{
  NSDateComponentsFormatter *v1;
  void *v2;
  NSDateComponentsFormatter *v3;
  void *v4;

  v1 = objc_opt_new(NSDateComponentsFormatter);
  v2 = (void *)qword_44E80;
  qword_44E80 = (uint64_t)v1;

  objc_msgSend((id)qword_44E80, "setUnitsStyle:", 2);
  objc_msgSend((id)qword_44E80, "setAllowedUnits:", 96);
  objc_msgSend((id)qword_44E80, "setMaximumUnitCount:", 2);
  objc_msgSend((id)qword_44E80, "setFormattingContext:", 5);
  v3 = objc_opt_new(NSDateComponentsFormatter);
  v4 = (void *)qword_44E88;
  qword_44E88 = (uint64_t)v3;

  objc_msgSend((id)qword_44E88, "setUnitsStyle:", 2);
  objc_msgSend((id)qword_44E88, "setAllowedUnits:", 128);
  objc_msgSend((id)qword_44E88, "setMaximumUnitCount:", 2);
  objc_msgSend((id)qword_44E88, "setFormattingContext:", 5);
}

void sub_1666C(id a1)
{
  BKAudiobookSleepTimer *v1;
  void *v2;

  v1 = objc_opt_new(BKAudiobookSleepTimer);
  v2 = (void *)qword_44E98;
  qword_44E98 = (uint64_t)v1;

}

id sub_16A28(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  double Seconds;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  CMTime v10;
  CMTime time;
  uint8_t buf[16];

  v2 = BKAudiobooksSleepTimerLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Sleep timer expired at end of chapter.", buf, 2u);
  }

  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "timeRangeInTrack");
  else
    memset(&v10, 0, sizeof(v10));
  time = v10;
  Seconds = CMTimeGetSeconds(&time);
  v6 = BKAudiobooksSleepTimerLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (Seconds == 0.0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Next chapter is the first in a track file.  Remembering to pause playback when state returns to Playing", buf, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "setWaitingForPlayerStatePlayingThenPause:", 1);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Pausing playback", buf, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 48), "pause");
  }
}

id sub_16C80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_177F8(id a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v5 = objc_msgSend(v1, "mutableCopy");

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(",-")));
  objc_msgSend(v5, "formUnionWithCharacterSet:", v2);

  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)qword_44EA8;
  qword_44EA8 = (uint64_t)v3;

}

void sub_18B70(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  v2 = objc_msgSend(v1, "initWithPlayer:", v4);
  v3 = (void *)qword_44EC0;
  qword_44EC0 = (uint64_t)v2;

}

void sub_19340(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1935C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  id WeakRetained;

  v2 = objc_opt_class(NSNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v4 = BUDynamicCast(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "BOOLValue");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSkipBehavior:", v6 ^ 1);

}

uint64_t sub_193F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_196C4(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "contentItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  *a4 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return *a4;
}

void sub_1A76C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_44ED0;
  qword_44ED0 = (uint64_t)v1;

}

void sub_1B5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5F4(uint64_t a1)
{
  id WeakRetained;
  double v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_addTimeObserversForTrack:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTimeBeforeCurrentTrackWithTrackIndex:", *(_QWORD *)(a1 + 56));
  v3 = *(double *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1B6B8;
  v5[3] = &unk_39118;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(WeakRetained, "_updatePlayerWithOffsetInTrack:chapterIndex:hasTrackChanged:changedArtworkBlock:currentTimeCompletion:", v4, 1, v5, *(_QWORD *)(a1 + 40), v3);

}

id sub_1B6B8(uint64_t a1)
{
  unsigned int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasAlternateArtwork");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "artworkForTime:", *(double *)(a1 + 40));
  else
    return objc_msgSend(v3, "artwork");
}

void sub_1C8E4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendIsScrubbing");

}

void sub_1CA1C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendPlaybackRateDidChange");

}

void sub_1CE44(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1CE60(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_configureAudioSession");
  objc_msgSend(WeakRetained, "pause");
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "player"));
  objc_msgSend(v1, "reset");

}

uint64_t sub_1CEB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CFFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D018(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  _OWORD *v8;
  _QWORD v9[4];
  CMTime rhs;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CMTime lhs;
  CMTime v15;
  CMTime time1;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTime time2;

  v7 = a2;
  if (objc_msgSend(v7, "albumTrackNumber") == *(id *)(a1 + 40))
  {
    v8 = (_OWORD *)(a1 + 48);
    if (v7)
    {
      objc_msgSend(v7, "timeRangeInTrack");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
    }
    *(_OWORD *)&time2.value = v17;
    time2.epoch = v18;
    *(_OWORD *)&time1.value = *v8;
    time1.epoch = *(_QWORD *)(a1 + 64);
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    if (v7)
    {
      objc_msgSend(v7, "timeRangeInTrack");
      *(_OWORD *)&lhs.value = v11;
      lhs.epoch = v12;
      objc_msgSend(v7, "timeRangeInTrack");
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
      v11 = 0u;
      memset(&lhs, 0, sizeof(lhs));
      memset(v9, 0, sizeof(v9));
    }
    rhs = *(CMTime *)&v9[1];
    CMTimeAdd(&v15, &lhs, &rhs);
    *(_OWORD *)&time1.value = *v8;
    time1.epoch = *(_QWORD *)(a1 + 64);
    if (CMTimeCompare(&time1, &v15) < 0)
      *a4 = 1;
  }

}

id sub_1EF58(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  return objc_msgSend(v1, "artworkForTime:");
}

void sub_1F658(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1F66C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1F6B0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id sub_1F6F8(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

id sub_1F700()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

void sub_1F868(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(id, _QWORD, void *, double);
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD, void *, double);
  id v18;
  uint8_t buf[4];
  void *v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "assetID"));
  v3 = BKAudiobooksPersistenceCloudKitLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20 = v2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "bookmarkTimeForAudiobook:completion: querying assetDetailManager on assetID %{private}@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "assetDetailManager"));
  if (v5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1FA24;
    v16[3] = &unk_391D8;
    v17 = v2;
    v18 = a1[6];
    objc_msgSend(v5, "assetDetailForAssetID:completion:", v17, v16);

    v6 = v17;
  }
  else
  {
    v7 = BKAudiobooksPersistenceCloudKitLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_22718((uint64_t)v2, v8, v9, v10, v11, v12, v13, v14);

    v6 = (void (**)(id, _QWORD, void *, double))objc_retainBlock(a1[6]);
    if (v6)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAudiobooksError"), 2, 0));
      v6[2](v6, 0, v15, 0.0);

    }
  }

}

void sub_1FA24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(id, void *, id, double);
  double v10;
  double v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = BKAudiobooksPersistenceCloudKitLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_2277C(a1, (uint64_t)v6, v8);

  }
  v9 = (void (**)(id, void *, id, double))objc_retainBlock(*(id *)(a1 + 40));
  if (v9)
  {
    objc_msgSend(v5, "bookmarkTime");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "datePlaybackTimeUpdated"));
    v9[2](v9, v12, v6, v11);

  }
}

void sub_1FCD0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  id v24;
  NSObject *v25;
  double v26;
  double v27;
  float v28;
  double v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  float v36;
  float v37;
  uint8_t buf[4];
  double v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  double v43;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = BKAudiobooksPersistenceCloudKitLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_22858((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    v15 = objc_retainBlock(*(id *)(a1 + 56));
    v16 = v15;
    if (v15)
      (*((void (**)(id, id))v15 + 2))(v15, v6);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v17 = BKAudiobooksPersistenceCloudKitLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(double *)(a1 + 32);
      v20 = *(double *)(a1 + 64);
      *(_DWORD *)buf = 138412802;
      v39 = v19;
      v40 = 2112;
      v41 = v16;
      v42 = 2048;
      v43 = v20;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "AssetDetailManager %@ Audiobook Setting bookmark time [%@ = %.2f].", buf, 0x20u);
    }

    objc_msgSend(v5, "setBookmarkTime:", *(double *)(a1 + 64));
    objc_msgSend(v5, "setDatePlaybackTimeUpdated:", v16);
    objc_msgSend(v5, "setLastOpenDate:", v16);
    objc_msgSend(*(id *)(a1 + 40), "duration");
    v22 = v21;
    v23 = 0.0;
    if (v21 != 0.0)
      v23 = *(double *)(a1 + 64) / v21;
    if (v23 < 0.0 || v23 > 1.0)
    {
      v24 = BKAudiobooksPersistenceCloudKitLog();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      v26 = v23;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v5, "bookmarkTime");
        *(_DWORD *)buf = 134218496;
        v39 = v26;
        v40 = 2048;
        v41 = v31;
        v42 = 2048;
        v43 = v22;
        _os_log_fault_impl(&dword_0, v25, OS_LOG_TYPE_FAULT, "Calculated reading progress out of range %f.  bookmarkTime=%f audiobookDuration=%f", buf, 0x20u);
      }

      v23 = BUClamp(v26, 0.0, 1.0);
    }
    objc_msgSend(v5, "readingProgressHighWaterMark");
    if (*(float *)&v27 >= v23)
      v28 = *(float *)&v27;
    else
      v28 = v23;
    *(float *)&v27 = v23;
    objc_msgSend(v5, "setReadingProgress:", v27);
    *(float *)&v29 = v28;
    objc_msgSend(v5, "setReadingProgressHighWaterMark:", v29);
    objc_msgSend(v5, "setReadingPositionLocationUpdateDate:", v16);
    v30 = *(void **)(a1 + 48);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1FFBC;
    v32[3] = &unk_39228;
    v33 = *(id *)(a1 + 32);
    v35 = *(_QWORD *)(a1 + 64);
    v36 = v23;
    v37 = v28;
    v34 = *(id *)(a1 + 56);
    objc_msgSend(v30, "setAssetDetail:completion:", v5, v32);

  }
}

void sub_1FFBC(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;

  v6 = a4;
  v7 = BKAudiobooksPersistenceCloudKitLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(float *)(a1 + 56);
      v13 = *(float *)(a1 + 60);
      v16 = 138413058;
      v17 = v10;
      v18 = 2048;
      v19 = v11;
      v20 = 2048;
      v21 = v12;
      v22 = 2048;
      v23 = v13;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Successful save of bookmark time for %@ to %lf, readingProgress %f, readingProgressHighWaterMark %f", (uint8_t *)&v16, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_228BC(a1, (uint64_t)v6, v9);
  }

  v14 = objc_retainBlock(*(id *)(a1 + 40));
  v15 = v14;
  if (v14)
    (*((void (**)(id, id))v14 + 2))(v14, v6);

}

void sub_20110(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_20200(id a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v4 = objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v4, "removeCharactersInString:", CFSTR("&="));
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)qword_44ED8;
  qword_44ED8 = (uint64_t)v2;

}

BOOL sub_208C0(uint64_t a1, void *a2)
{
  id v3;

  v3 = objc_msgSend(a2, "persistentID");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "persistentID");
}

void sub_20E80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20EC8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20ED8(uint64_t a1)
{

}

void sub_20EE0(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v8 - *(double *)(a1 + 64);
  objc_msgSend(v18, "doubleValue");
  if (v9 >= 0.0)
  {
    if (v9 < *(double *)(a1 + 72))
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
      objc_msgSend(v14, "addObject:", v15);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v18);
    }
  }
  else
  {
    v11 = v9 + v10;
    if (v9 + v10 > 0.0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", &off_3A188);
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
      objc_msgSend(v12, "addObject:", v13);

    }
  }
  v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9 + *(double *)(a1 + 80)));
  objc_msgSend(v16, "addObject:", v17);

}

void sub_2114C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21164(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  objc_msgSend(a2, "doubleValue");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audiobookDurations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3));
  objc_msgSend(v10, "doubleValue");
  v12 = v8 + v11;

  v13 = *(double *)(a1 + 48);
  if (v13 >= v8 && v13 < v12)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 - v13));
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    *a4 = 1;
  }
}

void sub_212CC(id a1)
{
  id v1;
  id v2;
  id v3;

  v1 = +[BKAudiobookNowPlayingAdaptor sharedInstance](BKAudiobookNowPlayingAdaptor, "sharedInstance");
  v2 = +[BKAudiobookMediaRemoteAdaptor startAdaptor](BKAudiobookMediaRemoteAdaptor, "startAdaptor");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  objc_msgSend(v3, "setSupportsAlternateArtwork:", 1);
  objc_msgSend(v3, "setSecondsToRewindAfterInterruption:", 3);

}

void sub_21338(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6DC(&dword_0, a2, a3, "Setting asset that reports .isPlayable = NO %@", a5, a6, a7, a8, 2u);
  sub_A710();
}

void sub_213A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "unable to reset player, no last position to restore", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_213CC(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;

  v4 = *a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "currentItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "errorLog"));
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  sub_A718(&dword_0, a3, v7, "AVPlayerItemStatusFailed: %@. \n%@", (uint8_t *)&v8);

  sub_A700();
}

void sub_2147C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "playerItemDidStallPlayback", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_214A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6DC(&dword_0, a2, a3, "playerItemFailedToReachEnd: %@", a5, a6, a7, a8, 2u);
  sub_A710();
}

void sub_21510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "player current time NAN, using 0", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_2153C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "setCurrentTime: time < 0", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_21568(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6DC(&dword_0, a2, a3, "_playWithSeekTime: self.playbackRate = %f, resetting to 1.0", a5, a6, a7, a8, 0);
  sub_A710();
}

void sub_215D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6DC(&dword_0, a2, a3, "Failed to activate audio session (%@)", a5, a6, a7, a8, 2u);
  sub_A710();
}

void sub_2163C(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorDomain"));
  v6 = 138543618;
  v7 = v4;
  v8 = 2048;
  v9 = objc_msgSend(a1, "errorStatusCode");
  sub_A718(&dword_0, a2, v5, "assetNetworkError: domain=%{public}@ code=%ld", (uint8_t *)&v6);

  sub_A700();
}

void sub_216DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "invalid current time encountered while updating time ovservers", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_21708(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_0, a1, OS_LOG_TYPE_ERROR, "invalid time to observer: %@", (uint8_t *)&v3, 0xCu);

}

void sub_217A4(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "assetID"));
  v5 = *(_QWORD *)(a1 + 48);
  v6 = 138478083;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Timed out waiting for bookmark times on assetID %{private}@ bookmarkTimesAvailable=%@", (uint8_t *)&v6, 0x16u);

}

void sub_21858(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error retrieving bookmark from local store to populate cloud: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_218CC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "exception in loadingRequest finishLoading: %@", buf, 0xCu);

}

void sub_21920(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Audiobook player is not the active output. Providing no image.", v1, 2u);
}

void sub_21960(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Can't generate ML artwork, no representative item", v1, 2u);
}

void sub_219A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "Skip or seek are already occurring, can't start skip.", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_219CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "Skip is not occurring.", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_219F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "Skip or seek are already occurring.", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_21A24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "Skip or seek are already occurring, can't start seek.", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_21A50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "Seek is not occurring, can't endSeek.", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_21A7C(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = objc_msgSend(*a1, "persistentID");
  v5 = 134217984;
  v6 = v3;
  sub_1551C(&dword_0, a2, v4, "No chapters in %llu.", (uint8_t *)&v5);
}

void sub_21B00(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mediaItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bk_storeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mediaItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bk_storePlaylistID"));
  v10 = 141559042;
  v11 = 1752392040;
  v12 = 2112;
  v13 = v7;
  v14 = 2160;
  v15 = 1752392040;
  v16 = 2112;
  v17 = v9;
  v18 = 2112;
  v19 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Error fetching racGUID for storeID %{mask.hash}@ storePlaylistID %{mask.hash}@: %@", (uint8_t *)&v10, 0x34u);

}

void sub_21C14(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_1551C(&dword_0, a2, a3, "Error getting racGUID from HLS playlist: %@", (uint8_t *)&v3);
}

void sub_21C80(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Attempting to construct a media query using an identifier that is invalid.", v1, 2u);
}

void sub_21CC0(void *a1, NSObject *a2)
{
  int v3;
  id v4;

  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "bk_cloudItems has %lu items and should only have one", (uint8_t *)&v3, 0xCu);
}

void sub_21D48(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "requested playback of chapter for empty contentItemID", v1, 2u);
}

void sub_21D88(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_1551C(&dword_0, a2, a3, "failed to resolve chapter from contentItemID %@", (uint8_t *)&v3);
}

void sub_21DF4(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  id v5;

  v4 = 134217984;
  v5 = objc_msgSend(a1, "type");
  sub_1551C(&dword_0, a2, v3, "Received unhandled event type: %lu", (uint8_t *)&v4);
  sub_1A6EC();
}

void sub_21E6C()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1F6EC();
  objc_msgSend(v2, "currentTrackIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "currentAudiobook"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tracks"));
  sub_1F6F8(v4, v5);
  sub_1F6D4();
  sub_1F658(&dword_0, v6, v7, "track index %lu out of range [0,%lu]", v8, v9, v10, v11, 0);

  sub_A700();
}

void sub_21F10()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1F6EC();
  objc_msgSend(v2, "currentChapterIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "currentAudiobook"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chapters"));
  sub_1F6F8(v4, v5);
  sub_1F6D4();
  sub_1F658(&dword_0, v6, v7, "chapter index %lu out of range [0,%lu]", v8, v9, v10, v11, 0);

  sub_A700();
}

void sub_21FB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1F6E0();
  sub_A6DC(&dword_0, v0, v1, "setCurrentTrackIndex: track offset %f out of range", v2, v3, v4, v5, v6);
  sub_A710();
}

void sub_22018()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1F6A4();
  sub_A6DC(&dword_0, v0, v1, "setCurrentTrackIndex: track index %lu out of range", v2, v3, v4, v5, v6);
  sub_A710();
}

void sub_22078()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1F6E0();
  sub_A6DC(&dword_0, v0, v1, "setCurrentChapterIndex: chapter offset %f out of range", v2, v3, v4, v5, v6);
  sub_A710();
}

void sub_220DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1F6A4();
  sub_A6DC(&dword_0, v0, v1, "setCurrentChapterIndex: chapter index %lu out of range", v2, v3, v4, v5, v6);
  sub_A710();
}

void sub_2213C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "currentAudiobook"));
  sub_1F6D4();
  sub_1F658(&dword_0, v2, v3, "Unable to find time %.1lf in audiobook %@", v4, v5, v6, v7, 2u);

}

void sub_221D4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1F6E0();
  sub_1F6D4();
  sub_A718(&dword_0, v0, v1, "Unable to find time %.1lf in chapter %@", v2);
  sub_A710();
}

void sub_22240(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "currentAudiobook"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chapters"));
  sub_1F6F8(v3, v4);
  sub_1F6D4();
  sub_1F658(&dword_0, v5, v6, "requested playing chapter %lu out of range [0,%lu]", v7, v8, v9, v10, 0);

  sub_A700();
}

void sub_222DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "Requesting playback rate from an invalid speed enum. Defaulting to 1.0.", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_22308()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1F6E0();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "_chapterAtOffset: %f", v1, 0xCu);
  sub_A710();
}

void sub_22378(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "positionInCurrentChapter");
  sub_1F6E0();
  sub_1F66C(&dword_0, v1, v2, "observer: position = %f", v3, v4, v5, v6, v7);
  sub_1A6EC();
}

void sub_223E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1F6A4();
  sub_A6DC(&dword_0, v0, v1, "observer: player error = %@", v2, v3, v4, v5, v6);
  sub_A710();
}

void sub_22444()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1F6A4();
  sub_A6DC(&dword_0, v0, v1, "observer: playback stalled error = %@", v2, v3, v4, v5, v6);
  sub_A710();
}

void sub_224A4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "currentAudiobook"));
  sub_1F6A4();
  sub_1F66C(&dword_0, v2, v3, "observer: audiobook = %@", v4, v5, v6, v7, v8);

  sub_1A6EC();
}

void sub_2251C()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1F6EC();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
  sub_1F700();
  sub_1F680();
  sub_1F6B0(&dword_0, v2, v3, "_playerErrorWithPlayer:error: unknown error: {d=%{public}@ c=%ld, (%@)}", v4, v5, v6, v7, v8);

  sub_1F6C4();
}

void sub_22598()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "_playerErrorWithPlayer:error: content not authorized", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_225C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_A6F4();
  sub_A6CC(&dword_0, v0, v1, "_playerErrorWithPlayer:error: media services reset", v2, v3, v4, v5, v6);
  sub_A6EC();
}

void sub_225F0()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1F6EC();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
  sub_1F700();
  sub_1F680();
  sub_1F6B0(&dword_0, v2, v3, "_playerErrorWithPlayer:error: current item has network error: {d=%{public}@ c=%ld, (%@)}", v4, v5, v6, v7, v8);

  sub_1F6C4();
}

void sub_2266C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_A6F4();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "chapter unchanged", v1, 2u);
  sub_A6EC();
}

void sub_226A4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_1F6A4();
  v3 = 2112;
  v4 = v0;
  sub_A718(&dword_0, v1, (uint64_t)v1, "player:loadedTimeRangesDidChange:durations: - start times and durations counts must be the same: %@, %@", v2);
  sub_A710();
}

void sub_22718(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6DC(&dword_0, a2, a3, "Nil assetDetailManager - cannot fetch assetID %{private}@", a5, a6, a7, a8, 3u);
  sub_A710();
}

void sub_2277C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138478083;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_20110(&dword_0, a2, a3, "Error retrieving bookmark time on assetID %{private}@ from CloudKit/BookDataStore: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_A710();
}

void sub_227F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6CC(&dword_0, a1, a3, "Cannot save bookmark time because assetID is nil", a5, a6, a7, a8, 0);
}

void sub_22824(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6CC(&dword_0, a1, a3, "Nil assetDetailManager", a5, a6, a7, a8, 0);
}

void sub_22858(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6DC(&dword_0, a2, a3, "Error retrieving asset detail for saving bookmark time from CloudKit/BookDataStore: %{public}@", a5, a6, a7, a8, 2u);
  sub_A710();
}

void sub_228BC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  sub_20110(&dword_0, a2, a3, "Error saving asset details for audiobook %@ time update:%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_A710();
}

void sub_22930(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to generate assetID for media item %@.", (uint8_t *)&v2, 0xCu);
}

void sub_229A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6CC(&dword_0, a1, a3, "Artwork was nil. No cover image available.", a5, a6, a7, a8, 0);
}

void sub_229D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_A6CC(&dword_0, a1, a3, "Artwork catalog catalog was nil. Falling back to artwork property.", a5, a6, a7, a8, 0);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CMTimeRangeValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CMTimeRangeValue");
}

id objc_msgSend_CMTimeValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CMTimeValue");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLAssetWithURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLAssetWithURL:options:");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__activateSessionWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activateSessionWithCompletion:");
}

id objc_msgSend__actualRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_actualRate");
}

id objc_msgSend__addPeriodicTimeObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addPeriodicTimeObserver");
}

id objc_msgSend__addTimeObserversForTrack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addTimeObserversForTrack:");
}

id objc_msgSend__bookmarkTime_timestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bookmarkTime:timestamp:");
}

id objc_msgSend__canEndSeek(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canEndSeek");
}

id objc_msgSend__canEndSkip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canEndSkip");
}

id objc_msgSend__canStartSeek(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canStartSeek");
}

id objc_msgSend__canStartSkip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canStartSkip");
}

id objc_msgSend__cancelSeek(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelSeek");
}

id objc_msgSend__cancelSkip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelSkip");
}

id objc_msgSend__chapterAtOffset_inTrack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_chapterAtOffset:inTrack:");
}

id objc_msgSend__configureAudioSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureAudioSession");
}

id objc_msgSend__duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_duration:");
}

id objc_msgSend__expired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_expired");
}

id objc_msgSend__expiresAtChapterEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_expiresAtChapterEnd");
}

id objc_msgSend__fetchKeysForMediaItem_loadingRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchKeysForMediaItem:loadingRequest:");
}

id objc_msgSend__fireAndFreeArtworkCompletionBlocksWithImage_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fireAndFreeArtworkCompletionBlocksWithImage:error:");
}

id objc_msgSend__generateShortTimeRemainingStringFromControls_finishedString_unfinishedStringFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateShortTimeRemainingStringFromControls:finishedString:unfinishedStringFormat:");
}

id objc_msgSend__handleScrubPlayPreviewAtTime_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleScrubPlayPreviewAtTime:completion:");
}

id objc_msgSend__hasBeenPlayed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasBeenPlayed:");
}

id objc_msgSend__initialVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initialVolume");
}

id objc_msgSend__invalidateAllowingCancelNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateAllowingCancelNotification:");
}

id objc_msgSend__isStreamingAssetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isStreamingAssetURL");
}

id objc_msgSend__lookupRacGUIDFromHLSPlaylistWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lookupRacGUIDFromHLSPlaylistWithCompletion:");
}

id objc_msgSend__mediaItemsFromAudiobook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mediaItemsFromAudiobook:");
}

id objc_msgSend__mediaQueryFromAudiobook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mediaQueryFromAudiobook:");
}

id objc_msgSend__pause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pause");
}

id objc_msgSend__playWithSeekTime_fadeIn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playWithSeekTime:fadeIn:");
}

id objc_msgSend__playWithSeekTime_fadeIn_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playWithSeekTime:fadeIn:completion:");
}

id objc_msgSend__playbackFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playbackFailedWithError:");
}

id objc_msgSend__playbackStalledWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playbackStalledWithError:");
}

id objc_msgSend__playerErrorWithPlayer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playerErrorWithPlayer:error:");
}

id objc_msgSend__popToStashedTimeInterval_skipDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_popToStashedTimeInterval:skipDirection:");
}

id objc_msgSend__processSkipEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processSkipEvent");
}

id objc_msgSend__pushTemporaryTimeInterval_skipDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pushTemporaryTimeInterval:skipDirection:");
}

id objc_msgSend__recreateCurrentAssetWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recreateCurrentAssetWithCompletion:");
}

id objc_msgSend__recreateCurrentAssetWithRestoreTime_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recreateCurrentAssetWithRestoreTime:completion:");
}

id objc_msgSend__reevaluateInternalVolumeWithContextCanSetVolume_volume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reevaluateInternalVolumeWithContextCanSetVolume:volume:");
}

id objc_msgSend__reevaluateVolumeFromPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reevaluateVolumeFromPlayer");
}

id objc_msgSend__registerAssetForDRMGroupIDDelegation_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerAssetForDRMGroupIDDelegation:completion:");
}

id objc_msgSend__removeAllTimeObserversWithClearObservedTimes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeAllTimeObserversWithClearObservedTimes:");
}

id objc_msgSend__removePeriodicTimeObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removePeriodicTimeObserver");
}

id objc_msgSend__representativeItemFromAudibook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_representativeItemFromAudibook:");
}

id objc_msgSend__revalidatePlayerItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_revalidatePlayerItem");
}

id objc_msgSend__rollbackAmountForLastPlayedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rollbackAmountForLastPlayedDate:");
}

id objc_msgSend__scheduleSeekTimerWithInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleSeekTimerWithInterval:");
}

id objc_msgSend__scheduleSkipTimerWithInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleSkipTimerWithInterval:");
}

id objc_msgSend__seekTimerFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_seekTimerFired");
}

id objc_msgSend__seekToTime_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_seekToTime:completionHandler:");
}

id objc_msgSend__sendArtworkDidChangeTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendArtworkDidChangeTo:");
}

id objc_msgSend__sendAudiobookDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendAudiobookDidChange");
}

id objc_msgSend__sendAudiobookWillChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendAudiobookWillChange");
}

id objc_msgSend__sendBufferedTimeRangesDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendBufferedTimeRangesDidChange");
}

id objc_msgSend__sendChapterDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendChapterDidChange");
}

id objc_msgSend__sendCurrentPositionDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendCurrentPositionDidChange");
}

id objc_msgSend__sendDidEndSeekingObserverCallbacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendDidEndSeekingObserverCallbacks");
}

id objc_msgSend__sendDidEndSkippingObserverCallbacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendDidEndSkippingObserverCallbacks");
}

id objc_msgSend__sendIsScrubbing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendIsScrubbing");
}

id objc_msgSend__sendPlaybackRateDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendPlaybackRateDidChange");
}

id objc_msgSend__sendPlayerFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendPlayerFailedWithError:");
}

id objc_msgSend__sendPlayerStalledWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendPlayerStalledWithError:");
}

id objc_msgSend__sendReachedEndOfAudiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendReachedEndOfAudiobook");
}

id objc_msgSend__sendStateDidChangeFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendStateDidChangeFrom:to:");
}

id objc_msgSend__sendUpdatedCumulativeDeltaCallbacks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendUpdatedCumulativeDeltaCallbacks:");
}

id objc_msgSend__sendWillPauseObserverCallbacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendWillPauseObserverCallbacks");
}

id objc_msgSend__sendWillWillBeginSeekingObserverCallbacksWithDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendWillWillBeginSeekingObserverCallbacksWithDirection:");
}

id objc_msgSend__sendWillWillBeginSkippingObserverCallbacksWithDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendWillWillBeginSkippingObserverCallbacksWithDirection:");
}

id objc_msgSend__setCurrentChapterIndex_offset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCurrentChapterIndex:offset:completion:");
}

id objc_msgSend__setCurrentPosition_track_chapter_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCurrentPosition:track:chapter:completion:");
}

id objc_msgSend__setCurrentTrackIndex_offset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCurrentTrackIndex:offset:completion:");
}

id objc_msgSend__setInternalVolumeAndNotify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setInternalVolumeAndNotify:");
}

id objc_msgSend__setSkipBackwardCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSkipBackwardCommand");
}

id objc_msgSend__setSkipForwardCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSkipForwardCommand");
}

id objc_msgSend__setTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setTimer");
}

id objc_msgSend__skipBackwardCommandEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipBackwardCommandEvent");
}

id objc_msgSend__skipForwardCommandEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipForwardCommandEvent");
}

id objc_msgSend__skipTimerFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipTimerFired");
}

id objc_msgSend__stateString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stateString");
}

id objc_msgSend__storeIDFromAudiobook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storeIDFromAudiobook:");
}

id objc_msgSend__timeRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_timeRemaining:");
}

id objc_msgSend__unregisterAssetForDRMGroupIDDelegation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unregisterAssetForDRMGroupIDDelegation:");
}

id objc_msgSend__updatePlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePlayer");
}

id objc_msgSend__updatePlayerWithOffsetInTrack_chapterIndex_hasTrackChanged_changedArtworkBlock_currentTimeCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePlayerWithOffsetInTrack:chapterIndex:hasTrackChanged:changedArtworkBlock:currentTimeCompletion:");
}

id objc_msgSend__updateTimeBeforeCurrentTrackWithTrackIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateTimeBeforeCurrentTrackWithTrackIndex:");
}

id objc_msgSend__upgradeLastPeriodicBookmarkTimeWithPlayer_audiobook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_upgradeLastPeriodicBookmarkTimeWithPlayer:audiobook:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accelerateToInterval_afterEventCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accelerateToInterval:afterEventCount:");
}

id objc_msgSend_accelerationMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accelerationMap");
}

id objc_msgSend_accessLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessLog");
}

id objc_msgSend_actionSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionSource");
}

id objc_msgSend_activateWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithOptions:completionHandler:");
}

id objc_msgSend_addBoundaryTimeObserverForTimes_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBoundaryTimeObserverForTimes:queue:usingBlock:");
}

id objc_msgSend_addContentKeyRecipient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContentKeyRecipient:");
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFilterPredicate:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPeriodicTimeObserverForInterval_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPeriodicTimeObserverForInterval:queue:usingBlock:");
}

id objc_msgSend_addTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:");
}

id objc_msgSend_addTimeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimeObserver:");
}

id objc_msgSend_addTracks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTracks:");
}

id objc_msgSend_albumArtist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albumArtist");
}

id objc_msgSend_albumPersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albumPersistentID");
}

id objc_msgSend_albumTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albumTitle");
}

id objc_msgSend_albumTrackNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albumTrackNumber");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObservers");
}

id objc_msgSend_alternateArtworkTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateArtworkTimes");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artist");
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artwork");
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artworkCatalog");
}

id objc_msgSend_artworkCompletionBlocks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artworkCompletionBlocks");
}

id objc_msgSend_artworkWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artworkWithCompletion:");
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asset");
}

id objc_msgSend_assetDetailForAssetID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetDetailForAssetID:completion:");
}

id objc_msgSend_assetDetailManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetDetailManager");
}

id objc_msgSend_assetID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetID");
}

id objc_msgSend_assetNetworkError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetNetworkError");
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetURL");
}

id objc_msgSend_audibleDRMGroupID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audibleDRMGroupID");
}

id objc_msgSend_audiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audiobook");
}

id objc_msgSend_audiobookControls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audiobookControls");
}

id objc_msgSend_audiobookDurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audiobookDurations");
}

id objc_msgSend_audiobookPlayerActiveOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audiobookPlayerActiveOutput");
}

id objc_msgSend_audiobookQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audiobookQuery");
}

id objc_msgSend_audiobooksQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audiobooksQuery");
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "author");
}

id objc_msgSend_backwardSeekSpeedMultiplier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backwardSeekSpeedMultiplier");
}

id objc_msgSend_backwardSkipTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backwardSkipTime");
}

id objc_msgSend_baseEventInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseEventInterval");
}

id objc_msgSend_bestImageFromDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestImageFromDisk");
}

id objc_msgSend_bk_UTF8Title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_UTF8Title");
}

id objc_msgSend_bk_artworkImageWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_artworkImageWithCompletion:");
}

id objc_msgSend_bk_assetID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_assetID");
}

id objc_msgSend_bk_assetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_assetURL");
}

id objc_msgSend_bk_audiobooksQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_audiobooksQuery");
}

id objc_msgSend_bk_cloudItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_cloudItems");
}

id objc_msgSend_bk_effectiveAuthor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_effectiveAuthor");
}

id objc_msgSend_bk_effectiveTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_effectiveTitle");
}

id objc_msgSend_bk_isAudible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_isAudible");
}

id objc_msgSend_bk_isAudioFileExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_isAudioFileExtension");
}

id objc_msgSend_bk_isItemAudibleAudiobook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_isItemAudibleAudiobook:");
}

id objc_msgSend_bk_isJaliscoAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_isJaliscoAsset");
}

id objc_msgSend_bk_isPlaylistExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_isPlaylistExtension");
}

id objc_msgSend_bk_isStreamingAssetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_isStreamingAssetURL");
}

id objc_msgSend_bk_localItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_localItems");
}

id objc_msgSend_bk_queryWithStoreID_albumTitle_isCloudItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_queryWithStoreID:albumTitle:isCloudItem:");
}

id objc_msgSend_bk_storeDemoAssetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_storeDemoAssetURL");
}

id objc_msgSend_bk_storeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_storeID");
}

id objc_msgSend_bk_storePlaylistID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_storePlaylistID");
}

id objc_msgSend_bookmarkTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bookmarkTime");
}

id objc_msgSend_bookmarkTimeForAudiobook_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bookmarkTimeForAudiobook:completion:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bu_sha1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bu_sha1");
}

id objc_msgSend_bufferInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufferInfo");
}

id objc_msgSend_bufferProducer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufferProducer");
}

id objc_msgSend_bufferedDurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufferedDurations");
}

id objc_msgSend_bufferedStartTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufferedStartTimes");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cachedAssetID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedAssetID");
}

id objc_msgSend_canSetVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canSetVolume");
}

id objc_msgSend_cancelPendingSeeks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPendingSeeks");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_changePlaybackPositionCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePlaybackPositionCommand");
}

id objc_msgSend_changePlaybackRateCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePlaybackRateCommand");
}

id objc_msgSend_chapterIndexInAudiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chapterIndexInAudiobook");
}

id objc_msgSend_chapterOfType_atTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chapterOfType:atTime:");
}

id objc_msgSend_chapters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chapters");
}

id objc_msgSend_chaptersOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chaptersOfType:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_coalescedLoadedTimeRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coalescedLoadedTimeRanges");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collections");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completion");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containingTrack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingTrack");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentInformationRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentInformationRequest");
}

id objc_msgSend_contentItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentItem");
}

id objc_msgSend_contentItemForPreviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentItemForPreviews");
}

id objc_msgSend_contentItemID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentItemID");
}

id objc_msgSend_contentKeyRecipients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentKeyRecipients");
}

id objc_msgSend_contentKeyResponseWithAuthorizationTokenData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentKeyResponseWithAuthorizationTokenData:");
}

id objc_msgSend_contentKeySessionWithKeySystem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentKeySessionWithKeySystem:");
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextID");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfChaptersOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfChaptersOfType:");
}

id objc_msgSend_coverArt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coverArt");
}

id objc_msgSend_coverArtWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coverArtWithCompletion:");
}

id objc_msgSend_currentAudiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAudiobook");
}

id objc_msgSend_currentChapter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentChapter");
}

id objc_msgSend_currentChapterIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentChapterIndex");
}

id objc_msgSend_currentDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDate");
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentItem");
}

id objc_msgSend_currentLoadedTimeRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLoadedTimeRanges");
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTime");
}

id objc_msgSend_currentTrack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTrack");
}

id objc_msgSend_currentTrackIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTrackIndex");
}

id objc_msgSend_customChapterTitleForMediaItem_mediaChapter_chapterIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customChapterTitleForMediaItem:mediaChapter:chapterIndex:");
}

id objc_msgSend_customTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customTitle");
}

id objc_msgSend_dataRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataRequest");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSource");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateAccessed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateAccessed");
}

id objc_msgSend_dateLastOpened(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateLastOpened");
}

id objc_msgSend_datePlaybackTimeUpdated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "datePlaybackTimeUpdated");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deltaFromStartingPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deltaFromStartingPoint:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "direction");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_durationOfCurrentAudiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationOfCurrentAudiobook");
}

id objc_msgSend_durationOfCurrentChapter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationOfCurrentChapter");
}

id objc_msgSend_durationOfCurrentTrack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationOfCurrentTrack");
}

id objc_msgSend_effectiveStopTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveStopTime");
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elapsedTime");
}

id objc_msgSend_endSeek(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSeek");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorComment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorComment");
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorDomain");
}

id objc_msgSend_errorLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorLog");
}

id objc_msgSend_errorStatusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorStatusCode");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventThreshold");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_expiresAtChapterEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expiresAtChapterEnd");
}

id objc_msgSend_fadeIn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fadeIn:");
}

id objc_msgSend_fadeOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fadeOut:");
}

id objc_msgSend_fetchCoverForAssetID_size_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchCoverForAssetID:size:completion:");
}

id objc_msgSend_fetchOfflineKeyForMediaItem_identity_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchOfflineKeyForMediaItem:identity:completion:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finishLoading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishLoading");
}

id objc_msgSend_finishLoadingWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishLoadingWithError:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_forwardSeekSpeedMultiplier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forwardSeekSpeedMultiplier");
}

id objc_msgSend_forwardSkipTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forwardSkipTime");
}

id objc_msgSend_genericCoverProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "genericCoverProvider");
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "genre");
}

id objc_msgSend_getRacGUIDFromMasterPlaylistURL_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRacGUIDFromMasterPlaylistURL:completion:");
}

id objc_msgSend_hasAlternateArtwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAlternateArtwork");
}

id objc_msgSend_hasAudibleBooksContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAudibleBooksContent");
}

id objc_msgSend_hasBeenPlayed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasBeenPlayed");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithCGImage:");
}

id objc_msgSend_imageWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithSize:");
}

id objc_msgSend_indexOfObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectIdenticalTo:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indicatedBitrate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indicatedBitrate");
}

id objc_msgSend_infoWithAudiobookPositions_audiobookDurations_chapterPositions_chapterDurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoWithAudiobookPositions:audiobookDurations:chapterPositions:chapterDurations:");
}

id objc_msgSend_initCanUseCellularData_powerRequired_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initCanUseCellularData:powerRequired:bundleID:");
}

id objc_msgSend_initWithAlbumPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAlbumPersistentID:");
}

id objc_msgSend_initWithAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAsset:completion:");
}

id objc_msgSend_initWithAssetID_albumTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetID:albumTitle:");
}

id objc_msgSend_initWithAudiobook_mediaItem_startTime_startChapterNumber_trackNumber_trackCount_storeDemoMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAudiobook:mediaItem:startTime:startChapterNumber:trackNumber:trackCount:storeDemoMode:");
}

id objc_msgSend_initWithAudiobookControls_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAudiobookControls:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithMediaChapter_track_number_trackNumber_trackCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaChapter:track:number:trackNumber:trackCount:");
}

id objc_msgSend_initWithMediaQuery_supplementalAssetIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaQuery:supplementalAssetIDs:");
}

id objc_msgSend_initWithNotifyBlock_blockDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNotifyBlock:blockDescription:");
}

id objc_msgSend_initWithPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersistentID:");
}

id objc_msgSend_initWithPlayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPlayer:");
}

id objc_msgSend_initWithResourceLoader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResourceLoader:");
}

id objc_msgSend_initWithTitle_assetIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:assetIdentifier:");
}

id objc_msgSend_initialDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialDuration");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interval");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidatePlaybackQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidatePlaybackQueue");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAudibleBooksContentAuthorized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAudibleBooksContentAuthorized");
}

id objc_msgSend_isAudiobookPreview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAudiobookPreview");
}

id objc_msgSend_isCloudItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudItem");
}

id objc_msgSend_isCurrentTimeValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCurrentTimeValid");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExplicitItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExplicitItem");
}

id objc_msgSend_isLoadingResources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoadingResources");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isPlayable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlayable");
}

id objc_msgSend_isPlaybackLikelyToKeepUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaybackLikelyToKeepUp");
}

id objc_msgSend_isPlaybackPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaybackPending");
}

id objc_msgSend_isPlaying(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaying");
}

id objc_msgSend_isPositionValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPositionValid");
}

id objc_msgSend_isScrubbing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isScrubbing");
}

id objc_msgSend_isSeeking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSeeking");
}

id objc_msgSend_isSkipping(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSkipping");
}

id objc_msgSend_isStalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStalling");
}

id objc_msgSend_isStopping(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStopping");
}

id objc_msgSend_isStoreDemoMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStoreDemoMode");
}

id objc_msgSend_isStreaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStreaming");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "items");
}

id objc_msgSend_lastBitrate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastBitrate");
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastError");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastPosition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPosition");
}

id objc_msgSend_lastSeekPosition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSeekPosition");
}

id objc_msgSend_lastSentRemainingTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSentRemainingTime");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:");
}

id objc_msgSend_loadedTimeRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadedTimeRanges");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logInstance");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_lookupRacGUIDWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupRacGUIDWithCompletion:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mediaItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItem");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaType");
}

id objc_msgSend_movePositionInCurrentAudiobook_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movePositionInCurrentAudiobook:completion:");
}

id objc_msgSend_movePositionInCurrentChapter_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movePositionInCurrentChapter:completion:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_needsToUpdateTimeObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsToUpdateTimeObservers");
}

id objc_msgSend_newCommandEventWithInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newCommandEventWithInterval:");
}

id objc_msgSend_nextChapterOrRestartAudiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextChapterOrRestartAudiobook");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextTrackCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextTrackCommand");
}

id objc_msgSend_nowPlayingAudiobookArtworkForPreviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nowPlayingAudiobookArtworkForPreviews");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_observedTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observedTimes");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observers");
}

id objc_msgSend_onSkipBackward_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onSkipBackward:");
}

id objc_msgSend_onSkipForward_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onSkipForward:");
}

id objc_msgSend_outputContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputContext");
}

id objc_msgSend_outputContextID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputContextID");
}

id objc_msgSend_outputContextQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputContextQueue");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pause");
}

id objc_msgSend_pauseCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseCommand");
}

id objc_msgSend_pausedTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pausedTime");
}

id objc_msgSend_pendingAssetAuth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingAssetAuth");
}

id objc_msgSend_pendingCurrentTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingCurrentTime");
}

id objc_msgSend_periodicTimeObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "periodicTimeObserver");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentID");
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "play");
}

id objc_msgSend_playChapterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playChapterAtIndex:");
}

id objc_msgSend_playCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playCommand");
}

id objc_msgSend_playCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playCount");
}

id objc_msgSend_playCountSinceSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playCountSinceSync");
}

id objc_msgSend_playFadeInTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playFadeInTime");
}

id objc_msgSend_playImmediatelyAtRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playImmediatelyAtRate:");
}

id objc_msgSend_playItemInQueueCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playItemInQueueCommand");
}

id objc_msgSend_playSkipSoundEffect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playSkipSoundEffect");
}

id objc_msgSend_playbackDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackDuration");
}

id objc_msgSend_playbackRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackRate");
}

id objc_msgSend_playbackRateFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackRateFrom:");
}

id objc_msgSend_playbackSpeedFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackSpeedFrom:");
}

id objc_msgSend_playbackTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackTime");
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player");
}

id objc_msgSend_player_artworkDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:artworkDidChange:");
}

id objc_msgSend_player_audiobookDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:audiobookDidChange:");
}

id objc_msgSend_player_audiobookWillChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:audiobookWillChange:");
}

id objc_msgSend_player_bitRateChangedFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:bitRateChangedFrom:to:");
}

id objc_msgSend_player_bufferedPositionsDidChangeInChapter_bufferInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:bufferedPositionsDidChangeInChapter:bufferInfo:");
}

id objc_msgSend_player_chapterDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:chapterDidChange:");
}

id objc_msgSend_player_currentPositionDidChange_inChapter_absolutePosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:currentPositionDidChange:inChapter:absolutePosition:");
}

id objc_msgSend_player_didReachPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:didReachPosition:");
}

id objc_msgSend_player_failedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:failedWithError:");
}

id objc_msgSend_player_isScrubbing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:isScrubbing:");
}

id objc_msgSend_player_isStalling_isLoadingResources_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:isStalling:isLoadingResources:");
}

id objc_msgSend_player_loadedTimeRangesDidChange_durations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:loadedTimeRangesDidChange:durations:");
}

id objc_msgSend_player_loadingResourcesStateDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:loadingResourcesStateDidChange:");
}

id objc_msgSend_player_playbackRateDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:playbackRateDidChange:");
}

id objc_msgSend_player_playbackStalledWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:playbackStalledWithError:");
}

id objc_msgSend_player_positionDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:positionDidChange:");
}

id objc_msgSend_player_reachedEndOfAudiobook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:reachedEndOfAudiobook:");
}

id objc_msgSend_player_stallingStateDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:stallingStateDidChange:");
}

id objc_msgSend_player_stateChangedFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:stateChangedFrom:to:");
}

id objc_msgSend_player_stateDidChangeFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:stateDidChangeFrom:to:");
}

id objc_msgSend_player_volumeDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player:volumeDidChange:");
}

id objc_msgSend_playerCurrentItemEnded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerCurrentItemEnded:");
}

id objc_msgSend_playerDataSource_didCancelLoadingRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerDataSource:didCancelLoadingRequest:");
}

id objc_msgSend_playerDataSource_shouldWaitForLoadingOfRequestedAudioFile_fileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerDataSource:shouldWaitForLoadingOfRequestedAudioFile:fileName:");
}

id objc_msgSend_playerDataSource_shouldWaitForLoadingOfRequestedPlaylist_fileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerDataSource:shouldWaitForLoadingOfRequestedPlaylist:fileName:");
}

id objc_msgSend_playerItemWithAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerItemWithAsset:");
}

id objc_msgSend_playerWasInterrupted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerWasInterrupted:");
}

id objc_msgSend_playerWithPlayerItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerWithPlayerItem:");
}

id objc_msgSend_positionInCurrentAudiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "positionInCurrentAudiobook");
}

id objc_msgSend_positionInCurrentChapter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "positionInCurrentChapter");
}

id objc_msgSend_positionInCurrentTrack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "positionInCurrentTrack");
}

id objc_msgSend_positionTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "positionTime");
}

id objc_msgSend_precisionRates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "precisionRates");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithValue_forProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithValue:forProperty:");
}

id objc_msgSend_preferredIntervals(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredIntervals");
}

id objc_msgSend_prerollAtRate_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prerollAtRate:completionHandler:");
}

id objc_msgSend_previousChapterOrRestartChapter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousChapterOrRestartChapter");
}

id objc_msgSend_previousTrackCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousTrackCommand");
}

id objc_msgSend_processContentKeyRequestWithIdentifier_initializationData_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processContentKeyRequestWithIdentifier:initializationData:options:");
}

id objc_msgSend_processContentKeyResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processContentKeyResponse:");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "query");
}

id objc_msgSend_racGUIDForStoreID_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "racGUIDForStoreID:result:");
}

id objc_msgSend_rate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rate");
}

id objc_msgSend_readingProgressHighWaterMark(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readingProgressHighWaterMark");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAllTimeObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllTimeObservers");
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeContentKeyRecipient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeContentKeyRecipient:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removePredicatesForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePredicatesForProperty:");
}

id objc_msgSend_removeTimeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTimeObserver:");
}

id objc_msgSend_replaceCurrentItemWithPlayerItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceCurrentItemWithPlayerItem:");
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "representativeItem");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestImageWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestImageWithCompletionHandler:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resourceLoader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceLoader");
}

id objc_msgSend_respondWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondWithData:");
}

id objc_msgSend_saveBookmarkTime_audiobook_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveBookmarkTime:audiobook:completion:");
}

id objc_msgSend_saveBookmarkTime_audiobook_importance_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveBookmarkTime:audiobook:importance:completion:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scrubPausableDispatchAfterGeneration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrubPausableDispatchAfterGeneration");
}

id objc_msgSend_seekBackwardCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekBackwardCommand");
}

id objc_msgSend_seekDispatchSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekDispatchSource");
}

id objc_msgSend_seekForwardCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekForwardCommand");
}

id objc_msgSend_seekSampleTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekSampleTime");
}

id objc_msgSend_seekToTime_toleranceBefore_toleranceAfter_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:");
}

id objc_msgSend_setActionAtItemEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionAtItemEnd:");
}

id objc_msgSend_setActionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionSource:");
}

id objc_msgSend_setAlbumArtistName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlbumArtistName:");
}

id objc_msgSend_setAlbumName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlbumName:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAllowsExternalPlayback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsExternalPlayback:");
}

id objc_msgSend_setArtworkCompletionBlocks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArtworkCompletionBlocks:");
}

id objc_msgSend_setArtworkIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArtworkIdentifier:");
}

id objc_msgSend_setAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsset:");
}

id objc_msgSend_setAssetDetail_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetDetail:completion:");
}

id objc_msgSend_setAssetURL_audibleDRMGroupID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetURL:audibleDRMGroupID:completion:");
}

id objc_msgSend_setAudioTimePitchAlgorithm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioTimePitchAlgorithm:");
}

id objc_msgSend_setAudiobookDurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudiobookDurations:");
}

id objc_msgSend_setAudiobookPlayerActiveOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudiobookPlayerActiveOutput:");
}

id objc_msgSend_setAudiobookPositions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudiobookPositions:");
}

id objc_msgSend_setAutomaticallyWaitsToMinimizeStalling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticallyWaitsToMinimizeStalling:");
}

id objc_msgSend_setBackwardSkipTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackwardSkipTime:");
}

id objc_msgSend_setBaseEventInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaseEventInterval:");
}

id objc_msgSend_setBookmarkTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBookmarkTime:");
}

id objc_msgSend_setBufferInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBufferInfo:");
}

id objc_msgSend_setBufferedDurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBufferedDurations:");
}

id objc_msgSend_setBufferedStartTimes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBufferedStartTimes:");
}

id objc_msgSend_setCachedAssetID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachedAssetID:");
}

id objc_msgSend_setCanBeControlledByScrubbing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanBeControlledByScrubbing:");
}

id objc_msgSend_setCanUseNetworkResourcesForLiveStreamingWhilePaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanUseNetworkResourcesForLiveStreamingWhilePaused:");
}

id objc_msgSend_setCategory_mode_routeSharingPolicy_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:mode:routeSharingPolicy:options:error:");
}

id objc_msgSend_setChapter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChapter:");
}

id objc_msgSend_setChapterDurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChapterDurations:");
}

id objc_msgSend_setChapterPositions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChapterPositions:");
}

id objc_msgSend_setCoalescingDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoalescingDelay:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainer:");
}

id objc_msgSend_setContentItemForPreviews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentItemForPreviews:");
}

id objc_msgSend_setContentKeySession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentKeySession:");
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentType:");
}

id objc_msgSend_setCurrentChapterIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentChapterIndex:");
}

id objc_msgSend_setCurrentLoadedTimeRanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentLoadedTimeRanges:");
}

id objc_msgSend_setCurrentTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTime:");
}

id objc_msgSend_setCurrentTime_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTime:completion:");
}

id objc_msgSend_setCurrentTrackIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTrackIndex:");
}

id objc_msgSend_setDateAccessed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateAccessed:");
}

id objc_msgSend_setDatePlaybackTimeUpdated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDatePlaybackTimeUpdated:");
}

id objc_msgSend_setDefaultPlaybackRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultPlaybackRate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setDestinationScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinationScale:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setElapsedTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setElapsedTime:");
}

id objc_msgSend_setElapsedTime_playbackRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setElapsedTime:playbackRate:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExplicitContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExplicitContent:");
}

id objc_msgSend_setFittingSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFittingSize:");
}

id objc_msgSend_setFormattingContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormattingContext:");
}

id objc_msgSend_setForwardSkipTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForwardSkipTime:");
}

id objc_msgSend_setGenreName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGenreName:");
}

id objc_msgSend_setGroupingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGroupingType:");
}

id objc_msgSend_setGuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGuid:");
}

id objc_msgSend_setHasArtwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasArtwork:");
}

id objc_msgSend_setHasBeenPlayed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasBeenPlayed:");
}

id objc_msgSend_setIgnoreSystemFilterPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreSystemFilterPredicates:");
}

id objc_msgSend_setIsLoadingResources_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLoadingResources:");
}

id objc_msgSend_setIsStalling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsStalling:");
}

id objc_msgSend_setIsStopping_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsStopping:");
}

id objc_msgSend_setLastBitrate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastBitrate:");
}

id objc_msgSend_setLastOpenDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastOpenDate:");
}

id objc_msgSend_setLastPlayedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPlayedDate:");
}

id objc_msgSend_setLastPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPosition:");
}

id objc_msgSend_setLastSeekPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastSeekPosition:");
}

id objc_msgSend_setLastSentRemainingTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastSentRemainingTime:");
}

id objc_msgSend_setListeningSessionStartTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListeningSessionStartTime:");
}

id objc_msgSend_setMaximumUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumUnitCount:");
}

id objc_msgSend_setMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaType:");
}

id objc_msgSend_setNeedsToUpdateTimeObservers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsToUpdateTimeObservers:");
}

id objc_msgSend_setNowPlayingAudiobookArtworkForPreviews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNowPlayingAudiobookArtworkForPreviews:");
}

id objc_msgSend_setNowPlayingInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNowPlayingInfo:");
}

id objc_msgSend_setNumberOfChildren_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfChildren:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObservers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObservers:");
}

id objc_msgSend_setOutputContextID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputContextID:");
}

id objc_msgSend_setPausedTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPausedTime:");
}

id objc_msgSend_setPendingAssetAuth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingAssetAuth:");
}

id objc_msgSend_setPendingCurrentTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingCurrentTime:");
}

id objc_msgSend_setPeriodicTimeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeriodicTimeObserver:");
}

id objc_msgSend_setPlayCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayCount:");
}

id objc_msgSend_setPlayCountSinceSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayCountSinceSync:");
}

id objc_msgSend_setPlayFadeInTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayFadeInTime:");
}

id objc_msgSend_setPlaySkipSoundEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaySkipSoundEffect:");
}

id objc_msgSend_setPlayable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayable:");
}

id objc_msgSend_setPlaybackQueueDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaybackQueueDataSource:");
}

id objc_msgSend_setPlaybackRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaybackRate:");
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayer:");
}

id objc_msgSend_setPreferredForwardBufferDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredForwardBufferDuration:");
}

id objc_msgSend_setPreferredIntervals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredIntervals:");
}

id objc_msgSend_setPreferredRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredRate:");
}

id objc_msgSend_setPreloadsEligibleContentKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreloadsEligibleContentKeys:");
}

id objc_msgSend_setRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRate:");
}

id objc_msgSend_setRate_withVolumeRampDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRate:withVolumeRampDuration:");
}

id objc_msgSend_setReadingPositionLocationUpdateDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReadingPositionLocationUpdateDate:");
}

id objc_msgSend_setReadingProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReadingProgress:");
}

id objc_msgSend_setReadingProgressHighWaterMark_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReadingProgressHighWaterMark:");
}

id objc_msgSend_setScrubbing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrubbing:");
}

id objc_msgSend_setSecondsToRewindAfterInterruption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondsToRewindAfterInterruption:");
}

id objc_msgSend_setSeekDispatchSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeekDispatchSource:");
}

id objc_msgSend_setSeeking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeeking:");
}

id objc_msgSend_setSkipBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkipBehavior:");
}

id objc_msgSend_setSkipDispatchSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkipDispatchSource:");
}

id objc_msgSend_setSkipStartAudiobookTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkipStartAudiobookTime:");
}

id objc_msgSend_setSkipStepCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkipStepCount:");
}

id objc_msgSend_setSkipping_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkipping:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStores_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStores:");
}

id objc_msgSend_setSupplementalContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupplementalContents:");
}

id objc_msgSend_setSupportedPlaybackRates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedPlaybackRates:");
}

id objc_msgSend_setSupportsAlternateArtwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsAlternateArtwork:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTrackArtistName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackArtistName:");
}

id objc_msgSend_setTrackDurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackDurations:");
}

id objc_msgSend_setTrackPositions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackPositions:");
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnitsStyle:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forProperty_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forProperty:withCompletionBlock:");
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolume:");
}

id objc_msgSend_setWaitingForPlayerStatePlaying_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitingForPlayerStatePlaying:");
}

id objc_msgSend_setWaitingForPlayerStatePlayingThenPause_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitingForPlayerStatePlayingThenPause:");
}

id objc_msgSend_setWasInterrupted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasInterrupted:");
}

id objc_msgSend_setWasInterruptedEarly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasInterruptedEarly:");
}

id objc_msgSend_setWasPlaying_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasPlaying:");
}

id objc_msgSend_sharedCommandCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCommandCenter");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shortName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortName");
}

id objc_msgSend_signalWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signalWithCompletion:");
}

id objc_msgSend_singleSkip_interval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleSkip:interval:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_skipBackwardCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipBackwardCommand");
}

id objc_msgSend_skipBehavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipBehavior");
}

id objc_msgSend_skipController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipController");
}

id objc_msgSend_skipController_updatedCumulativeDelta_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipController:updatedCumulativeDelta:");
}

id objc_msgSend_skipController_willBeginSeekingInDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipController:willBeginSeekingInDirection:");
}

id objc_msgSend_skipController_willBeginSkippingInDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipController:willBeginSkippingInDirection:");
}

id objc_msgSend_skipControllerDidEndSeeking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipControllerDidEndSeeking:");
}

id objc_msgSend_skipControllerDidEndSkipping_actionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipControllerDidEndSkipping:actionSource:");
}

id objc_msgSend_skipControllerSettingsDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipControllerSettingsDidChange:");
}

id objc_msgSend_skipControllerWillPausePlayback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipControllerWillPausePlayback:");
}

id objc_msgSend_skipDispatchSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipDispatchSource");
}

id objc_msgSend_skipForwardCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipForwardCommand");
}

id objc_msgSend_skipStartAudiobookTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipStartAudiobookTime");
}

id objc_msgSend_sleepTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepTimer");
}

id objc_msgSend_sleepTimer_remainingTimeDidUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepTimer:remainingTimeDidUpdate:");
}

id objc_msgSend_sleepTimerCanceled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepTimerCanceled:");
}

id objc_msgSend_sleepTimerDidExpire_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepTimerDidExpire:");
}

id objc_msgSend_sleepTimerDurationFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepTimerDurationFrom:");
}

id objc_msgSend_sleepTimerEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepTimerEnabled:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_specialSeekBackwardCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specialSeekBackwardCommand");
}

id objc_msgSend_specialSeekForwardCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specialSeekForwardCommand");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAdaptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAdaptor");
}

id objc_msgSend_startSeek_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSeek:");
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTime");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCommand");
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeID");
}

id objc_msgSend_stores(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stores");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supplementalAssetIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplementalAssetIdentifiers");
}

id objc_msgSend_timeBeforeCurrentTrack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeBeforeCurrentTrack");
}

id objc_msgSend_timeControlStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeControlStatus");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeObservers");
}

id objc_msgSend_timeRangeInAudiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeRangeInAudiobook");
}

id objc_msgSend_timeRangeInTrack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeRangeInTrack");
}

id objc_msgSend_timeRemainingInBufferFromTrackPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeRemainingInBufferFromTrackPosition:");
}

id objc_msgSend_timeRemainingInCurrentAudiobook(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeRemainingInCurrentAudiobook");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_togglePlayPause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "togglePlayPause");
}

id objc_msgSend_togglePlayPauseCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "togglePlayPauseCommand");
}

id objc_msgSend_trackPositions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackPositions");
}

id objc_msgSend_tracks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tracks");
}

id objc_msgSend_tracksWithMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tracksWithMediaType:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateTimeObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTimeObservers");
}

id objc_msgSend_updateWithChapter_bufferedTrackPositions_bufferedTrackDurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithChapter:bufferedTrackPositions:bufferedTrackDurations:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valueWithCMTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCMTime:");
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volume");
}

id objc_msgSend_waitingForPlayerStatePlaying(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingForPlayerStatePlaying");
}

id objc_msgSend_waitingForPlayerStatePlayingThenPause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingForPlayerStatePlayingThenPause");
}

id objc_msgSend_wasInterrupted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasInterrupted");
}

id objc_msgSend_wasInterruptedEarly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasInterruptedEarly");
}

id objc_msgSend_wasPlaying(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasPlaying");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}
