id sub_100004278(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "thermalPressureDidChangeWithThermalLevel:", objc_msgSend(*(id *)(a1 + 32), "getStateWithToken:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8)));
}

void sub_100004C20(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004BEDC(v2);
    NSLog(CFSTR("error = %@"), v2);
  }

}

void sub_100004D40(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path"));
  if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v2))
  {
    v3 = *(void **)(a1 + 40);
    v7 = 0;
    v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v7);
    v5 = v7;
    if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004BF4C(v5);
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

void sub_100004EDC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "path"));
  LODWORD(v2) = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v16 = 0;
  objc_msgSend(v6, "moveItemAtURL:toURL:error:", v4, v5, &v16);
  v7 = v16;
  if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004BFBC((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v7);

}

void sub_100005034(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  _DWORD v26[3];
  _BYTE v27[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_srTempPath"));
  v24 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, &v24));
  v5 = v24;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] %@"), *(_QWORD *)(a1 + 40)));
  v17 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v6));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        v12 = v5;
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10004C028(buf, (int)v5, v26);
        v14 = *(void **)(a1 + 32);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_srTempPath"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v15, v13));
        v19 = v12;
        objc_msgSend(v14, "removeItemAtPath:error:", v16, &v19);
        v5 = v19;

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v9);
  }

}

void sub_10000540C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000068A0(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[88])
  {
    if (dword_100095B40 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136446466;
        v18 = "-[RPMicAudioCaptureManager startMicrophoneCaptureWithOutput:didStartHandler:]_block_invoke";
        v19 = 1024;
        v20 = 146;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v17, 0x12u);
      }
      v2 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v2, "startCaptureSession");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setUsesApplicationAudioSession:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setAutomaticallyConfiguresApplicationAudioSession:", 0);
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      v4 = objc_retainBlock(v3);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v4;

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice defaultDeviceWithMediaType:](AVCaptureDevice, "defaultDeviceWithMediaType:", AVMediaTypeAudio));
    v8 = objc_claimAutoreleasedReturnValue(+[AVCaptureDeviceInput deviceInputWithDevice:error:](AVCaptureDeviceInput, "deviceInputWithDevice:error:", v7, 0));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = v8;

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "canAddInput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addInput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v11 = objc_alloc_init((Class)AVCaptureAudioDataOutput);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 80);
    *(_QWORD *)(v12 + 80) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setSampleBufferDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "canAddOutput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addOutput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
    v14 = objc_retainBlock(*(id *)(a1 + 48));
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 136);
    *(_QWORD *)(v15 + 136) = v14;

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isRunning") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "dispatchedDidStartHandler");
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("running"), 0, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "startRunning");
    }

  }
}

void sub_100006B58(void *a1)
{
  sub_10004C1C0(a1);
  JUMPOUT(0x100006B3CLL);
}

_QWORD *sub_100006BB8(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v1 = result[4];
  if (*(_BYTE *)(v1 + 88))
  {
    v2 = result;
    if (dword_100095B40 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136446466;
        v6 = "-[RPMicAudioCaptureManager stopMicrophoneCapture]_block_invoke";
        v7 = 1024;
        v8 = 208;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
      }
      v1 = v2[4];
    }
    *(_BYTE *)(v1 + 88) = 0;
    v3 = v2[4];
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = 0;

    objc_msgSend(*(id *)(v2[4] + 64), "removeInput:", *(_QWORD *)(v2[4] + 72));
    return objc_msgSend(*(id *)(v2[4] + 64), "removeOutput:", *(_QWORD *)(v2[4] + 80));
  }
  return result;
}

void sub_100006D20(void *a1)
{
  sub_10004C27C(a1);
  JUMPOUT(0x100006D00);
}

void sub_10000716C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = 0;

  }
}

void sub_100007220(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

BOOL sub_100007250(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

id sub_100007258(void *exc_buf)
{
  return objc_begin_catch(exc_buf);
}

void sub_1000075A4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "-[RPMovieWriter startWritingHandler:]_block_invoke";
    v9 = 1024;
    v10 = 150;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outputURL"));
  objc_msgSend(v2, "_srRemoveFile:completion:", v3, &stru_100080E40);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007758;
  v5[3] = &unk_100080E68;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setUpAssetWriterWithHandler:", v5);

}

void sub_100007700(id a1, NSError *a2)
{
  NSError *v2;

  v2 = a2;
  if (v2 && dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004C338();

}

uint64_t sub_100007758(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100007838(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_100007850(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  id result;
  _OWORD v6[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 72);
  v6[0] = *(_OWORD *)(a1 + 56);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 88);
  result = objc_msgSend(v2, "dispatchedAppendVideoSampleBuffer:withWindowTransform:", v3, v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10000791C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedAppendAudio1SampleBuffer:", *(_QWORD *)(a1 + 40));
}

id sub_1000079A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedAppendAudio2SampleBuffer:", *(_QWORD *)(a1 + 40));
}

void sub_100007AE8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CMTimeEpoch epoch;
  void *v14;
  void *v15;
  id v16;
  id v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  CMTimeEpoch v24;
  _QWORD v25[3];
  CMTime time1;
  CMTime buf;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinishingWriting") & 1) != 0)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136446466;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 254;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer finished nothing to do", (uint8_t *)&buf, 0x12u);
    }
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0);
    return;
  }
  CMBufferQueueReset(*(CMBufferQueueRef *)(*(_QWORD *)(a1 + 32) + 120));
  CMBufferQueueReset(*(CMBufferQueueRef *)(*(_QWORD *)(a1 + 32) + 104));
  CMBufferQueueReset(*(CMBufferQueueRef *)(*(_QWORD *)(a1 + 32) + 112));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetWriter"));

  if (v3)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "didProcessFirstSample") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetWriter"));
      v5 = objc_msgSend(v4, "status");

      if (v5 == (id)1)
      {
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136446466;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
          LOWORD(buf.flags) = 1024;
          *(CMTimeFlags *)((char *)&buf.flags + 2) = 215;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer in correct state, attempting to finish writing", (uint8_t *)&buf, 0x12u);
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetWriter"));
        v7 = *(void **)(a1 + 32);
        if (v7)
          objc_msgSend(v7, "trimVideoPresentationTime");
        else
          memset(&time1, 0, sizeof(time1));
        v18 = *(_OWORD *)&kCMTimeInvalid.value;
        *(_OWORD *)&buf.value = *(_OWORD *)&kCMTimeInvalid.value;
        epoch = kCMTimeInvalid.epoch;
        buf.epoch = epoch;
        if (CMTimeCompare(&time1, &buf))
        {
          v14 = *(void **)(a1 + 32);
          if (v14)
            objc_msgSend(v14, "trimVideoPresentationTime");
          else
            memset(v25, 0, sizeof(v25));
          objc_msgSend(v6, "endSessionAtSourceTime:", v25, v18);
          v15 = *(void **)(a1 + 32);
          v23 = v18;
          v24 = epoch;
          objc_msgSend(v15, "setTrimVideoPresentationTime:", &v23);
        }
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100007F40;
        v19[3] = &unk_100080F08;
        v20 = v6;
        v16 = *(id *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 32);
        v22 = v16;
        v17 = v6;
        objc_msgSend(v17, "finishWritingWithCompletionHandler:", v19);

      }
      else
      {
        if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10004C3B4();
        v11 = *(_QWORD *)(a1 + 40);
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5825, 0));
          (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

        }
        objc_msgSend(*(id *)(a1 + 32), "setDidProcessFirstSample:", 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "setIsFinishingWriting:", 1, v18);
      return;
    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004C430();
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v9 = -5822;
      goto LABEL_25;
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136446466;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 198;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d no asset writer object", (uint8_t *)&buf, 0x12u);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v9 = -5824;
LABEL_25:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", v9, 0));
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v10);

    }
  }
}

void sub_100007F40(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _BYTE v6[18];
  __int16 v7;
  _BOOL4 v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "status");
    *(_DWORD *)v6 = 136446722;
    *(_QWORD *)&v6[4] = "-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 227;
    v7 = 1024;
    v8 = v2 == (id)3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer state: %i", v6, 0x18u);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "status", *(_OWORD *)v6) == (id)3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5823, 0));
  else
    v3 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == (id)3)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outputURL"));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v3);
  objc_msgSend(*(id *)(a1 + 40), "setDidProcessFirstSample:", 0);

}

void sub_100008204(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(void);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004C4AC();
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_13:
      v8();
    }
  }
  else
  {
    if (!v5)
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v15 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]_block_invoke";
        v16 = 1024;
        v17 = 289;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer finished nothing to do", buf, 0x12u);
      }
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_13;
    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000083BC;
    v12[3] = &unk_100080E68;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v9, "saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:", v5, v10, v11, v12);

  }
}

void sub_1000083BC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004C528();
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446466;
      v8 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]_block_invoke";
      v9 = 1024;
      v10 = 281;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
    }
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }

}

void sub_1000085D4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000869C;
  v4[3] = &unk_100080F58;
  v7 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v2, "_srRemoveFile:completion:", v3, v4);

}

void sub_10000869C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  CMTimeRange v11;
  CMTime duration;
  CMTimeRange v13;
  CMTime start;
  CMTime v15;
  CMTime rhs;
  CMTime lhs;
  CMTime v18;
  CMTime v19;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5827, 0));
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v7);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](AVAsset, "assetWithURL:", *(_QWORD *)(a1 + 32)));
    v5 = objc_msgSend(objc_alloc((Class)AVAssetExportSession), "initWithAsset:presetName:", v4, AVAssetExportPresetPassthrough);
    objc_msgSend(v5, "setOutputURL:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "setOutputFileType:", AVFileTypeMPEG4);
    memset(&v19, 0, sizeof(v19));
    CMTimeMakeWithSeconds(&v19, *(Float64 *)(a1 + 56), 1);
    memset(&v18, 0, sizeof(v18));
    if (v4)
      objc_msgSend(v4, "duration");
    else
      memset(&lhs, 0, sizeof(lhs));
    CMTimeMakeWithSeconds(&rhs, *(Float64 *)(a1 + 64), 1);
    CMTimeSubtract(&v18, &lhs, &rhs);
    memset(&v15, 0, sizeof(v15));
    v13.start = v18;
    start = v19;
    CMTimeSubtract(&v15, &v13.start, &start);
    memset(&v13, 0, sizeof(v13));
    start = v19;
    duration = v15;
    CMTimeRangeMake(&v13, &start, &duration);
    v11 = v13;
    objc_msgSend(v5, "setTimeRange:", &v11);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000088D0;
    v8[3] = &unk_100080E90;
    v9 = v5;
    v10 = *(id *)(a1 + 48);
    v6 = v5;
    objc_msgSend(v6, "exportAsynchronouslyWithCompletionHandler:", v8);

  }
}

void sub_1000088D0(uint64_t a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v3 == (id)5)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446466;
      v9 = "-[RPMovieWriter trimMovieWithURL:startClipDuration:endClipDuration:outputFileURL:handler:]_block_invoke";
      v10 = 1024;
      v11 = 327;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Export Trim Video Cancelled", (uint8_t *)&v8, 0x12u);
    }
    v4 = *(_QWORD *)(a1 + 40);
    v5 = -5828;
    goto LABEL_11;
  }
  if (v3 == (id)4)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004C5A4(v2);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = -5826;
LABEL_11:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", v5, 0));
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v6);
    goto LABEL_16;
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPMovieWriter trimMovieWithURL:startClipDuration:endClipDuration:outputFileURL:handler:]_block_invoke";
    v10 = 1024;
    v11 = 332;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Export Trim succeeded", (uint8_t *)&v8, 0x12u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outputURL"));
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v6, 0);
LABEL_16:

}

void sub_100009E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_100009E3C(id a1, NSError *a2)
{
  NSError *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v2 = a2;
  if (v2)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004C738(v2);
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPMovieWriter dispatchedAppendVideoSampleBuffer:withWindowTransform:]_block_invoke";
    v5 = 1024;
    v6 = 552;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Asset writer output file removed", (uint8_t *)&v3, 0x12u);
  }

}

void sub_100009F38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004C7B4(v3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_OWORD *)(a1 + 72);
    v7[0] = *(_OWORD *)(a1 + 56);
    v7[1] = v6;
    v7[2] = *(_OWORD *)(a1 + 88);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "appendInitialSampleBuffer:withTransform:", v5, v7);
  }

}

void sub_10000ADB8(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 136446722;
    v9 = "-[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:]_block_invoke";
    v10 = 1024;
    v11 = 716;
    v12 = 1024;
    v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Start Save to Photos, mixAudioTracks=%d", buf, 0x18u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  v3 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000AF18;
  v6[3] = &unk_100081018;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  +[RPPhotosUtility exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:](RPPhotosUtility, "exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:", v4, v3, v6);
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void sub_10000AF18(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;

  v7 = a2;
  v8 = a3;
  if (v7)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004CBA0();
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](RPFeatureFlagUtility, "sharedInstance"));
    v10 = objc_msgSend(v9, "systemBannerEnabled");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelProxy sharedInstance](RPAngelProxy, "sharedInstance"));
      objc_msgSend(v11, "hideAndStopRecordingBanner");

    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "-[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:]_block_invoke";
      v25 = 1024;
      v26 = 730;
      v27 = 2048;
      v28 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds", buf, 0x1Cu);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](RPFeatureFlagUtility, "sharedInstance"));
    v13 = objc_msgSend(v12, "systemBannerEnabled");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelProxy sharedInstance](RPAngelProxy, "sharedInstance"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createAssetURLFromPhotosIdentifier:", v8));
      v17 = _NSConcreteStackBlock;
      v18 = 3221225472;
      v19 = sub_10000B160;
      v20 = &unk_100080FF0;
      v16 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 32);
      v22 = v8;
      objc_msgSend(v14, "showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:", v15, v22, v16, &v17);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "displayScreenRecorderNotificationWithURL:", v8);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setDurationInSeconds:", a4, v17, v18, v19, v20, v21);

}

void sub_10000B160(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136446466;
      v5 = "-[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:]_block_invoke";
      v6 = 1024;
      v7 = 740;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Could not show Saved to Photos Banner, show screen notification", (uint8_t *)&v4, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "displayScreenRecorderNotificationWithURL:", *(_QWORD *)(a1 + 40));
  }

}

void sub_10000B9C4(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v2, 1));
  +[PHAssetChangeRequest deleteAssets:](PHAssetChangeRequest, "deleteAssets:", v1);

}

void sub_10000BD58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void sub_10000BD70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

id sub_10000BDAC@<X0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 8) = x8_0;
  return objc_msgSend(a1, "code");
}

void sub_10000C650(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004CD90(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
      v17 = 1024;
      v18 = 78;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d beginExtensionRequestWithInputItems returned", buf, 0x12u);
    }
    v7 = dispatch_semaphore_create(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "_extensionContextForUUID:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_auxiliaryConnection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteObjectProxy"));

    if (v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000C87C;
      v13[3] = &unk_100080E00;
      v12 = v7;
      v14 = v12;
      objc_msgSend(v10, "setEndpoint:completionHandler:", v11, v13);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004CD14();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

intptr_t sub_10000C87C(uint64_t a1)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
    v5 = 1024;
    v6 = 87;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Remote endpoint set.", (uint8_t *)&v3, 0x12u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000CBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CC08(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;

  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004CE18();
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "errorHandler"));

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "errorHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5808, &__NSDictionary0__struct));
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);

  }
}

void sub_10000CCD8(id a1)
{
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004CE94();
}

void sub_10000D25C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D27C(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;

  v3 = a2;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004CF10(v3);
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "errorHandler"));

  if (v6)
  {
    v7 = objc_loadWeakRetained(v4);
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "errorHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5808, &__NSDictionary0__struct));
    ((void (**)(_QWORD, void *))v8)[2](v8, v9);

  }
}

id sub_10000E830(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "showStatusBarWithPid:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t sub_10000F924(uint64_t result, int a2, CFDictionaryRef theDict)
{
  void *v3;
  void *v4;
  uint64_t v5;
  CFTypeID v6;
  uint64_t v7;
  void *value[5];

  if (a2 == 1)
  {
    value[3] = v3;
    value[4] = v4;
    v5 = result;
    v7 = 0;
    value[0] = 0;
    result = CFDictionaryGetValueIfPresent(theDict, kAKSInfoExtendedLockState, (const void **)value);
    if ((_DWORD)result)
    {
      v6 = CFGetTypeID(value[0]);
      result = CFNumberGetTypeID();
      if (v6 == result)
      {
        result = CFNumberGetValue((CFNumberRef)value[0], kCFNumberLongLongType, &v7);
        if ((_DWORD)result)
        {
          if ((_DWORD)v7 == 2)
            return (uint64_t)objc_msgSend(*(id *)(v5 + 32), "handleDeviceLockedWarning");
        }
      }
    }
  }
  return result;
}

intptr_t sub_10000FA94(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleUpdateDisplayLayout:");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_100012E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "purgeable:urgency:", a3, a2));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    v7 = 1024;
    v8 = 211;
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d purgeable=%@", (uint8_t *)&v5, 0x1Cu);
  }
  return v3;
}

uint64_t sub_100012F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "purge:urgency:", a3, a2));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    v7 = 1024;
    v8 = 216;
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d purge=%@", (uint8_t *)&v5, 0x1Cu);
  }
  return v3;
}

void sub_100013040(id a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    v3 = 1024;
    v4 = 220;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d cancelling my purge!", (uint8_t *)&v1, 0x12u);
  }
}

uint64_t sub_1000130FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "periodic:urgency:", a3, a2));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    v7 = 1024;
    v8 = 224;
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d periodic=%@", (uint8_t *)&v5, 0x1Cu);
  }
  return v3;
}

void sub_100013988(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (a2)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136446466;
      v5 = "-[RPRecordingManager applicationDisconnectedWithBundleID:withProcessIdentifier:]_block_invoke";
      v6 = 1024;
      v7 = 343;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client disconnected, successfully stopped active session", (uint8_t *)&v4, 0x12u);
    }
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004D4DC();
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  objc_msgSend(v3, "removeClient:", *(_QWORD *)(a1 + 32));

}

void sub_100013B88(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getCallingConnectionClient"));
    v4 = *(unsigned __int8 *)(a1 + 72);
    v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100013C94;
    v9[3] = &unk_100081318;
    v6 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v6, v4, v5, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v7 + 16))(v7, v8, 0, 0);

    }
  }
}

uint64_t sub_100013C94(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100013D38(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100013EA8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100013F88;
    v8[3] = &unk_100081390;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    +[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:](RPAudioMixUtility, "mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:", v9, v7, AVFileTypeMPEG4, v8);

  }
}

void sub_100013F88(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004D558();
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136446722;
    v6 = "-[RPRecordingManager stopInAppRecordingWithUrl:handler:]_block_invoke";
    v7 = 1024;
    v8 = 522;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Success Mixed Audio to %@", (uint8_t *)&v5, 0x1Cu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_10001417C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000142C8(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getCallingConnectionClient"));
    v4 = *(unsigned __int8 *)(a1 + 72);
    v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000143D4;
    v9[3] = &unk_100081318;
    v6 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v6, v4, v5, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v7 + 16))(v7, v8, 0, 0);

    }
  }
}

uint64_t sub_1000143D4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100014478(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100014564(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000149B4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3 && dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004D650();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100014A28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3 && dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004D6CC();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100014E4C(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getCallingConnectionClient"));
    v4 = *(unsigned __int8 *)(a1 + 80);
    v5 = *(unsigned __int8 *)(a1 + 81);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014F60;
    v10[3] = &unk_100081318;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v3, "startInAppBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v6, v4, v5, v7, v10, *(double *)(a1 + 64), *(double *)(a1 + 72));

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v8 + 16))(v8, v9, 0, 0);

    }
  }
}

void sub_100014F60(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v7 = a2;
  if (v7)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004D748();
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPRecordingManager startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpo"
          "int:withHandler:]_block_invoke";
    v11 = 1024;
    v12 = 713;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d start broadcast successfull", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_10001511C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004D7C4();
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPRecordingManager stopInAppBroadcastWithHandler:]_block_invoke";
    v7 = 1024;
    v8 = 739;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop broadcast successfull", (uint8_t *)&v5, 0x12u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

uint64_t sub_100015308(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000154F8(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPRecordingManager startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]_block_invoke";
    v13 = 1024;
    v14 = 782;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (a2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getCallingConnectionClient"));
    v5 = *(unsigned __int8 *)(a1 + 72);
    v6 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015688;
    v9[3] = &unk_100080E68;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v4, "startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v7, v5, v6, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (!v8)
      return;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
  }

}

uint64_t sub_100015688(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10001572C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000157D0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100015874(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100015C38(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getCallingConnectionClient"));
    v4 = *(unsigned __int8 *)(a1 + 80);
    v5 = *(unsigned __int8 *)(a1 + 81);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100015D44;
    v10[3] = &unk_100080E68;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v3, "startSystemBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v6, v4, v5, v7, v10, *(double *)(a1 + 64), *(double *)(a1 + 72));

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);

    }
  }
}

uint64_t sub_100015D44(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100015DE8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100015E8C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100016030(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getCallingConnectionClient"));
    v4 = *(unsigned __int8 *)(a1 + 72);
    v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001613C;
    v9[3] = &unk_100081318;
    v6 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v6, v4, v5, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v7 + 16))(v7, v8, 0, 0);

    }
  }
}

uint64_t sub_10001613C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100016284(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000163F8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000164B8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100016830(id a1, BOOL a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  if (a2)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v2 = 136446466;
      v3 = "-[RPRecordingManager stopAllActiveClients]_block_invoke";
      v4 = 1024;
      v5 = 1037;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop all clients success", (uint8_t *)&v2, 0x12u);
    }
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004D8BC();
  }
}

void sub_100016F30(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;

  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager sharedInstance](RPConnectionManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentConnection"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager uniqueClientIdentifierWithPID:](RPConnectionManager, "uniqueClientIdentifierWithPID:", objc_msgSend(v10, "processIdentifier")));
  if (v7)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004D9B4();
    v12 = &__NSDictionary0__struct;
    v13 = -5831;
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136446722;
      v16 = "-[RPRecordingManager processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:]_block_invoke";
      v17 = 1024;
      v18 = 1084;
      v19 = 2048;
      v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds", (uint8_t *)&v15, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "displayScreenRecorderNotificationWithURL:ignoreDoNotDisturb:isClip:", v8, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
    v13 = 0;
    v12 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", v13, v12));
  +[RPReportingAgent reportSessionEnded:endReason:withServiceName:clientBundleId:](RPReportingAgent, "reportSessionEnded:endReason:withServiceName:clientBundleId:", 2, v14, CFSTR("InAppRecording"), v11);

}

void sub_100017984(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v2, 1));
  +[PHAssetChangeRequest deleteAssets:](PHAssetChangeRequest, "deleteAssets:", v1);

}

void sub_100017A90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)v7;
  if (!v6)
  {
    v27 = (void *)v7;
    v25 = a1;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (!v9)
      goto LABEL_20;
    v10 = v9;
    v11 = *(_QWORD *)v30;
    v12 = _kCFBundleDisplayNameKey;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_plugIn"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "containingUrl"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPImageUtility getImageDataFromExtensionContainingAppBundleUrl:](RPImageUtility, "getImageDataFromExtensionContainingAppBundleUrl:", v16));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "infoDictionary"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v12));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        if (v20)
          v21 = v19 == 0;
        else
          v21 = 1;
        if (v21)
        {

        }
        else
        {

          if (v17)
          {
            v22 = objc_alloc_init((Class)NSMutableDictionary);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
            objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("extBundleID"));

            objc_msgSend(v22, "setObject:forKey:", v19, CFSTR("displayName"));
            objc_msgSend(v22, "setObject:forKey:", v17, CFSTR("extAppImgData"));
            objc_msgSend(v27, "addObject:", v22);

            goto LABEL_18;
          }
        }
        if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v34 = "-[RPRecordingManager getSystemBroadcastExtensionInfo:]_block_invoke";
          v35 = 1024;
          v36 = 1276;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error getting broadcast extension info", buf, 0x12u);
        }
LABEL_18:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (!v10)
      {
LABEL_20:

        v6 = 0;
        v5 = v26;
        a1 = v25;
        v8 = v27;
        break;
      }
    }
  }
  v24 = *(_QWORD *)(a1 + 32);
  if (v24)
    (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v8, v6);

}

void sub_100018150(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CCSControlCenterService sharedInstance](CCSControlCenterService, "sharedInstance"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[CCSModulePresentationOptions defaultOptions](CCSModulePresentationOptions, "defaultOptions"));
  objc_msgSend(v2, "presentModuleWithIdentifier:options:completionHandler:", CFSTR("com.apple.replaykit.controlcenter.screencapture"), v1, &stru_100081518);

}

void sub_1000181BC(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v4 = a3;
  if (a2)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446466;
      v6 = "-[RPRecordingManager openControlCenterSystemRecordingView]_block_invoke";
      v7 = 1024;
      v8 = 1325;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Control center screen capture module presented", (uint8_t *)&v5, 0x12u);
    }
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004DB28(v4);
  }

}

void sub_1000184F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018508(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100018518(uint64_t a1)
{

}

void sub_100018520(uint64_t a1, char a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = (void *)v3[5];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rpLocalizedStatusStringForPaused:", 0));
    objc_msgSend(v4, "setStatusString:", v5);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: failed to acquire assertion", v6, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidateStatusBar");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_1000185DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidateStatusBar");
}

void sub_1000186B0(id a1, NSError *a2)
{
  int v3;
  NSInteger v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = -[NSError code](a2, "code");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: registered. If there was an error it was: %li", (uint8_t *)&v3, 0xCu);
  }
}

void sub_1000187B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "invalidate");
  v5 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "updateDelegateRecordingTimer:", 0, 1, 0.5));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v5;

}

void sub_1000188E4(id a1, NSError *a2)
{
  NSError *v2;

  v2 = a2;
  if (v2 && dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004DC00((uint64_t)v2);

}

void sub_100019D3C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = a2;
  v30 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      v9 = 0;
      v31 = v7;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "extensionPointIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_extensionBundle"));
        NSLog(CFSTR("NSExtensionPointIdentifier %@ _extensionBundle %@"), v11, v12);

        if (!*(_QWORD *)(a1 + 32)
          || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier")),
              v14 = objc_msgSend(v13, "hasPrefix:", *(_QWORD *)(a1 + 32)),
              v13,
              v14))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributes"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationRule")));
          v17 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            v18 = v8;
            v19 = v16;
            v20 = v19;
            if (*(_QWORD *)(a1 + 40))
            {
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:"));
              if (!v21)
                goto LABEL_15;
              v22 = (void *)v21;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
              v24 = objc_msgSend(v23, "BOOLValue");

              if (!v24)
                goto LABEL_15;
            }
            if (*(_QWORD *)(a1 + 48))
            {
              v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:"));
              if (v25)
              {
                v26 = (void *)v25;
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
                v28 = objc_msgSend(v27, "BOOLValue");

                if ((v28 & 1) != 0)
                {
LABEL_15:

                  v8 = v18;
                  v7 = v31;
LABEL_20:

                  goto LABEL_21;
                }
              }
            }

            v8 = v18;
            v7 = v31;
          }
          else if (*(_QWORD *)(a1 + 40))
          {
            goto LABEL_20;
          }
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
          goto LABEL_20;
        }
LABEL_21:
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }
  v29 = *(_QWORD *)(a1 + 64);
  if (v29)
    (*(void (**)(uint64_t, _QWORD, id))(v29 + 16))(v29, *(_QWORD *)(a1 + 56), v30);

}

BOOL sub_10001A104(int a1)
{
  return a1 == 8;
}

BOOL sub_10001A110(int a1)
{
  return a1 != 8;
}

void sub_10001A598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001A5BC(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "applicationStateDidChange:", v3);

}

void sub_10001B2CC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 392))
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004DF38();
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5836, 0));
    objc_msgSend(*(id *)(a1 + 32), "reportSummaryEvent:recordedFileSize:", objc_msgSend(v3, "code"), 0);
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

  }
  else
  {
    *(_BYTE *)(v2 + 392) = 1;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(v5 + 376);
    v8 = *(double *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001B41C;
    v9[3] = &unk_100081628;
    v9[4] = v5;
    v10 = v6;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "exportClipToURL:duration:completionHandler:", v10, v9, v8);

  }
}

void sub_10001B41C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 392) = 0;
  v5 = v3;
  objc_msgSend(*(id *)(a1 + 32), "reportSummaryEvent:recordedFileSize:", objc_msgSend(v3, "code"), +[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", *(_QWORD *)(a1 + 40)));
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

void sub_10001B528(uint64_t a1)
{
  unsigned int v2;
  opaqueCMSampleBuffer *v3;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v5;
  _QWORD *v6;
  size_t Width;
  OpaqueVTCompressionSession *v8;
  BOOL v9;
  CMTime v10;
  CMTime presentationTimeStamp;
  CMTime v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionState");
  v3 = *(opaqueCMSampleBuffer **)(a1 + 40);
  if (v2 == 1)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v3);
    v5 = ImageBuffer;
    v6 = *(_QWORD **)(a1 + 32);
    if (v6[48]
      || (Width = CVPixelBufferGetWidth(ImageBuffer),
          objc_msgSend(v6, "createEncodingSessionWithWidth:withHeight:", Width, CVPixelBufferGetHeight(v5)),
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384)))
    {
      memset(&v12, 0, sizeof(v12));
      CMSampleBufferGetPresentationTimeStamp(&v12, *(CMSampleBufferRef *)(a1 + 40));
      v8 = *(OpaqueVTCompressionSession **)(*(_QWORD *)(a1 + 32) + 384);
      presentationTimeStamp = v12;
      v10 = kCMTimeInvalid;
      if (VTCompressionSessionEncodeFrame(v8, v5, &presentationTimeStamp, &v10, 0, 0, 0))
        v9 = dword_100095B40 > 2;
      else
        v9 = 1;
      if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004DFB4();
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  else
  {
    CFRelease(v3);
  }
}

void sub_10001B850(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;

  v7 = a1;
  v8 = v7;
  if (a3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004E128();
  }
  else if (v7)
  {
    objc_msgSend(v7, "appendVideoSampleBuffer:", a5);
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004E0AC();
  }

}

void sub_10001BA90(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  RPClipWriter *v6;
  RPClipWriter *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClipSession: startCapture has failed. Error: %@", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v5 = *(void (**)(void))(v4 + 16);
LABEL_10:
      v5();
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384) = 0;
    v6 = [RPClipWriter alloc];
    objc_msgSend(*(id *)(a1 + 32), "windowSize");
    v7 = -[RPClipWriter initWithWindowSize:](v6, "initWithWindowSize:");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 376);
    *(_QWORD *)(v8 + 376) = v7;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClipSession: startCapture has started successfully", (uint8_t *)&v11, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v5 = *(void (**)(void))(v10 + 16);
      goto LABEL_10;
    }
  }

}

void sub_10001BD9C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E29C(a1, (uint64_t)v3);
  objc_msgSend(*(id *)(a1 + 40), "notifyClientSessionDidStopWithError:movieURL:showAlert:", objc_msgSend(*(id *)(a1 + 32), "code"), 0, 1);

}

void sub_10001BE60(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.replaykit.ClipSessionDispatchQueue", 0);
  v2 = (void *)qword_100095BA8;
  qword_100095BA8 = (uint64_t)v1;

}

void sub_10001C090(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPClipSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    v8 = 1024;
    v9 = 350;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3)
    v4 = 3;
  else
    v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void sub_10001C4B0(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5807, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPClipSession handleDisplayWarning]_block_invoke";
    v3 = 1024;
    v4 = 385;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10001C78C(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5802, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPClipSession handleDeviceRestrictionWarning]_block_invoke";
    v3 = 1024;
    v4 = 414;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10001C990(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5804, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPClipSession handleResumeContextIDFailure]_block_invoke";
    v3 = 1024;
    v4 = 426;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

double sub_10001CADC()
{
  double v0;
  unint64_t v2;
  unint64_t v3;
  mach_timebase_info info;

  if ((byte_100095BB8 & 1) == 0)
  {
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v3) = info.denom;
    LODWORD(v2) = info.numer;
    *(double *)&qword_100095BC0 = (double)v2 / (double)v3 / 1000000000.0;
    __dmb(0xBu);
    byte_100095BB8 = 1;
  }
  v0 = *(double *)&qword_100095BC0;
  return v0 * (double)(uint64_t)mach_absolute_time();
}

unint64_t sub_10001CB60(unint64_t result, unint64_t a2)
{
  if (a2)
    return (unint64_t)(round((double)result / (double)a2) * (double)a2);
  return result;
}

unint64_t sub_10001CB80(unint64_t result, unint64_t a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  if (result)
  {
    v2 = (double)a2;
    v3 = (double)result;
    v4 = log10((double)result);
    v5 = __exp10(v2 - ceil(v4));
    return (unint64_t)(round(v5 * v3) / v5);
  }
  return result;
}

Float64 sub_10001CBC8(CMTime *a1)
{
  CMTime v2;

  v2 = *a1;
  return CMTimeGetSeconds(&v2);
}

CMTime *sub_10001CBFC@<X0>(Float64 a1@<X0>, CMTime *a2@<X8>)
{
  return CMTimeMakeWithSeconds(a2, a1, 1000000);
}

double sub_10001CC0C(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, long double a9)
{
  double v16;

  if (a9 >= 0.5)
    v16 = pow(a9 * -2.0 + 2.0, 3.0) * -0.5 + 1.0;
  else
    v16 = pow(a9, 3.0) * 4.0;
  return a1 + v16 * (a5 - a1);
}

void sub_10001FD8C(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  objc_msgSend(v1, "getUUIDBytes:", &unk_100095BC8);

}

uint64_t sub_1000205AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

void sub_100020A5C(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _BYTE v6[24];

  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v2 == (id)5)
  {
    if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)v6 = 136446466;
    *(_QWORD *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 72;
    v3 = " [INFO] %{public}s:%d AVAssetExportSessionStatusCancelled";
    goto LABEL_9;
  }
  if (v2 == (id)4)
  {
    if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)v6 = 136446466;
    *(_QWORD *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 67;
    v3 = " [INFO] %{public}s:%d AVAssetExportSessionFailed";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v3, v6, 0x12u);
LABEL_10:
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5818, 0, *(_OWORD *)v6, *(_QWORD *)&v6[16]));
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v6 = 136446466;
    *(_QWORD *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 77;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportSession returned with no errors", v6, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000223D4(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E670(a2, v3);
}

void sub_1000224C0(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E6D8(a2, v3);
}

void sub_100022590(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E740(a2, v3);
}

void sub_100022660(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E7A8(a2, v3);
}

void sub_1000227B8(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E810(a2, v3);
}

void sub_100022910(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E878(a2, v3);
}

void sub_1000229E0(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E8E0(a2, v3);
}

void sub_100022AB0(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E948(a2, v3);
}

void sub_100022B70(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004E9B0(a2, v3);
}

void sub_100022C40(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004EA18(a2, v3);
}

void sub_100022CDC(id a1)
{
  RPMultipleClientProxy *v1;
  void *v2;

  v1 = objc_alloc_init(RPMultipleClientProxy);
  v2 = (void *)qword_100095BE0;
  qword_100095BE0 = (uint64_t)v1;

}

void sub_100022EF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022FC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002315C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023184(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004EA80(a2, v3);
}

void sub_100023358(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023380(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004EAE8(a2, v3);
}

void sub_100023544(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002356C(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004EB50(a2, v3);
}

void sub_100023734(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002375C(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004EBB8(a2, v3);
}

void sub_10002391C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023944(id a1, NSError *a2)
{
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004EC20(a2, v3);
}

id sub_100023AAC(void *a1, const char *a2)
{
  return objc_msgSend(a1, "code");
}

void sub_100023AC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100023B10(id a1)
{
  RPClientManager *v1;
  void *v2;

  v1 = objc_alloc_init(RPClientManager);
  v2 = (void *)qword_100095BF0;
  qword_100095BF0 = (uint64_t)v1;

}

void sub_100023E7C(id a1, BOOL a2)
{
  _BOOL4 v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  _BOOL4 v8;

  if (dword_100095B40 <= 1)
  {
    v2 = a2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136446722;
      v4 = "-[RPClientManager removeClient:]_block_invoke";
      v5 = 1024;
      v6 = 57;
      v7 = 1024;
      v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop current active session ended with success:%d", (uint8_t *)&v3, 0x18u);
    }
  }
}

void sub_10002454C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100024574(uint64_t a1, char a2)
{
  unsigned int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = dword_100095B40;
  if ((a2 & 1) == 0)
  {
    if (dword_100095B40 <= 2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004ECF0();
      v3 = dword_100095B40;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  if (v3 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
    v6 = 1024;
    v7 = 112;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d leave stop group", (uint8_t *)&v4, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10002467C(uint64_t a1)
{
  uint64_t result;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (dword_100095B40 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v3 = 136446466;
        v4 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
        v5 = 1024;
        v6 = 121;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d all clients stopped", (uint8_t *)&v3, 0x12u);
      }
      result = *(_QWORD *)(a1 + 32);
    }
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  return result;
}

id sub_1000247AC()
{
  uint64_t v0;
  void *v1;
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: RPDaemonRun:", v3, 2u);
  }
  v0 = objc_claimAutoreleasedReturnValue(+[RPConnectionManager sharedInstance](RPConnectionManager, "sharedInstance"));
  v1 = (void *)qword_100095C00;
  qword_100095C00 = v0;

  return objc_msgSend((id)qword_100095C00, "finishStartup");
}

void sub_10002487C(id a1)
{
  RPConnectionManager *v1;
  void *v2;

  v1 = objc_alloc_init(RPConnectionManager);
  v2 = (void *)qword_100095C08;
  qword_100095C08 = (uint64_t)v1;

}

void sub_100024E00(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.replaykit.connectionManagerQueue", 0);
  v2 = (void *)qword_100095C18;
  qword_100095C18 = (uint64_t)v1;

}

void sub_10002521C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "-[RPConnectionManager processNewConnection:]_block_invoke";
    v9 = 1024;
    v10 = 201;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connection INTERRUPTED", buf, 0x12u);
  }
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025350;
  block[3] = &unk_1000819B0;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v2, block);

}

id sub_100025350(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "applicationDisconnectedWithBundleID:withProcessIdentifier:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void sub_100025364(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "-[RPConnectionManager processNewConnection:]_block_invoke_2";
    v9 = 1024;
    v10 = 207;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connection INVALID", buf, 0x12u);
  }
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025498;
  block[3] = &unk_1000819B0;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v2, block);

}

id sub_100025498(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "applicationDisconnectedWithBundleID:withProcessIdentifier:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

id sub_1000254AC(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "connectionManagerDidAcceptNewConnection:bundleIdentifier:", a1[5], a1[6]);
}

void sub_1000256B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  v5 = a2;
  v6 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPConnectionManager stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:]_block_invoke";
    v13 = 1024;
    v14 = 236;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stopped recording from file permissions error", buf, 0x12u);
  }
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000257F0;
  v9[3] = &unk_100081A00;
  v10 = v7;
  objc_msgSend(v8, "discardInAppRecordingWithHandler:", v9);

}

void sub_1000257F0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPConnectionManager stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:]_block_invoke";
    v6 = 1024;
    v7 = 238;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d discarded recording from file permissions error", (uint8_t *)&v4, 0x12u);
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5835, 0));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void sub_1000259E8(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stopCurrentActiveSessionWithHandler:", *(_QWORD *)(a1 + 40));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopCurrentActiveSessionWithHandler completed", v1, 2u);
  }
}

void sub_100025B20(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stopAllActiveClients");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopAllActiveClients completed", v1, 2u);
  }
}

void sub_100025C80(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getSystemBroadcastExtensionInfo:", *(_QWORD *)(a1 + 40));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: getSystemBroadcastExtensionInfo completed", v1, 2u);
  }
}

void sub_100025DE0(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBroadcastURL:", *(_QWORD *)(a1 + 40));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setBroadcastURL completed", v1, 2u);
  }
}

void sub_100025F8C(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "updateProcessIDForAudioCaptureWithPID:", *(unsigned int *)(a1 + 40));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPConnectionManager updateProcessIDForAudioCaptureWithPID:]_block_invoke";
    v3 = 1024;
    v4 = 288;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000261A8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100026248;
  v6[3] = &unk_100081318;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v2, v4, v5, v6, *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void sub_100026248(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint8_t v9[16];

  v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppRecordingWithContextID completed", v9, 2u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_100026468(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000264E0;
  v3[3] = &unk_100081318;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "resumeInAppRecordingWithWindowLayerContextID:completionHandler:", v1, v3);

}

void sub_1000264E0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v7 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPConnectionManager resumeInAppRecordingWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    v11 = 1024;
    v12 = 311;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_1000266DC(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002674C;
  v3[3] = &unk_100081368;
  v4 = v1;
  objc_msgSend(v2, "stopInAppRecordingWithHandler:", v3);

}

void sub_10002674C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppRecordingWithHandler completed", v8, 2u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);

}

id sub_1000268E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:", *(_QWORD *)(a1 + 40));
}

void sub_100026AA0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v11 = objc_msgSend(*(id *)(a1 + 32), "consumeSandboxExtensionToken:", *(_QWORD *)(a1 + 40));
  if (v9[3] == -1)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004EDFC();
    objc_msgSend(*(id *)(a1 + 32), "stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100026BC8;
    v5[3] = &unk_100081A78;
    v5[4] = v2;
    v7 = &v8;
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    objc_msgSend(v3, "stopInAppRecordingWithUrl:handler:", v4, v5);

  }
  _Block_object_dispose(&v8, 8);
}

void sub_100026BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100026BC8(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 v4;
  unsigned int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "releaseSandboxExtensionHandle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v5 = dword_100095B40;
  if ((v4 & 1) == 0 && dword_100095B40 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004EE74();
    v5 = dword_100095B40;
  }
  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPConnectionManager stopInAppRecordingWithUrl:extensionToken:handler:]_block_invoke";
    v8 = 1024;
    v9 = 354;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v6, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100026DF0(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "discardInAppRecordingWithHandler:", *(_QWORD *)(a1 + 40));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: discardInAppRecordingWithHandler completed", v1, 2u);
  }
}

void sub_100026F28(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "pauseInAppRecording");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppRecording completed", v1, 2u);
  }
}

void sub_1000270D8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027178;
  v6[3] = &unk_100081318;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "startInAppCaptureWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v2, v4, v5, v6, *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void sub_100027178(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint8_t v9[16];

  v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppCaptureWithContextID completed", v9, 2u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_100027310(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100027380;
  v3[3] = &unk_100080E68;
  v4 = v1;
  objc_msgSend(v2, "stopInAppCaptureWithHandler:", v3);

}

void sub_100027380(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[16];

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppCaptureWithHandler completed", v5, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_1000274D8(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "pauseInAppCapture");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppCapture completed", v1, 2u);
  }
}

void sub_1000276C0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100027738;
  v3[3] = &unk_100081318;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "resumeInAppCaptureWithWindowLayerContextID:completionHandler:", v1, v3);

}

void sub_100027738(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v7 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPConnectionManager resumeInAppCaptureWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    v11 = 1024;
    v12 = 420;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_100027A7C(_QWORD *a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1[4] + 16), "setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", a1[5], a1[6], a1[7], a1[8], a1[9]);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPConnectionManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:user"
         "Info:handler:]_block_invoke";
    v3 = 1024;
    v4 = 435;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100027CC4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(unsigned __int8 *)(a1 + 80);
  v5 = *(unsigned __int8 *)(a1 + 81);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027D68;
  v7[3] = &unk_100081318;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v2, v4, v5, v6, v7, *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void sub_100027D68(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint8_t v9[16];

  v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppBroadcastWithContextID completed", v9, 2u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_100027F00(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100027F70;
  v3[3] = &unk_100080E68;
  v4 = v1;
  objc_msgSend(v2, "stopInAppBroadcastWithHandler:", v3);

}

void sub_100027F70(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[16];

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppBroadcastWithHandler completed", v5, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_1000280C8(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "pauseInAppBroadcast");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppBroadcast completed", v1, 2u);
  }
}

void sub_1000282B0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100028328;
  v3[3] = &unk_100081318;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "resumeInAppBroadcastWithWindowLayerContextID:completionHandler:", v1, v3);

}

void sub_100028328(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v7 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPConnectionManager resumeInAppBroadcastWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    v11 = 1024;
    v12 = 485;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_10002864C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000286EC;
  v6[3] = &unk_100080E68;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v2, v4, v5, v6, *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void sub_1000286EC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[16];

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startSystemRecordingWithContextID completed", v5, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100028948(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000289B8;
  v3[3] = &unk_100080E68;
  v4 = v1;
  objc_msgSend(v2, "stopSystemRecordingWithHandler:", v3);

}

void sub_1000289B8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[16];

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopSystemRecordingWithHandler completed", v5, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100028C18(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100028C88;
  v3[3] = &unk_100081368;
  v4 = v1;
  objc_msgSend(v2, "stopSystemRecordingWithURLHandler:", v3);

}

void sub_100028C88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopSystemRecordingWithURLHandler completed", v8, 2u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);

}

void sub_100028ED8(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100028F48;
  v3[3] = &unk_100081408;
  v4 = v1;
  objc_msgSend(v2, "resumeSystemRecordingWithCompletionHandler:", v3);

}

uint64_t sub_100028F48(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[RPConnectionManager resumeSystemRecordingWithCompletionHandler:]_block_invoke_2";
    v7 = 1024;
    v8 = 563;
    v9 = 1024;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed with success:%d", (uint8_t *)&v5, 0x18u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100029288(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100029320;
  v6[3] = &unk_100080E68;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v2, "setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", v1, v3, v4, v5, v6);

}

void sub_100029320(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[16];

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setupSystemBroadcastWithHostBundleID completed", v5, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100029518(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(unsigned __int8 *)(a1 + 80);
  v5 = *(unsigned __int8 *)(a1 + 81);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000295BC;
  v7[3] = &unk_100080E68;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "startSystemBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v2, v4, v5, v6, v7, *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void sub_1000295BC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[16];

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startSystemBroadcastWithContextID completed", v5, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_10002973C(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000297AC;
  v3[3] = &unk_100080E68;
  v4 = v1;
  objc_msgSend(v2, "stopSystemBroadcastWithHandler:", v3);

}

void sub_1000297AC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[16];

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopSystemBroadcastWithHandler completed", v5, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_1000299E0(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100029A50;
  v3[3] = &unk_100081408;
  v4 = v1;
  objc_msgSend(v2, "resumeSystemBroadcastWithCompletionHandler:", v3);

}

uint64_t sub_100029A50(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[RPConnectionManager resumeSystemBroadcastWithCompletionHandler:]_block_invoke_2";
    v7 = 1024;
    v8 = 632;
    v9 = 1024;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed with success:%d", (uint8_t *)&v5, 0x18u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100029CE8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100029D88;
  v6[3] = &unk_100081318;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:", v2, v4, v5, v6, *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void sub_100029D88(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v7 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPConnectionManager startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletio"
          "nHandler:]_block_invoke_2";
    v11 = 1024;
    v12 = 653;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_100029FE8(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002A058;
  v3[3] = &unk_100080E68;
  v4 = v1;
  objc_msgSend(v2, "stopClipBufferingWithCompletionHandler:", v3);

}

void sub_10002A058(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPConnectionManager stopClipBufferingWithCompletionHandler:]_block_invoke_2";
    v7 = 1024;
    v8 = 666;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v5, 0x12u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_10002A3A0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  id v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v14 = objc_msgSend(*(id *)(a1 + 32), "consumeSandboxExtensionToken:", *(_QWORD *)(a1 + 40));
  if (v12[3] == -1)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F234();
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5835, 0));
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    v4 = *(double *)(a1 + 64);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002A504;
    v8[3] = &unk_100081A78;
    v8[4] = v2;
    v10 = &v11;
    v5 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v3, "exportClipToURL:duration:completionHandler:", v5, v8, v4);

  }
  _Block_object_dispose(&v11, 8);
}

void sub_10002A4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002A504(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "releaseSandboxExtensionHandle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v5 = dword_100095B40;
  if ((v4 & 1) == 0 && dword_100095B40 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F2AC();
    v5 = dword_100095B40;
  }
  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPConnectionManager exportClipToURL:duration:extensionToken:completionHandler:]_block_invoke";
    v9 = 1024;
    v10 = 697;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v7, 0x12u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void sub_10002A7B8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002A830;
  v3[3] = &unk_100081318;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "resumeInAppClipWithWindowLayerContextID:completionHandler:", v1, v3);

}

void sub_10002A830(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v7 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPConnectionManager resumeInAppClipWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    v11 = 1024;
    v12 = 711;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);

}

void sub_10002AA04(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "macApplicationDidResignActive");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: macApplicationDidResignActive", v1, 2u);
  }
}

void sub_10002ABEC(_QWORD *a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1[4] + 16), "macApplicationDidBecomeActiveWithContextID:completionHandler:", a1[5], a1[6]);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPConnectionManager macApplicationDidBecomeActiveWithContextID:completionHandler:]_block_invoke";
    v3 = 1024;
    v4 = 734;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10002AFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002AFC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002B050;
  v6[3] = &unk_100081A78;
  v6[4] = v1;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v3, "saveVideo:handler:", v2, v6);

}

void sub_10002B050(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 v4;
  unsigned int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "releaseSandboxExtensionHandle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v5 = dword_100095B40;
  if ((v4 & 1) == 0 && dword_100095B40 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F414();
    v5 = dword_100095B40;
  }
  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPConnectionManager saveVideo:extensionToken:handler:]_block_invoke";
    v8 = 1024;
    v9 = 759;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v6, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10002B29C(_QWORD *a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(a1[4] + 16), "saveVideoToCameraRoll:handler:", a1[5], a1[6]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: saveVideoToCameraRoll completed", v1, 2u);
  }
}

void sub_10002B428(_QWORD *a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(a1[4] + 16), "saveClipToCameraRoll:handler:", a1[5], a1[6]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: saveClipToCameraRoll completed", v1, 2u);
  }
}

void sub_10002B6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002B704(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002B78C;
  v6[3] = &unk_100081A78;
  v6[4] = v1;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v3, "saveClipToCameraRoll:handler:", v2, v6);

}

void sub_10002B78C(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 v4;
  unsigned int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "releaseSandboxExtensionHandle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v5 = dword_100095B40;
  if ((v4 & 1) == 0 && dword_100095B40 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F504();
    v5 = dword_100095B40;
  }
  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPConnectionManager saveClipToCameraRoll:extensionToken:handler:]_block_invoke";
    v8 = 1024;
    v9 = 798;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v6, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10002B998(uint64_t a1)
{
  uint8_t v1[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reportCameraUsage:", *(_QWORD *)(a1 + 40));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: reportCameraUsage completed", v1, 2u);
  }
}

id sub_10002BDD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setMicrophoneEnabled:", *(unsigned __int8 *)(a1 + 40));
}

void sub_10002BF48(uint64_t a1)
{
  int v1;
  const char *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getSystemBroadcastPickerInfo:", *(_QWORD *)(a1 + 40));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[RPConnectionManager getSystemBroadcastPickerInfo:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", (uint8_t *)&v1, 0xCu);
  }
}

void sub_10002C168(uint64_t a1)
{
  int v1;
  const char *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBroadcastPickerPreferredExt:showsMicButton:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[RPConnectionManager setBroadcastPickerPreferredExt:showsMicButton:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", (uint8_t *)&v1, 0xCu);
  }
}

void sub_10002C34C(uint64_t a1)
{
  int v1;
  const char *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "openControlCenterSystemRecordingView");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[RPConnectionManager openControlCenterSystemRecordingView]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", (uint8_t *)&v1, 0xCu);
  }
}

void sub_10002C480(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/Frameworks/ReplayKit.framework")));
  v1 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v3));
  v2 = (void *)qword_100095C28;
  qword_100095C28 = v1;

}

uint64_t sub_10002D044(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
  objc_msgSend(v2, "stopCaptureForDelegate:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
  objc_msgSend(*(id *)(a1 + 32), "reportSummaryEvent:recordedFileSize:", 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "invalidateConnection");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 432);
  *(_QWORD *)(v3 + 432) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

id sub_10002D24C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "recordingDidPause");
}

uint64_t sub_10002D3E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002D3F4(id a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    v3 = 1024;
    v4 = 167;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying extension of resume", (uint8_t *)&v1, 0x12u);
  }
}

id sub_10002DDFC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startCaptureWithHandler:", *(_QWORD *)(a1 + 40));
}

void sub_10002DFF0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F848();
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446466;
      v11 = "-[RPSystemBroadcastSession startCaptureWithHandler:]_block_invoke";
      v12 = 1024;
      v13 = 349;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d startCapture has started successfully", (uint8_t *)&v10, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);
    v6 = *(id **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[48], "infoDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", _kCFBundleDisplayNameKey));
    objc_msgSend(v6, "setUpStatusBarAssertionWithServiceName:", v8);

    objc_msgSend(*(id *)(a1 + 32), "checkAndPlaySystemSessionSound:", 1);
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v5 = *(void (**)(void))(v9 + 16);
      goto LABEL_12;
    }
  }

}

void sub_10002E4A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_10002E4FC(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "disableBroadcast");
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPSystemBroadcastSession enableBroadcastWithListenerEndpoint:]_block_invoke";
    v6 = 1024;
    v7 = 387;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connection to extensions ready", (uint8_t *)&v4, 0x12u);
  }

}

void sub_10002E5E8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleBroadcastServiceInfo:", v3);

}

void sub_10002E630(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleBroadcastURL:", v3);

}

void sub_10002E678(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleBroadcastError:", v3);

}

id sub_10002E834(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "showAlertForBroadcastSessionWithError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5804, 0, 0);
}

void sub_10002EA38(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  v4 = objc_alloc((Class)NSKeyedUnarchiver);
  v5 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  v6 = objc_msgSend(v4, "initForReadingFromData:error:", v5, &v17);
  v7 = v17;
  v8 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(RPBroadcastConfiguration), NSKeyedArchiveRootObjectKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 384);
  *(_QWORD *)(v10 + 384) = v3;
  v12 = v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 392), *(id *)(a1 + 48));
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 448);
  *(_QWORD *)(v13 + 448) = v9;
  v15 = v9;

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 424) = 1;
  v16 = *(_QWORD *)(a1 + 40) + 400;
  *(_QWORD *)(v16 + 16) = kCMTimeZero.epoch;
  *(_OWORD *)v16 = *(_OWORD *)&kCMTimeZero.value;
  objc_msgSend(*(id *)(a1 + 40), "setupDispatchLimits");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_10002ED00(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 && objc_msgSend(v5, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
LABEL_6:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v15)
          break;
        if (v10 == (id)++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v10)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v26 = "-[RPSystemBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:broadcastExtensionBundleID:withH"
              "andler:]_block_invoke";
        v27 = 1024;
        v28 = 474;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d found matching broadcastExtension", buf, 0x12u);
      }
      v17 = v13;

      if (v17)
        goto LABEL_22;
    }
    else
    {
LABEL_12:

    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F8C4();
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
LABEL_22:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002EFA4;
    v18[3] = &unk_100081C48;
    v16 = *(_QWORD *)(a1 + 40);
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    +[NSExtension extensionsWithMatchingPointName:baseIdentifier:unwantedActivationRule:completion:](NSExtension, "extensionsWithMatchingPointName:baseIdentifier:unwantedActivationRule:completion:", CFSTR("com.apple.broadcast-services"), v16, CFSTR("NSExtensionActivationSupportsReplayKitStreaming"), v18);

    v17 = v19;
  }

}

void sub_10002EFA4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  _BYTE v24[128];

  v5 = a2;
  v6 = v5;
  if (v5 && !a3 && objc_msgSend(v5, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
LABEL_6:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier", (_QWORD)v16));
        v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v14)
          break;
        if (v9 == (id)++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v9)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v21 = "-[RPSystemBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:broadcastExtensionBundleID:withH"
              "andler:]_block_invoke";
        v22 = 1024;
        v23 = 494;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d found matching broadcastExtension", buf, 0x12u);
      }
      v15 = v12;

      if (v15)
        goto LABEL_21;
    }
    else
    {
LABEL_12:

    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F940();
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject", (_QWORD)v16));
LABEL_21:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void sub_10002F1F8(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.replaykit.SystemBroadcastSessionDispatchQueue", 0);
  v2 = (void *)qword_100095C38;
  qword_100095C38 = (uint64_t)v1;

}

void sub_10002F370(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004F9BC(a1, (uint64_t)v3);
  objc_msgSend(*(id *)(a1 + 40), "notifyClientSessionDidStopWithError:movieURL:showAlert:", objc_msgSend(*(id *)(a1 + 32), "code"), 0, 1);

}

id sub_10002F6CC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[7];

  v2 = a1[4];
  v1 = a1[5];
  v3 = *(void **)(v2 + 432);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F738;
  v6[3] = &unk_100081CB8;
  v4 = a1[7];
  v6[5] = a1[6];
  v6[6] = v4;
  v6[4] = v2;
  return objc_msgSend(v3, "processPayload:completion:", v1, v6);
}

id sub_10002F738(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v5 = 136446722;
    v6 = "-[RPSystemBroadcastSession notifyExtensionOfAudioSampleBuffer:withType:]_block_invoke_2";
    v7 = 1024;
    v8 = 621;
    v9 = 2048;
    v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending %ld audio payload to broadcast extension...", (uint8_t *)&v5, 0x1Cu);
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchCompleted:", *(_QWORD *)(a1 + 40));
}

id sub_10002FB3C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[7];

  v2 = a1[4];
  v1 = a1[5];
  v3 = *(void **)(v2 + 432);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002FBA8;
  v7[3] = &unk_100081CB8;
  v4 = a1[6];
  v5 = a1[7];
  v7[4] = v2;
  v7[5] = v4;
  v7[6] = v5;
  return objc_msgSend(v3, "processPayload:completion:", v1, v7);
}

id sub_10002FBA8(uint64_t a1)
{
  const void *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPSystemBroadcastSession notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:]_block_invoke_2";
    v6 = 1024;
    v7 = 671;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending video payload to broadcast extension...", (uint8_t *)&v4, 0x12u);
  }
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchCompleted:", *(_QWORD *)(a1 + 48));
}

uint64_t sub_10002FF88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t sub_10002FF94(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002FFDC(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.replaykit.broadcastSession.AudioSampleQueue", v4);
  v3 = (void *)qword_100095C48;
  qword_100095C48 = (uint64_t)v2;

}

void sub_100030070(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.replaykit.broadcastSession.VideoSampleQueue", v4);
  v3 = (void *)qword_100095C58;
  qword_100095C58 = (uint64_t)v2;

}

void sub_1000301CC(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5806, 0, 0);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemBroadcastSession handleSystemAlertStop]_block_invoke";
    v3 = 1024;
    v4 = 793;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100030318(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5806, 0, 0);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemBroadcastSession handleDeviceLockedWarning]_block_invoke";
    v3 = 1024;
    v4 = 804;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100030464(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5802, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemBroadcastSession handleDeviceRestrictionWarning]_block_invoke";
    v3 = 1024;
    v4 = 815;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100030744(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPSystemBroadcastSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    v8 = 1024;
    v9 = 829;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3)
    v4 = 3;
  else
    v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void sub_1000308C8(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5804, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemBroadcastSession handleResumeContextIDFailure]_block_invoke";
    v3 = 1024;
    v4 = 846;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100030A88(id a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemBroadcastSession handleFrontmostApplicationDidChange:]_block_invoke";
    v3 = 1024;
    v4 = 867;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d replayd sending frontmost app bundleID to broadcast extension...", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100030C54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100031BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientWithOutputURL:error:withHandler:", a2, a3, *(_QWORD *)(a1 + 40));
}

id sub_100031BD8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientWithOutputURL:error:withHandler:", 0, a2, *(_QWORD *)(a1 + 40));
}

id sub_100031BEC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientWithOutputURL:error:withHandler:", 0, a2, *(_QWORD *)(a1 + 40));
}

id sub_100031C00(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientWithOutputURL:error:withHandler:", 0, a2, *(_QWORD *)(a1 + 40));
}

id sub_100031C14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientWithOutputURL:error:withHandler:", 0, a2, *(_QWORD *)(a1 + 40));
}

id sub_100031C28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientWithOutputURL:error:withHandler:", 0, a2, *(_QWORD *)(a1 + 40));
}

void sub_100031FCC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004FE90();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reportingAgent"));
    objc_msgSend(v4, "resetReportingMetrics");

    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientBundleID"));
    objc_msgSend(v5, "beginPrivacyAccountingIntervalwithSource:withDestination:", v6, 0);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v3, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cameraEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "microphoneEnabled"));

}

void sub_1000321EC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004FF0C();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endPrivacyAccountingInterval");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);

}

void sub_10003249C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446722;
      v7 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]_block_invoke";
      v8 = 1024;
      v9 = 497;
      v10 = 2112;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not resuming with error %@", (uint8_t *)&v6, 0x1Cu);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v4 + 16))(v4, v3, 0, 0);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446466;
      v7 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]_block_invoke";
      v8 = 1024;
      v9 = 503;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed", (uint8_t *)&v6, 0x12u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id, id))(v5 + 16))(v5, 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cameraEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "microphoneEnabled"));
  }

}

uint64_t sub_100032774(uint64_t a1)
{
  uint64_t result;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPClient discardInAppRecordingWithHandler:]_block_invoke";
    v5 = 1024;
    v6 = 514;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d In app recording has been discared", (uint8_t *)&v3, 0x12u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100032AE4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004FF88();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reportingAgent"));
    objc_msgSend(v4, "resetReportingMetrics");

    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientBundleID"));
    objc_msgSend(v5, "beginPrivacyAccountingIntervalwithSource:withDestination:", v6, 0);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v3, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cameraEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "microphoneEnabled"));

}

void sub_100032D04(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050004();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endPrivacyAccountingInterval");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100032F98(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446722;
      v7 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]_block_invoke";
      v8 = 1024;
      v9 = 579;
      v10 = 2112;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not resuming with error %@", (uint8_t *)&v6, 0x1Cu);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v4 + 16))(v4, v3, 0, 0);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446466;
      v7 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]_block_invoke";
      v8 = 1024;
      v9 = 585;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed", (uint8_t *)&v6, 0x12u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id, id))(v5 + 16))(v5, 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cameraEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "microphoneEnabled"));
  }

}

void sub_100033630(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000500FC();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 3;
    v4 = *(id **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[3], "broadcastHostBundleId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientBundleID"));
    objc_msgSend(v4, "beginPrivacyAccountingIntervalwithSource:withDestination:", v5, v6);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v3, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cameraEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "microphoneEnabled"));

}

void sub_100033850(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050178();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endPrivacyAccountingInterval");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100033B30(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446722;
      v7 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]_block_invoke";
      v8 = 1024;
      v9 = 672;
      v10 = 2112;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not resuming with error %@", (uint8_t *)&v6, 0x1Cu);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v4 + 16))(v4, v3, 0, 0);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446466;
      v7 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]_block_invoke";
      v8 = 1024;
      v9 = 678;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed", (uint8_t *)&v6, 0x12u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id, id))(v5 + 16))(v5, 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cameraEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "microphoneEnabled"));
  }

}

void sub_100033F7C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000501F4();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 4;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reportingAgent"));
    objc_msgSend(v4, "resetReportingMetrics");

    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientBundleID"));
    objc_msgSend(v5, "beginPrivacyAccountingIntervalwithSource:withDestination:", v6, 0);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v3, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cameraEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "microphoneEnabled"));

}

void sub_10003419C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050270();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endPrivacyAccountingInterval");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100034430(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446722;
      v7 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]_block_invoke";
      v8 = 1024;
      v9 = 743;
      v10 = 2112;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not resuming with error %@", (uint8_t *)&v6, 0x1Cu);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v4 + 16))(v4, v3, 0, 0);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446466;
      v7 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]_block_invoke";
      v8 = 1024;
      v9 = 749;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed", (uint8_t *)&v6, 0x12u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id, id))(v5 + 16))(v5, 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cameraEnabled"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "microphoneEnabled"));
  }

}

void sub_100034734(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446722;
      v8 = "-[RPClient exportClipToURL:duration:completionHandler:]_block_invoke";
      v9 = 1024;
      v10 = 761;
      v11 = 2112;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Clip not exported with error %@", (uint8_t *)&v7, 0x1Cu);
    }
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446466;
      v8 = "-[RPClient exportClipToURL:duration:completionHandler:]_block_invoke";
      v9 = 1024;
      v10 = 766;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully clipped", (uint8_t *)&v7, 0x12u);
    }
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }

}

void sub_100034B48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000502EC();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 5;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "reportingAgent"));
    objc_msgSend(v4, "resetReportingMetrics");

    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientBundleID"));
    objc_msgSend(v5, "beginPrivacyAccountingIntervalwithSource:withDestination:", v6, 0);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void sub_100034D40(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050368();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endPrivacyAccountingInterval");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100034EF0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000503E4();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endPrivacyAccountingInterval");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);

}

void sub_1000350C4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050460();
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPClient resumeSystemRecordingWithCompletionHandler:]_block_invoke";
    v7 = 1024;
    v8 = 855;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed system recording", (uint8_t *)&v5, 0x12u);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 == 0);

}

void sub_1000356B4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000504DC();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 6;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "reportingAgent"));
    objc_msgSend(v4, "resetReportingMetrics");

    v5 = *(id **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[6], "broadcastHostBundleId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientBundleID"));
    objc_msgSend(v5, "beginPrivacyAccountingIntervalwithSource:withDestination:", v6, v7);

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void sub_1000358C8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050558();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endPrivacyAccountingInterval");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100035A80(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000505D4();
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPClient resumeSystemBroadcastWithCompletionHandler:]_block_invoke";
    v7 = 1024;
    v8 = 931;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed system broadcast", (uint8_t *)&v5, 0x12u);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 == 0);

}

uint64_t sub_100036874(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100037454(id a1)
{
  RPAngelProxy *v1;
  void *v2;

  v1 = objc_alloc_init(RPAngelProxy);
  v2 = (void *)qword_100095C68;
  qword_100095C68 = (uint64_t)v1;

}

void sub_1000374BC(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.replaykitangel.angelProxyConnectionQueue", 0);
  v2 = (void *)qword_100095C78;
  qword_100095C78 = (uint64_t)v1;

}

void sub_100037528(id a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[BSMutableServiceInterface interfaceWithIdentifier:](BSMutableServiceInterface, "interfaceWithIdentifier:", CFSTR("com.apple.ReplayKitAngel.session")));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___RPAngelServerProtocol));
  objc_msgSend(v5, "setServer:", v1);

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___RPAngelClientProtocol));
  objc_msgSend(v5, "setClient:", v2);

  objc_msgSend(v5, "setClientMessagingExpectation:", 0);
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)qword_100095C88;
  qword_100095C88 = (uint64_t)v3;

}

void sub_100037790(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionManagerQueue"));
  objc_msgSend(v4, "setTargetQueue:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceQuality userInitiated](BSServiceQuality, "userInitiated"));
  objc_msgSend(v4, "setServiceQuality:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getBSServiceInterface"));
  objc_msgSend(v4, "setInterface:", v7);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setActivationHandler:", &stru_100081E08);
  objc_msgSend(v4, "setInterruptionHandler:", &stru_100081E28);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100037A44;
  v8[3] = &unk_100081E50;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v8);

}

void sub_10003789C(id a1, BSServiceConnectionContext *a2)
{
  BSServiceConnectionContext *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v2 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelProxy setupConnection]_block_invoke_2";
    v5 = 1024;
    v6 = 86;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Activation handler", (uint8_t *)&v3, 0x12u);
  }

}

void sub_10003796C(id a1, BSServiceConnectionContext *a2)
{
  BSServiceConnectionContext *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v2 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelProxy setupConnection]_block_invoke";
    v5 = 1024;
    v6 = 89;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Interruption handler", (uint8_t *)&v3, 0x12u);
  }
  -[BSServiceConnectionContext activate](v2, "activate");

}

void sub_100037A44(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPAngelProxy setupConnection]_block_invoke";
    v8 = 1024;
    v9 = 93;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Invalidation handler", (uint8_t *)&v6, 0x12u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

void sub_1000388CC(uint64_t a1, char a2)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if ((a2 & 1) != 0)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136446466;
      v4 = "-[RPAngelProxy resumeCurrentSystemSession]_block_invoke";
      v5 = 1024;
      v6 = 200;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel resume recording success", (uint8_t *)&v3, 0x12u);
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136446466;
      v4 = "-[RPAngelProxy resumeCurrentSystemSession]_block_invoke";
      v5 = 1024;
      v6 = 197;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel failed to resume recording", (uint8_t *)&v3, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "hideAndStopRecordingBanner");
  }
}

void sub_100038E60(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  UInt32 ioDataSize;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
    v25 = 1024;
    v26 = 267;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v2 = objc_retainBlock(*(id *)(a1 + 40));
  v4 = (id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  *((_QWORD *)*v4 + 4) = malloc_type_malloc(0xA0uLL, 0x1020040115CD000uLL);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v7 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)(v6 + 40) = v8;
  *(_OWORD *)(v6 + 24) = v7;
  v9 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(v9 + 96) = *(_OWORD *)&kCMTimeInvalid.value;
  *(_QWORD *)(v9 + 112) = kCMTimeInvalid.epoch;
  if ((objc_msgSend(*v4, "handleStartAudioQueueFailed:didFailHandler:", AudioQueueNewInput((const AudioStreamBasicDescription *)(*((_QWORD *)*v4 + 4) + 8), (AudioQueueInputCallback)sub_1000393C0, *v4, 0, 0, 0x800u, *((AudioQueueRef **)*v4 + 4)), *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
      v25 = 1024;
      v26 = 287;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Created Audio Queue Input", buf, 0x12u);
    }
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    if (v10)
    {
      v13 = objc_msgSend(v10, "newAudioTapForAudioCaptureConfig:", v11, v12);
      if (v13)
      {
        v14 = v13;
        if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueSetProperty(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 0x71746F62u, v13, 8u), *(_QWORD *)(a1 + 48)) & 1) == 0)
        {
          if (dword_100095B40 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
            v25 = 1024;
            v26 = 299;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully set Audio Queue Process Tap", buf, 0x12u);
          }
          ioDataSize = 40;
          if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueGetProperty(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 0x61716674u, (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8), &ioDataSize), *(_QWORD *)(a1 + 48)) & 1) == 0)
          {
            *(_DWORD *)(*((_QWORD *)*v4 + 4) + 136) = 4096;
            for (i = 48; i != 128; i += 8)
            {
              AudioQueueAllocateBuffer(**((AudioQueueRef **)*v4 + 4), *(_DWORD *)(*((_QWORD *)*v4 + 4) + 136), (AudioQueueBufferRef *)(*((_QWORD *)*v4 + 4) + i));
              AudioQueueEnqueueBuffer(**((AudioQueueRef **)*v4 + 4), *(AudioQueueBufferRef *)(*((_QWORD *)*v4 + 4) + i), 0, 0);
            }
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 144) = 0;
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 152) = 1;
            if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueAddPropertyListener(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_100039520, *(void **)(a1 + 32)), *(_QWORD *)(a1 + 48)) & 1) == 0)
            {
              v16 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0);
              if ((_DWORD)v16 == -66665)
              {
                if (dword_100095B40 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  v25 = 1024;
                  v26 = 330;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AudioQueueStart retry after can not start yet error", buf, 0x12u);
                }
                sleep(1u);
                v16 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0);
              }
              if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", v16, *(_QWORD *)(a1 + 48)) & 1) == 0)
              {
                if (dword_100095B40 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  v25 = 1024;
                  v26 = 338;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully started Audio Queue Recording", buf, 0x12u);
                }
                v17 = objc_retainBlock(*(id *)(a1 + 48));
                v18 = *(_QWORD *)(a1 + 32);
                v19 = *(void **)(v18 + 24);
                *(_QWORD *)(v18 + 24) = v17;

              }
            }
          }
        }
LABEL_33:

        return;
      }
    }
    else
    {

    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000508F8((uint64_t *)(a1 + 32));
    v20 = *(_QWORD *)(a1 + 48);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

    v14 = 0;
    goto LABEL_33;
  }
}

void sub_1000393C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  id v10;
  CMTimeValue value;
  CMTimeScale timescale;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  CMTime v19;
  int v20;
  CMTime time2;
  CMTime time1;
  CMTime v23;

  v10 = a1;
  memset(&v23, 0, sizeof(v23));
  CMClockMakeHostTimeFromSystemUnits(&v23, *(_QWORD *)(a4 + 8));
  value = v23.value;
  timescale = v23.timescale;
  time1 = *(CMTime *)((_BYTE *)v10 + 4);
  time2 = kCMTimeInvalid;
  if (CMTimeCompare(&time1, &time2)
    && value
    && *((_QWORD *)v10 + 12) >= value
    && dword_100095B40 <= 2
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100050998(value, timescale);
  }
  v13 = *((_QWORD *)v10 + 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039E48;
  block[3] = &unk_100081EF8;
  v19 = v23;
  v16 = v10;
  v17 = a3;
  v20 = a5;
  v18 = a6;
  v14 = v10;
  dispatch_async(v13, block);

}

void sub_100039520(void *a1, OpaqueAudioQueue *a2, int a3)
{
  _QWORD *v5;
  NSObject *v6;
  AudioQueueRef **v7;
  _QWORD block[4];
  AudioQueueRef **v9;
  int v10;
  UInt32 ioDataSize;
  int outData;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;

  v5 = a1;
  ioDataSize = 4;
  outData = 0;
  if (a3 == 1634824814)
  {
    if (AudioQueueGetProperty(a2, 0x6171726Eu, &outData, &ioDataSize))
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100050A18();
    }
    else
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v14 = "isRunningListenerCallback";
        v15 = 1024;
        v16 = 238;
        v17 = 1024;
        v18 = outData;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: isRunningListenerCallback with isRunning %d", buf, 0x18u);
      }
      v6 = v5[1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003A3B8;
      block[3] = &unk_100081A28;
      v7 = v5;
      v9 = v7;
      v10 = outData;
      dispatch_async(v6, block);
      AudioQueueRemovePropertyListener(*v7[4], 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_100039520, v7);

    }
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100050A94();
  }

}

id sub_100039710(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  result = *(id *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = result;
  return result;
}

void sub_100039740(uint64_t a1)
{

}

void sub_100039760(id a1, NSError *a2)
{
  NSError *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;

  v2 = a2;
  if (v2 && dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5833, 0));
    v4 = 136446722;
    v5 = "-[RPAppAudioCaptureManager resumeWithConfig:]_block_invoke";
    v6 = 1024;
    v7 = 356;
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Error: %@", (uint8_t *)&v4, 0x1Cu);

  }
}

void sub_1000398B8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  OSStatus v7;
  BOOL v8;
  OSStatus v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  OSStatus v16;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
    v13 = 1024;
    v14 = 363;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 32);
  if (v5)
  {
    if (*(_DWORD *)(v5 + 152))
    {
      *(_DWORD *)(v5 + 152) = 0;
      if (AudioQueueStop(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 1u))
      {
        if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100050B8C();
      }
      else
      {
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          v13 = 1024;
          v14 = 378;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Audio Queue successfully stopped", buf, 0x12u);
        }
        for (i = 48; i != 128; i += 8)
        {
          v7 = AudioQueueFreeBuffer(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), *(AudioQueueBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + i));
          if (v7)
            v8 = dword_100095B40 > 2;
          else
            v8 = 1;
          if (!v8)
          {
            v9 = v7;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
              v13 = 1024;
              v14 = 385;
              v15 = 1024;
              v16 = v9;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d AudioQueueFreeBuffer error: %i", buf, 0x18u);
            }
          }
        }
        if (AudioQueueDispose(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 1u))
        {
          if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100050B10();
        }
        else if (dword_100095B40 <= 1
               && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          v13 = 1024;
          v14 = 391;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Audio Queue has been disposed", buf, 0x12u);
        }
      }
    }
    AudioQueueRemovePropertyListener(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_100039520, *(void **)(a1 + 32));
    free(*(void **)(*(_QWORD *)(a1 + 32) + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v4 = *(_QWORD *)(a1 + 32);
  }
  v10 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

}

void sub_100039DF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100039E48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 *v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  double v12;
  Float64 v13;
  uint64_t v14;
  __int128 v15;
  CMSampleBufferRef v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  size_t v20;
  CMItemCount v21;
  const AudioStreamPacketDescription *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  CMTime time;
  CMBlockBufferRef destinationBuffer;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMTime time2;
  _BYTE time1[32];
  uint64_t v34;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 32))
    return;
  v4 = (__int128 *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_DWORD *)(a1 + 64);
  *(_OWORD *)time1 = *(_OWORD *)(v1 + 96);
  *(_QWORD *)&time1[16] = *(_QWORD *)(v1 + 112);
  time2 = kCMTimeInvalid;
  if (CMTimeCompare((CMTime *)time1, &time2))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 96) >= v3)
    {
      if (dword_100095B40 <= 2)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100050EF0(v3, v5);
        v6 = *(_QWORD *)(a1 + 32);
      }
      if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(v6 + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0))
        v7 = dword_100095B40 > 2;
      else
        v7 = 1;
      if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100050E74();
      return;
    }
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)time1 = 136446722;
    *(_QWORD *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 147;
    *(_WORD *)&time1[18] = 2048;
    *(double *)&time1[20] = (float)((float)v3 / (float)v5);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: first sample received at time %.3f", time1, 0x1Cu);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *v4;
  *(_QWORD *)(v8 + 112) = *((_QWORD *)v4 + 2);
  *(_OWORD *)(v8 + 96) = v9;
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v10 + 40))
  {
    *(_BYTE *)(v10 + 40) = 0;
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v10 + 48))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      if (v12 > 0.0)
      {
        v13 = v12;
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)time1 = 136446466;
          *(_QWORD *)&time1[4] = "handleInputBuffer_block_invoke";
          *(_WORD *)&time1[12] = 1024;
          *(_DWORD *)&time1[14] = 159;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: gap since last audio tap, filling with empty sample buffer", time1, 0x12u);
        }
        v14 = *(_QWORD *)(a1 + 32);
        time2 = kCMTimeZero;
        v15 = *(_OWORD *)(v14 + 72);
        *(_OWORD *)time1 = *(_OWORD *)(v14 + 56);
        *(_OWORD *)&time1[16] = v15;
        v34 = *(_QWORD *)(v14 + 88);
        v16 = sub_100047114(&time2, (uint64_t)time1, v13);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
        if (v16)
          CFRelease(v16);
      }

      v10 = *(_QWORD *)(a1 + 32);
    }
  }
  v17 = *(_QWORD *)(v10 + 32);
  if (*(_DWORD *)(v17 + 152) == 2)
  {
    v18 = *(_DWORD *)(a1 + 80);
    if (!v18)
    {
      v19 = *(_DWORD *)(v17 + 24);
      if (v19)
        v18 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 16) / v19;
      else
        v18 = 0;
    }
    formatDescriptionOut = 0;
    time2.value = 0;
    destinationBuffer = 0;
    if (!CMAudioFormatDescriptionCreate(kCFAllocatorDefault, (const AudioStreamBasicDescription *)(v17 + 8), 0, 0, 0, 0, 0, &formatDescriptionOut))
    {
      v20 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 16);
      if (!CMBlockBufferCreateWithMemoryBlock(kCFAllocatorDefault, 0, v20, kCFAllocatorDefault, 0, 0, v20, 1u, &destinationBuffer)&& !CMBlockBufferReplaceDataBytes(*(const void **)(*(_QWORD *)(a1 + 40) + 8), destinationBuffer, 0, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 16)))
      {
        v21 = *(unsigned int *)(a1 + 80);
        v22 = *(const AudioStreamPacketDescription **)(a1 + 48);
        *(_OWORD *)time1 = *v4;
        *(_QWORD *)&time1[16] = *((_QWORD *)v4 + 2);
        if (!CMAudioSampleBufferCreateReadyWithPacketDescriptions(kCFAllocatorDefault, destinationBuffer, formatDescriptionOut, v21, (CMTime *)time1, v22, (CMSampleBufferRef *)&time2))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          CMSampleBufferGetDuration(&time, (CMSampleBufferRef)time2.value);
          v24 = objc_msgSend(v23, "dateByAddingTimeInterval:", CMTimeGetSeconds(&time));
          v25 = objc_claimAutoreleasedReturnValue(v24);
          v26 = *(_QWORD *)(a1 + 32);
          v27 = *(void **)(v26 + 48);
          *(_QWORD *)(v26 + 48) = v25;

          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
          if (v28)
            (*(void (**)(uint64_t, CMTimeValue))(v28 + 16))(v28, time2.value);
        }
      }
    }
    if (time2.value)
      CFRelease((CFTypeRef)time2.value);
    if (destinationBuffer)
      CFRelease(destinationBuffer);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 144) += v18;
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)time1 = 136446466;
    *(_QWORD *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 168;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: recorder is not running, ignoring audio data", time1, 0x12u);
  }
  if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0)&& dword_100095B40 <= 2&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100050DF8();
  }
}

uint64_t sub_10003A3B8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 32);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 152) == 1)
    {
      v3 = result;
      if (*(_DWORD *)(result + 40))
      {
        result = *(_QWORD *)(v1 + 24);
        if (result)
        {
          result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
          v2 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 32);
        }
        *(_DWORD *)(v2 + 152) = 2;
      }
    }
  }
  return result;
}

double sub_10003A418(double a1, float a2)
{
  return a2;
}

double sub_10003A438@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 8) = a3;
  return (float)((float)a1 / (float)a2);
}

void sub_10003A450(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

char *sub_10003A6E0(int a1)
{
  unint64_t v1;
  char *v2;

  v1 = dword_100095CCC++;
  v2 = (char *)&unk_100095C98 + 5 * (v1 % 0xA);
  *v2 = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  v2[4] = 0;
  return v2;
}

uint64_t sub_10003A740(char *a1)
{
  return (a1[1] << 16) | (*a1 << 24) | (a1[2] << 8) | a1[3];
}

uint64_t sub_10003B300(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
  objc_msgSend(v2, "stopCaptureForDelegate:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
  objc_msgSend(*(id *)(a1 + 32), "reportSummaryEvent:recordedFileSize:", 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "invalidateConnection");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 432);
  *(_QWORD *)(v3 + 432) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

id sub_10003BA04(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startCaptureWithHandler:", *(_QWORD *)(a1 + 40));
}

void sub_10003BBE4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005119C();
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446466;
      v8 = "-[RPBroadcastSession startCaptureWithHandler:]_block_invoke";
      v9 = 1024;
      v10 = 244;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d startCapture has started successfully", (uint8_t *)&v7, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }

}

id sub_10003BE94(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "recordingDidPause");
}

uint64_t sub_10003C030(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10003C03C(id a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    v3 = 1024;
    v4 = 275;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying extension of resume", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10003C408(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_10003C460(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "disableBroadcast");
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]_block_invoke";
    v6 = 1024;
    v7 = 299;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connection to extensions ready", (uint8_t *)&v4, 0x12u);
  }

}

void sub_10003C54C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleBroadcastServiceInfo:", v3);

}

void sub_10003C594(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleBroadcastURL:", v3);

}

void sub_10003C5DC(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleBroadcastError:", v3);

}

id sub_10003C798(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "showAlertForBroadcastSessionWithError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5804, 0, 0);
}

void sub_10003C998(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  v4 = objc_alloc((Class)NSKeyedUnarchiver);
  v5 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  v6 = objc_msgSend(v4, "initForReadingFromData:error:", v5, &v17);
  v7 = v17;
  v8 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(RPBroadcastConfiguration), NSKeyedArchiveRootObjectKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 384);
  *(_QWORD *)(v10 + 384) = v3;
  v12 = v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 392), *(id *)(a1 + 48));
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 448);
  *(_QWORD *)(v13 + 448) = v9;
  v15 = v9;

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 424) = 1;
  v16 = *(_QWORD *)(a1 + 40) + 400;
  *(_QWORD *)(v16 + 16) = kCMTimeZero.epoch;
  *(_OWORD *)v16 = *(_OWORD *)&kCMTimeZero.value;
  objc_msgSend(*(id *)(a1 + 40), "setupDispatchLimits");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_10003CC3C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 && objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003CD30;
    v10[3] = &unk_1000814B8;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    +[NSExtension extensionsWithMatchingPointName:baseIdentifier:unwantedActivationRule:completion:](NSExtension, "extensionsWithMatchingPointName:baseIdentifier:unwantedActivationRule:completion:", CFSTR("com.apple.broadcast-services"), v9, CFSTR("NSExtensionActivationSupportsReplayKitStreaming"), v10);

  }
}

void sub_10003CD30(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    if (!a3)
    {
      v9 = v5;
      v7 = objc_msgSend(v5, "count");
      v6 = v9;
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        v6 = v9;
      }
    }
  }

}

void sub_10003CDE4(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.replaykit.BroadcastSessionDispatchQueue", 0);
  v2 = (void *)qword_100095CD0;
  qword_100095CD0 = (uint64_t)v1;

}

void sub_10003CF5C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100051218(a1, (uint64_t)v3);
  objc_msgSend(*(id *)(a1 + 40), "notifyClientSessionDidStopWithError:movieURL:showAlert:", objc_msgSend(*(id *)(a1 + 32), "code"), 0, 1);

}

id sub_10003DA64(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[7];

  v2 = a1[4];
  v1 = a1[5];
  v3 = *(void **)(v2 + 432);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003DAD0;
  v6[3] = &unk_100081CB8;
  v4 = a1[7];
  v6[5] = a1[6];
  v6[6] = v4;
  v6[4] = v2;
  return objc_msgSend(v3, "processPayload:completion:", v1, v6);
}

id sub_10003DAD0(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v5 = 136446722;
    v6 = "-[RPBroadcastSession notifyExtensionOfAudioSampleBuffer:withType:]_block_invoke_2";
    v7 = 1024;
    v8 = 629;
    v9 = 2048;
    v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending %ld audio payload to broadcast extension...", (uint8_t *)&v5, 0x1Cu);
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchCompleted:", *(_QWORD *)(a1 + 40));
}

id sub_10003DED4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[7];

  v2 = a1[4];
  v1 = a1[5];
  v3 = *(void **)(v2 + 432);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DF40;
  v7[3] = &unk_100081CB8;
  v4 = a1[6];
  v5 = a1[7];
  v7[4] = v2;
  v7[5] = v4;
  v7[6] = v5;
  return objc_msgSend(v3, "processPayload:completion:", v1, v7);
}

id sub_10003DF40(uint64_t a1)
{
  const void *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPBroadcastSession notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:]_block_invoke_2";
    v6 = 1024;
    v7 = 679;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending video payload to broadcast extension...", (uint8_t *)&v4, 0x12u);
  }
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchCompleted:", *(_QWORD *)(a1 + 48));
}

uint64_t sub_10003E320(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t sub_10003E32C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003E374(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.replaykit.broadcastSession.AudioSampleQueue", v4);
  v3 = (void *)qword_100095CE0;
  qword_100095CE0 = (uint64_t)v2;

}

void sub_10003E408(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.replaykit.broadcastSession.VideoSampleQueue", v4);
  v3 = (void *)qword_100095CF0;
  qword_100095CF0 = (uint64_t)v2;

}

void sub_10003E684(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPBroadcastSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    v8 = 1024;
    v9 = 810;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3)
    v4 = 3;
  else
    v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void sub_10003EA94(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5801, 0, 0);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]_block_invoke";
    v3 = 1024;
    v4 = 841;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10003EC98(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5807, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPBroadcastSession handleDisplayWarning]_block_invoke";
    v3 = 1024;
    v4 = 854;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10003EF74(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5802, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPBroadcastSession handleDeviceRestrictionWarning]_block_invoke";
    v3 = 1024;
    v4 = 883;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10003F178(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5804, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPBroadcastSession handleResumeContextIDFailure]_block_invoke";
    v3 = 1024;
    v4 = 895;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

__CFData *sub_10003F358(CGImage *a1, void *a2, void *a3, BOOL *a4)
{
  const __CFDictionary *v7;
  __CFString *v8;
  __CFData *v9;
  CGImageDestination *v10;

  v7 = a2;
  v8 = a3;
  v9 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  *a4 = 0;
  v10 = CGImageDestinationCreateWithData(v9, v8, 1uLL, 0);

  if (v10)
  {
    CGImageDestinationAddImage(v10, a1, v7);
    *a4 = CGImageDestinationFinalize(v10);
    CFRelease(v10);
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100051638();
  }

  return v9;
}

void sub_10003F9A4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005181C();
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v5));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 384);
    *(_QWORD *)(v9 + 384) = v8;

    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446722;
      v12 = "-[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]_block_invoke";
      v13 = 1024;
      v14 = 64;
      v15 = 2112;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connect to angel, sessionID=%@", (uint8_t *)&v11, 0x1Cu);
    }
  }

}

void sub_10003FB04(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPSystemRecordSession: startWriting for movie writer has failed. Error: %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(v6, "microphoneEnabled");
    objc_msgSend(*(id *)(a1 + 32), "windowSize");
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contextID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v12));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003FCD4;
    v15[3] = &unk_100081390;
    v14 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v14;
    objc_msgSend(v5, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:mixedRealityCamera:didStartHandler:", v6, 0xFFFFFFFFLL, v7, 1, v13, 1, v9, v11, v15);

  }
}

void sub_10003FCD4(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  uint64_t v5;
  void (*v6)(void);
  void *v7;
  uint64_t v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPSystemRecordSession: startCapture has failed. Error: %@", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = *(void (**)(void))(v5 + 16);
LABEL_14:
      v6();
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPSystemRecordSession: startCapture has started successfully", (uint8_t *)&v9, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setUpStatusBarAssertionWithServiceName:", 0);
    objc_msgSend(*(id *)(a1 + 32), "checkAndPlaySystemSessionSound:", 1);
    if (objc_msgSend(*(id *)(a1 + 32), "cameraEnabled"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelProxy sharedInstance](RPAngelProxy, "sharedInstance"));
      objc_msgSend(v7, "enableCameraPip");

    }
    if (objc_msgSend(*(id *)(a1 + 32), "microphoneEnabled"))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 392) = 1;
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v6 = *(void (**)(void))(v8 + 16);
      goto LABEL_14;
    }
  }

}

void sub_1000400D4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v3, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "outputURL"));
  objc_msgSend(v4, "reportSummaryEvent:recordedFileSize:", v5, +[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v6));

  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005189C();
    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:](RPPhotosUtility, "showAlertFailedSaveToPhotosWithError:", v3);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_12:
      v8();
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446466;
      v11 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]_block_invoke";
      v12 = 1024;
      v13 = 180;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finishWritingAndSaveToCameraRoll encountered no error", (uint8_t *)&v10, 0x12u);
    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_12;
    }
  }

}

void sub_100040464(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v6, "code");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "outputURL"));
  objc_msgSend(v7, "reportSummaryEvent:recordedFileSize:", v8, +[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v9));

  if (v6)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100051998();
    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:](RPPhotosUtility, "showAlertFailedSaveToPhotosWithError:", v6);
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_12:
      v11();
    }
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136446466;
      v14 = "-[RPSystemRecordSession stopSystemRecordingWithURLHandler:]_block_invoke";
      v15 = 1024;
      v16 = 222;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d writing movie finished", (uint8_t *)&v13, 0x12u);
    }
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_12;
    }
  }

}

id *sub_1000409CC(id *result, opaqueCMSampleBuffer *a2)
{
  id *v3;
  int v4;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;

  v3 = result;
  v4 = *((_DWORD *)result + 12);
  switch(v4)
  {
    case 2:
      if ((objc_msgSend(result[4], "microphoneEnabled") & 1) == 0)
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a2);
        DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0, DataLength);
      }
      return (id *)objc_msgSend(*((id *)v3[4] + 47), "appendAudio2SampleBuffer:", a2);
    case 1:
      return (id *)objc_msgSend(*((id *)result[4] + 47), "appendAudio1SampleBuffer:", a2);
    case 0:
      return (id *)objc_msgSend(result[4], "processSampleBuffer:transformFlags:movieWriter:", a2, result[5], *((_QWORD *)result[4] + 47));
  }
  return result;
}

void sub_100040B20(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100051A14(a1, (uint64_t)v3);
  objc_msgSend(*(id *)(a1 + 40), "notifyClientSessionDidStopWithError:movieURL:showAlert:", objc_msgSend(*(id *)(a1 + 32), "code"), 0, 1);

}

void sub_100040BE4(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.replaykit.SystemRecordSessionDispatchQueue", 0);
  v2 = (void *)qword_100095D00;
  qword_100095D00 = (uint64_t)v1;

}

void sub_100040D34(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5806, 0, 0);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemRecordSession handleSystemAlertStop]_block_invoke";
    v3 = 1024;
    v4 = 338;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000411A0(uint64_t a1)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5805, 0));
  objc_msgSend(*(id *)(a1 + 32), "reportSessionEndReason:", v2);
  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5805, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    v5 = 1024;
    v6 = 360;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage", (uint8_t *)&v3, 0x12u);
  }

}

void sub_1000412A8(uint64_t a1)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5805, 0));
  objc_msgSend(*(id *)(a1 + 32), "reportSessionEndReason:", v2);
  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5805, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    v5 = 1024;
    v6 = 372;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage", (uint8_t *)&v3, 0x12u);
  }

}

void sub_1000413B0(uint64_t a1)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5805, 0));
  objc_msgSend(*(id *)(a1 + 32), "reportSessionEndReason:", v2);
  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5805, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    v5 = 1024;
    v6 = 381;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage", (uint8_t *)&v3, 0x12u);
  }

}

void sub_1000415DC(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5811, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemRecordSession handleIncomingCallWarning]_block_invoke";
    v3 = 1024;
    v4 = 395;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000417D0(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5806, 0, 0);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemRecordSession handleDeviceLockedWarning]_block_invoke";
    v3 = 1024;
    v4 = 407;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000419C4(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5802, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemRecordSession handleDeviceRestrictionWarning]_block_invoke";
    v3 = 1024;
    v4 = 419;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100041DF0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPSystemRecordSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    v8 = 1024;
    v9 = 448;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3)
    v4 = 3;
  else
    v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void sub_10004201C(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5804, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPSystemRecordSession handleResumeContextIDFailure]_block_invoke";
    v3 = 1024;
    v4 = 466;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10004267C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004269C(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000429F4;
  v21 = sub_100042A04;
  v22 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke";
    v25 = 1024;
    v26 = 45;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Start Save to Photos", buf, 0x12u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100042A0C;
  v14[3] = &unk_100082038;
  v15 = *(id *)(a1 + 32);
  v16 = &v17;
  v13 = 0;
  v3 = objc_msgSend(v2, "performChangesAndWait:error:", v14, &v13);
  v4 = v13;
  if (v3)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 136446722;
      v24 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke_2";
      v25 = 1024;
      v26 = 59;
      v27 = 2048;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds", buf, 0x1Cu);
    }
    v6 = ct_green_tea_logger_create_static("com.apple.ReplayKit");
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v6);
    v8 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
    v9 = v8;
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "<Photos>[Photos][com.apple.ReplayKit]: Saved screen recording.", buf, 2u);
    }

  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100051ABC((uint64_t)v4);
    v10 = objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5831, &__NSDictionary0__struct));

    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:](RPPhotosUtility, "showAlertFailedSaveToPhotosWithError:", v10);
    v4 = (id)v10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v11, "_srRemoveFile:completion:", *(_QWORD *)(a1 + 32), &stru_100082058);

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, uint64_t, double))(v12 + 16))(v12, v4, v18[5], *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  _Block_object_dispose(&v17, 8);
}

void sub_1000429CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000429F4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100042A04(uint64_t a1)
{

}

void sub_100042A0C(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[PHAssetCreationRequest creationRequestForAsset](PHAssetCreationRequest, "creationRequestForAsset"));
  v2 = objc_alloc_init((Class)PHAssetResourceCreationOptions);
  objc_msgSend(v2, "setShouldMoveFile:", 1);
  objc_msgSend(v7, "addResourceWithType:fileURL:options:", 2, *(_QWORD *)(a1 + 32), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderForCreatedAsset"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localIdentifier"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_100042AB0(id a1, NSError *a2)
{
  NSError *v2;

  v2 = a2;
  if (v2 && dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100051B5C();

}

void sub_100042BD4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (dword_100095B40 > 2 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      if (v5)
        goto LABEL_9;
      goto LABEL_5;
    }
    sub_100051BD4();
    if (!v5)
LABEL_5:
      v5 = *(id *)(a1 + 32);
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "+[RPPhotosUtility exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:]_block_invoke";
    v10 = 1024;
    v11 = 98;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Mixing video audio tracks completed", (uint8_t *)&v8, 0x12u);
  }
LABEL_9:
  if (*(id *)(a1 + 32) != v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v7, "_srRemoveFile:completion:", *(_QWORD *)(a1 + 32), &stru_1000820A0);

  }
  +[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:](RPPhotosUtility, "exportVideoToPhotosLibrary:completionHandler:", v5, *(_QWORD *)(a1 + 40));

}

void sub_100042D48(id a1, NSError *a2)
{
  NSError *v2;

  v2 = a2;
  if (v2 && dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100051C4C();

}

const __CFString *sub_1000431C4(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Invalid type");
  else
    return *(&off_100082180 + (int)a1);
}

void sub_10004376C(uint64_t a1)
{
  const __CFArray *SampleAttachmentsArray;
  const __CFDictionary *ValueAtIndex;
  _BOOL8 v4;
  void *value;

  SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)(a1 + 40), 1u);
  if (CFArrayGetCount(SampleAttachmentsArray))
  {
    value = 0;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
    if (CFDictionaryGetValueIfPresent(ValueAtIndex, kCMSampleAttachmentKey_NotSync, (const void **)&value))
      v4 = CFBooleanGetValue((CFBooleanRef)value) == 0;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "updateLatestSampleTime:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addFrameToBuffer:isKeyFrame:", *(_QWORD *)(a1 + 40), v4);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_100043940(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateLatestSampleTime:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addFrameToBuffer:isKeyFrame:", *(_QWORD *)(a1 + 40), 1);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_100043AAC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateLatestSampleTime:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addFrameToBuffer:isKeyFrame:", *(_QWORD *)(a1 + 40), 1);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_100043D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100043DAC(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  const __CFString *v7;
  uint64_t v8;
  opaqueCMSampleBuffer *v9;
  opaqueCMSampleBuffer *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  const __CFString *v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  const __CFString *v23;
  __int128 v24;
  CMTime v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[28];

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(int *)(a1 + 80);
    if (v2 > 2)
      v3 = CFSTR("Invalid type");
    else
      v3 = *(&off_100082180 + v2);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 1;
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 136447234;
    v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
    v28 = 1024;
    v29 = 170;
    v30 = 2112;
    *(_QWORD *)v31 = v3;
    *(_WORD *)&v31[8] = 2048;
    *(_QWORD *)&v31[10] = v4;
    *(_WORD *)&v31[18] = 2048;
    *(_QWORD *)&v31[20] = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@ block start, sample %lu out of %lu", buf, 0x30u);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
  {
    *(_QWORD *)&v6 = 136446722;
    v24 = v6;
    v7 = CFSTR("Invalid type");
    do
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (*(_BYTE *)(v8 + 24))
        break;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                                + 8)
                                                                                    + 24))
      {
        *(_BYTE *)(v8 + 24) = 1;
      }
      else
      {
        v9 = (opaqueCMSampleBuffer *)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
        v10 = v9;
        v11 = *(_QWORD *)(a1 + 48);
        if (!*(_BYTE *)(v11 + 112))
        {
          v12 = *(void **)(v11 + 80);
          CMSampleBufferGetPresentationTimeStamp(&v25, v9);
          objc_msgSend(v12, "startSessionAtSourceTime:", &v25);
          *(float *)(*(_QWORD *)(a1 + 48) + 116) = sub_100047668(v10);
          *(_BYTE *)(*(_QWORD *)(a1 + 48) + 112) = 1;
        }
        if (sub_100047668(v10) >= *(float *)(*(_QWORD *)(a1 + 48) + 116))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "appendSampleBuffer:", v10) ^ 1;
          if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 0;
            v14 = *(int *)(a1 + 80);
            v15 = v7;
            if (v14 <= 2)
              v7 = *(&off_100082180 + v14);
            v16 = sub_100047668(v10);
            *(_DWORD *)buf = 136447234;
            v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
            v28 = 1024;
            v29 = 187;
            v30 = 1024;
            *(_DWORD *)v31 = v13;
            *(_WORD *)&v31[4] = 2112;
            *(_QWORD *)&v31[6] = v7;
            *(_WORD *)&v31[14] = 2048;
            *(double *)&v31[16] = v16;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d did complete:%d append %@ sample with timestamp:%lf", buf, 0x2Cu);
            v7 = v15;
          }
        }
        v17 = *(_QWORD *)(a1 + 56);
        if (*(_BYTE *)(a1 + 84) && !*(_QWORD *)(*(_QWORD *)(v17 + 8) + 24))
        {
          if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
            v28 = 1024;
            v29 = 192;
            v30 = 2048;
            *(_QWORD *)v31 = v10;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d releasing idle video sample %p", buf, 0x1Cu);
          }
          CFRelease(v10);
          v17 = *(_QWORD *)(a1 + 56);
        }
        ++*(_QWORD *)(*(_QWORD *)(v17 + 8) + 24);
      }
    }
    while ((objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData", v24) & 1) != 0);
  }
  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(int *)(a1 + 80);
    if (v18 > 2)
      v19 = CFSTR("Invalid type");
    else
      v19 = *(&off_100082180 + v18);
    v20 = objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData", v24);
    v21 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 136447234;
    v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
    v28 = 1024;
    v29 = 201;
    v30 = 2112;
    *(_QWORD *)v31 = v19;
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = v20;
    *(_WORD *)&v31[14] = 1024;
    *(_DWORD *)&v31[16] = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@ block isReady: %d, completedOrFailed: %d", buf, 0x28u);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 32));
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(int *)(a1 + 80);
      if (v22 > 2)
        v23 = CFSTR("Invalid type");
      else
        v23 = *(&off_100082180 + v22);
      *(_DWORD *)buf = 136446722;
      v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
      v28 = 1024;
      v29 = 206;
      v30 = 2112;
      *(_QWORD *)v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finished appending %@ samples", buf, 0x1Cu);
    }
  }
}

void sub_100044410(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE v5[24];

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v5 = 136446466;
    *(_QWORD *)&v5[4] = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]_block_invoke";
    *(_WORD *)&v5[12] = 1024;
    *(_DWORD *)&v5[14] = 214;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finish asset writing", v5, 0x12u);
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  *(_OWORD *)v5 = *(_OWORD *)(a1 + 48);
  *(_QWORD *)&v5[16] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "endSessionAtSourceTime:", v5);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "finishWriting") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "error"));
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100051DDC((uint64_t)v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5823, 0));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id sub_1000446AC(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "flushBuffer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "flushBuffer");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "flushBuffer");
}

void sub_100044BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100044C34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100044C44(uint64_t a1)
{

}

void sub_100044C4C(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1[4] + 8), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend(*(id *)(a1[4] + 24), "copy");
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void sub_100044CC4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPClipWriter exportClipToURL:duration:completionHandler:]_block_invoke_2";
    v7 = 1024;
    v8 = 262;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d flushing copied buffers and calling completion handler", (uint8_t *)&v5, 0x12u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "flushBuffer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "flushBuffer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "flushBuffer");
  v4 = a1[4];
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void sub_100044E1C(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.replaykit.ClipWriterDispatchQueue", 0);
  v2 = (void *)qword_100095D10;
  qword_100095D10 = (uint64_t)v1;

}

void sub_1000452CC(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startCapture has failed. Error: %@", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = *(void (**)(void))(v5 + 16);
LABEL_10:
      v6();
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startCapture has started successfully", (uint8_t *)&v8, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v6 = *(void (**)(void))(v7 + 16);
      goto LABEL_10;
    }
  }

}

void sub_100045730(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.replaykit.CaptureSessionDispatchQueue", 0);
  v2 = (void *)qword_100095D20;
  qword_100095D20 = (uint64_t)v1;

}

void sub_1000458A0(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100051F1C(a1, (uint64_t)v3);
  objc_msgSend(*(id *)(a1 + 40), "notifyClientSessionDidStopWithError:movieURL:showAlert:", objc_msgSend(*(id *)(a1 + 32), "code"), 0, 1);

}

void sub_100045BD8(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5807, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPCaptureSession handleDisplayWarning]_block_invoke";
    v3 = 1024;
    v4 = 250;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100045EB4(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5802, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPCaptureSession handleDeviceRestrictionWarning]_block_invoke";
    v3 = 1024;
    v4 = 279;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000460B8(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5804, 0, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPCaptureSession handleResumeContextIDFailure]_block_invoke";
    v3 = 1024;
    v4 = 291;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10004638C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPCaptureSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    v8 = 1024;
    v9 = 304;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3)
    v4 = 3;
  else
    v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t start()
{
  void *v0;
  void *v1;
  uint8_t v3[16];

  if ((_set_user_dir_suffix("com.apple.replayd") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100051FC8();
  }
  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "replayd Starting!", v3, 2u);
  }
  sub_1000247AC();
  objc_autoreleasePoolPop(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v1, "run");

  return 0xFFFFFFFFLL;
}

uint64_t sub_100046738(uint64_t result)
{
  if (result <= 3)
    dword_100095B40 = result;
  return result;
}

void sub_10004678C(id a1)
{
  RPFeatureFlagUtility *v1;
  void *v2;

  v1 = objc_alloc_init(RPFeatureFlagUtility);
  v2 = (void *)qword_100095D30;
  qword_100095D30 = (uint64_t)v1;

}

CMSampleBufferRef sub_100046960(IOSurfaceRef surface, const CMSampleTimingInfo *a2)
{
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CVPixelBufferRef pixelBufferOut;
  CMSampleBufferRef sampleBufferOut;

  pixelBufferOut = 0;
  sampleBufferOut = 0;
  formatDescriptionOut = 0;
  CVPixelBufferCreateWithIOSurface(kCFAllocatorDefault, surface, 0, &pixelBufferOut);
  CMVideoFormatDescriptionCreateForImageBuffer(0, pixelBufferOut, &formatDescriptionOut);
  CMSampleBufferCreateForImageBuffer(kCFAllocatorDefault, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, a2, &sampleBufferOut);
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  return sampleBufferOut;
}

CMSampleBufferRef sub_1000469F8(CVImageBufferRef imageBuffer, uint64_t a2)
{
  __int128 v3;
  CMTimeEpoch epoch;
  __int128 v5;
  CMTimeEpoch v6;
  OSStatus v7;
  CMSampleBufferRef result;
  CMSampleTimingInfo v9;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef sampleBufferOut;

  sampleBufferOut = 0;
  formatDescriptionOut = 0;
  v3 = *(_OWORD *)&kCMTimingInfoInvalid.decodeTimeStamp.value;
  *(_OWORD *)&v9.presentationTimeStamp.timescale = *(_OWORD *)&kCMTimingInfoInvalid.presentationTimeStamp.timescale;
  *(_OWORD *)&v9.decodeTimeStamp.value = v3;
  epoch = kCMTimingInfoInvalid.decodeTimeStamp.epoch;
  v5 = *(_OWORD *)&kCMTimingInfoInvalid.duration.epoch;
  *(_OWORD *)&v9.duration.value = *(_OWORD *)&kCMTimingInfoInvalid.duration.value;
  *(_OWORD *)&v9.duration.epoch = v5;
  *(_OWORD *)&v9.presentationTimeStamp.value = *(_OWORD *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  v9.decodeTimeStamp.epoch = epoch;
  v9.presentationTimeStamp.epoch = v6;
  if (!CMVideoFormatDescriptionCreateForImageBuffer(kCFAllocatorDefault, imageBuffer, &formatDescriptionOut))
  {
    v7 = CMSampleBufferCreateReadyWithImageBuffer(kCFAllocatorDefault, imageBuffer, formatDescriptionOut, &v9, &sampleBufferOut);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    if (!v7)
      return sampleBufferOut;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10005204C();
  result = sampleBufferOut;
  if (sampleBufferOut)
  {
    CFRelease(sampleBufferOut);
    return 0;
  }
  return result;
}

CMSampleBufferRef sub_100046AF8(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  CMSampleTimingInfo *v4;
  CMItemCount v5;
  CMTime *p_decodeTimeStamp;
  __int128 v7;
  CMTimeEpoch epoch;
  CMItemCount v9;
  CMTimeEpoch v10;
  CMItemCount numSampleTimingEntries;
  CMSampleBufferRef sampleBufferOut;

  numSampleTimingEntries = 0;
  sampleBufferOut = 0;
  CMSampleBufferGetSampleTimingInfoArray(a1, 0, 0, &numSampleTimingEntries);
  if ((unint64_t)numSampleTimingEntries >= 0x38E38E38E38E38FLL)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000520C8();
    return 0;
  }
  else
  {
    v4 = (CMSampleTimingInfo *)malloc_type_malloc(72 * numSampleTimingEntries, 0x1000040FF89C88EuLL);
    CMSampleBufferGetSampleTimingInfoArray(a1, numSampleTimingEntries, v4, &numSampleTimingEntries);
    v5 = numSampleTimingEntries;
    if (numSampleTimingEntries >= 1)
    {
      p_decodeTimeStamp = &v4->decodeTimeStamp;
      v7 = *(_OWORD *)&kCMTimeInvalid.value;
      epoch = kCMTimeInvalid.epoch;
      v9 = numSampleTimingEntries;
      do
      {
        *(_OWORD *)&p_decodeTimeStamp->value = v7;
        p_decodeTimeStamp->epoch = epoch;
        v10 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)&p_decodeTimeStamp[-1].value = *(_OWORD *)a2;
        p_decodeTimeStamp[-1].epoch = v10;
        p_decodeTimeStamp += 3;
        --v9;
      }
      while (v9);
    }
    CMSampleBufferCreateCopyWithNewTiming(kCFAllocatorDefault, a1, v5, v4, &sampleBufferOut);
    free(v4);
    return sampleBufferOut;
  }
}

id sub_100046C34(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  AudioBufferList *v6;
  id v7;
  unint64_t v8;
  void **p_mData;
  uint64_t v10;
  void *v11;
  const opaqueCMFormatDescription *FormatDescription;
  NSData *v13;
  void *v14;
  void *v15;
  NSNumber *v16;
  void *v17;
  CMSampleTimingInfo v19;
  size_t bufferListSizeNeededOut;
  CMBlockBufferRef blockBufferOut;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a2));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("RPBroadcastProcessExtensionPayloadKeySampleType"));

  blockBufferOut = 0;
  bufferListSizeNeededOut = 0;
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, &bufferListSizeNeededOut, 0, 0, 0, 0, 0, &blockBufferOut);
  v6 = (AudioBufferList *)malloc_type_malloc(bufferListSizeNeededOut, 0x256FBE5uLL);
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, 0, v6, bufferListSizeNeededOut, 0, 0, 0, &blockBufferOut);
  v7 = objc_alloc_init((Class)NSMutableData);
  if (v6->mNumberBuffers)
  {
    v8 = 0;
    p_mData = &v6->mBuffers[0].mData;
    do
    {
      v10 = *((unsigned int *)p_mData - 1);
      v11 = *p_mData;
      p_mData += 2;
      objc_msgSend(v7, "appendBytes:length:", v11, v10);
      ++v8;
    }
    while (v8 < v6->mNumberBuffers);
  }
  free(v6);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("RPBroadcastProcessExtensionPayloadKeyAudioBufferList"));
  FormatDescription = CMSampleBufferGetFormatDescription(a1);
  v13 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription), 40);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"));
  memset(&v19, 0, sizeof(v19));
  CMSampleBufferGetSampleTimingInfo(a1, 0, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v19, 72));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("RPBroadcastProcessExtensionPayloadKeyTimingInfo"));
  v16 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", CMSampleBufferGetNumSamples(a1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("RPBroadcastProcessExtensionPayloadKeyNumSamples"));

  if (blockBufferOut)
    CFRelease(blockBufferOut);

  return v4;
}

CMSampleBufferRef sub_100046E54(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const AudioStreamBasicDescription *StreamBasicDescription;
  void *v7;
  size_t v8;
  char *v9;
  UInt32 mChannelsPerFrame;
  void *v11;
  CMSampleBufferRef v12;
  AudioStreamBasicDescription asbd;
  CMSampleTimingInfo sampleTimingArray;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef v17;

  formatDescriptionOut = 0;
  v17 = 0;
  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyNumSamples")));
  v3 = objc_msgSend(v2, "integerValue");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyTimingInfo")));
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  objc_msgSend(v4, "getBytes:length:", &sampleTimingArray, 72);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription")));
  memset(&asbd, 0, sizeof(asbd));
  objc_msgSend(v5, "getBytes:length:", &asbd, 40);
  CMAudioFormatDescriptionCreate(kCFAllocatorDefault, &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(formatDescriptionOut);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyAudioBufferList")));

  if (objc_msgSend(v7, "length"))
  {
    v8 = (size_t)objc_msgSend(v7, "length");
    v9 = (char *)malloc_type_malloc(v8, 0x8CE1C984uLL);
    memcpy(v9, objc_msgSend(objc_retainAutorelease(v7), "bytes"), v8);
    if (v9)
    {
      mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      if (mChannelsPerFrame == 1 || (StreamBasicDescription->mFormatFlags & 0x20) == 0)
      {
        v11 = malloc_type_malloc(0x18uLL, 0x10800404ACF7207uLL);
        *(_DWORD *)v11 = 1;
        *((_DWORD *)v11 + 3) = v8;
        *((_DWORD *)v11 + 2) = StreamBasicDescription->mChannelsPerFrame;
        *((_QWORD *)v11 + 2) = v9;
        goto LABEL_13;
      }
      if (mChannelsPerFrame == 2)
      {
        v11 = malloc_type_malloc(0x28uLL, 0xF3B2E1ECuLL);
        *(_DWORD *)v11 = 2;
        *((_DWORD *)v11 + 2) = 1;
        *((_DWORD *)v11 + 3) = v8 >> 1;
        *((_QWORD *)v11 + 2) = v9;
        *((_DWORD *)v11 + 6) = 1;
        *((_DWORD *)v11 + 7) = v8 >> 1;
        *((_QWORD *)v11 + 4) = &v9[v8 >> 1];
        goto LABEL_13;
      }
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100052144();
      free(v9);
    }
  }
  v11 = 0;
LABEL_13:
  CMSampleBufferCreate(kCFAllocatorDefault, 0, 0, 0, 0, formatDescriptionOut, (CMItemCount)v3, 1, &sampleTimingArray, 0, 0, &v17);
  CMSampleBufferSetDataBufferFromAudioBufferList(v17, kCFAllocatorDefault, kCFAllocatorDefault, 0, (const AudioBufferList *)v11);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  if (v11)
  {
    free(*((void **)v11 + 2));
    free(v11);
  }
  v12 = v17;

  return v12;
}

CMSampleBufferRef sub_100047114(CMTime *a1, uint64_t a2, Float64 a3)
{
  __int128 v5;
  const opaqueCMFormatDescription *v6;
  const AudioStreamBasicDescription *StreamBasicDescription;
  unsigned int mFramesPerPacket;
  const opaqueCMFormatDescription *mBytesPerPacket;
  CMItemCount v10;
  Float64 mSampleRate;
  CMSampleBufferRef result;
  CMSampleTimingInfo v13;
  AudioStreamBasicDescription asbd;
  CMSampleBufferRef v15;
  CMAudioFormatDescriptionRef formatDescriptionOut;

  v15 = 0;
  formatDescriptionOut = 0;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&asbd.mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)&asbd.mBytesPerPacket = v5;
  *(_QWORD *)&asbd.mBitsPerChannel = *(_QWORD *)(a2 + 32);
  if (CMAudioFormatDescriptionCreate(kCFAllocatorDefault, &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005242C();
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    v6 = 0;
  }
  else
  {
    v6 = formatDescriptionOut;
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v6);
  formatDescriptionOut = 0;
  mFramesPerPacket = StreamBasicDescription->mFramesPerPacket;
  if (!mFramesPerPacket)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000521C0();
LABEL_27:
    mSampleRate = 0.0;
    if (!v6)
      goto LABEL_42;
    goto LABEL_41;
  }
  mBytesPerPacket = (const opaqueCMFormatDescription *)StreamBasicDescription->mBytesPerPacket;
  formatDescriptionOut = mBytesPerPacket;
  if ((_DWORD)mBytesPerPacket != StreamBasicDescription->mBytesPerFrame * mFramesPerPacket)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000523B0();
    goto LABEL_27;
  }
  v10 = (unint64_t)(a3 * 44100.0 / (double)mFramesPerPacket);
  asbd.mSampleRate = 0.0;
  if (CMBlockBufferCreateWithMemoryBlock(kCFAllocatorDefault, 0, (_QWORD)mBytesPerPacket * v10, kCFAllocatorDefault, 0, 0, (_QWORD)mBytesPerPacket * v10, 0, (CMBlockBufferRef *)&asbd))
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100052334();
  }
  else
  {
    if (!CMBlockBufferAssureBlockMemory(*(CMBlockBufferRef *)&asbd.mSampleRate))
    {
      mSampleRate = asbd.mSampleRate;
      goto LABEL_8;
    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000522B8();
  }
  if (*(_QWORD *)&asbd.mSampleRate)
    CFRelease(*(CFTypeRef *)&asbd.mSampleRate);
  mSampleRate = 0.0;
LABEL_8:
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&v13.duration, a3, 44100);
  v13.presentationTimeStamp = *a1;
  v13.decodeTimeStamp = kCMTimeInvalid;
  if (!CMSampleBufferCreate(kCFAllocatorDefault, *(CMBlockBufferRef *)&mSampleRate, 1u, 0, 0, v6, v10, 1, &v13, 1, (const size_t *)&formatDescriptionOut, &v15))
  {
    if (v6)
      CFRelease(v6);
    if (mSampleRate != 0.0)
      CFRelease(*(CFTypeRef *)&mSampleRate);
    return v15;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005223C();
    if (!v6)
      goto LABEL_42;
    goto LABEL_41;
  }
  if (v6)
LABEL_41:
    CFRelease(v6);
LABEL_42:
  if (mSampleRate != 0.0)
    CFRelease(*(CFTypeRef *)&mSampleRate);
  result = v15;
  if (v15)
  {
    CFRelease(v15);
    return 0;
  }
  return result;
}

CMSampleBufferRef sub_100047478(uint64_t a1, const AudioStreamBasicDescription *a2, CMTime *a3)
{
  unsigned int v5;
  UInt32 mBytesPerPacket;
  OSStatus v7;
  CMSampleBufferRef v8;
  CMTime presentationTimeStamp;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef sbuf;

  formatDescriptionOut = 0;
  sbuf = 0;
  v5 = *(_DWORD *)(a1 + 12);
  mBytesPerPacket = a2->mBytesPerPacket;
  if (CMAudioFormatDescriptionCreate(kCFAllocatorDefault, a2, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000525A0();
  }
  else
  {
    presentationTimeStamp = *a3;
    v7 = CMAudioSampleBufferCreateWithPacketDescriptions(kCFAllocatorDefault, 0, 0, 0, 0, formatDescriptionOut, v5 / mBytesPerPacket, &presentationTimeStamp, 0, &sbuf);
    CFRelease(formatDescriptionOut);
    if (v7)
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100052524();
    }
    else
    {
      if (!CMSampleBufferSetDataBufferFromAudioBufferList(sbuf, kCFAllocatorDefault, kCFAllocatorDefault, 0, (const AudioBufferList *)a1))
      {
        v8 = sbuf;
        presentationTimeStamp = *a3;
        CMSampleBufferSetOutputPresentationTimeStamp(sbuf, &presentationTimeStamp);
        return v8;
      }
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000524A8();
    }
  }
  if (sbuf)
    CFRelease(sbuf);
  return 0;
}

void sub_100047628(const void *a1, void **a2)
{
  if (a1)
    CFRelease(a1);
  if (a2)
  {
    free(a2[2]);
    free(a2);
  }
}

float sub_100047668(opaqueCMSampleBuffer *a1)
{
  CMTime v2;

  if (!a1)
    return 0.0;
  memset(&v2, 0, sizeof(v2));
  CMSampleBufferGetPresentationTimeStamp(&v2, a1);
  return (float)v2.value / (float)v2.timescale;
}

CGImageRef sub_1000476B0(__IOSurface *a1)
{
  void *v2;
  CGImageRef v3;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  size_t AllocSize;
  CGColorSpace *DeviceRGB;
  CGDataProvider *v10;
  uint64_t v12;
  _UNKNOWN **v13;

  if (IOSurfaceGetPixelFormat(a1) == 1380411457)
  {
    v12 = kCGImageComponentTypeRequest;
    v13 = &off_100085C30;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v3 = (CGImageRef)CGImageCreateFromIOSurface(a1, v2);

  }
  else
  {
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(a1);
    BytesPerRow = IOSurfaceGetBytesPerRow(a1);
    Width = IOSurfaceGetWidth(a1);
    Height = IOSurfaceGetHeight(a1);
    AllocSize = IOSurfaceGetAllocSize(a1);
    CFRetain(a1);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v10 = CGDataProviderCreateWithData(a1, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_100047840);
    v3 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2002u, v10, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v10);
    CGColorSpaceRelease(DeviceRGB);
  }
  return v3;
}

void sub_100047840(__IOSurface *a1)
{
  IOSurfaceUnlock(a1, 0, 0);
  CFRelease(a1);
}

void sub_100048240(id a1)
{
  RPCaptureManager *v1;
  void *v2;

  v1 = objc_alloc_init(RPCaptureManager);
  v2 = (void *)qword_100095D48;
  qword_100095D48 = (uint64_t)v1;

}

_DWORD *sub_100048700(uint64_t a1, uint64_t a2)
{
  _DWORD *result;
  _QWORD v3[5];

  result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100048764;
    v3[3] = &unk_1000821F8;
    v3[4] = a2;
    return objc_msgSend(result, "callDelegate:", v3);
  }
  return result;
}

id sub_100048764(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didCaptureSampleWithType:withSampleBuffer:withTransformFlags:", 2, *(_QWORD *)(a1 + 32), 0);
}

void sub_100048778(uint64_t a1)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPCaptureManager startMicrophoneCaptureWithDispatchGroup:]_block_invoke_3";
    v4 = 1024;
    v5 = 99;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d mic capture started", (uint8_t *)&v2, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000489D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100048B0C(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "stopAppAudioCapture");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_DWORD *)(a1 + 40);
  v2 = +[RPAppAudioCaptureManager audioCaptureConfigForSystemRecording:processID:contextID:](RPAppAudioCaptureManager, "audioCaptureConfigForSystemRecording:processID:contextID:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned int *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v4 = v3;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = v3;
  if (v5)
    objc_msgSend(v5, "resumeWithConfig:", v2, v4);
  else

}

void sub_100048BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_100048E80(uint64_t a1)
{
  unsigned int v2;
  id v3;
  BOOL v4;
  int v5;
  int v6;
  char v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasDelegate:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 32), "delegateCount");
  if (v2)
    v4 = v3 == (id)1;
  else
    v4 = 0;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "stopAllCapture");
  }
  else if (dword_100095B40 <= 1)
  {
    v5 = (int)v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v9 = 136446978;
      v10 = "-[RPCaptureManager stopCaptureForDelegate:]_block_invoke";
      v11 = 1024;
      v12 = 189;
      v13 = 1024;
      v14 = v6;
      v15 = 1024;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d continue capture state %d with delegate count %d", (uint8_t *)&v9, 0x1Eu);
    }
  }
  if (dword_100095B40 > 1)
    v7 = 1;
  else
    v7 = v2;
  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPCaptureManager stopCaptureForDelegate:]_block_invoke";
    v11 = 1024;
    v12 = 192;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ignore stopping delegate that is not capturing", (uint8_t *)&v9, 0x12u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "removeDelegate:", *(_QWORD *)(a1 + 40));
}

void sub_1000492B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000492D0(uint64_t a1)
{
  NSObject *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "updateContextIDs:forProcessID:systemRecording:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 80), *(unsigned __int8 *)(a1 + 84));
  objc_msgSend(*(id *)(a1 + 32), "addDelegate:", *(_QWORD *)(a1 + 48));
  v2 = dispatch_group_create();
  v3 = *(_DWORD **)(a1 + 32);
  if (v3[18])
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v11 = 136446722;
      v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      v13 = 1024;
      v14 = 221;
      v15 = 2048;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d added capture delegate %p", (uint8_t *)&v11, 0x1Cu);
    }
  }
  else
  {
    if (dword_100095B40 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 48);
        v11 = 136446722;
        v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemReco"
              "rding:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
        v13 = 1024;
        v14 = 217;
        v15 = 2048;
        v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting capture for delegate %p", (uint8_t *)&v11, 0x1Cu);
      }
      v3 = *(_DWORD **)(a1 + 32);
    }
    objc_msgSend(v3, "startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:dispatchGroup:", *(unsigned int *)(a1 + 80), *(unsigned __int8 *)(a1 + 84), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 85), v2, *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  if (*(_BYTE *)(a1 + 86))
    objc_msgSend(*(id *)(a1 + 32), "startMicrophoneCaptureWithDispatchGroup:", v2);
  v6 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v2, v6))
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446466;
      v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      v13 = 1024;
      v14 = 246;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d start timeout", (uint8_t *)&v11, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "stopAllCapture");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446466;
      v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      v13 = 1024;
      v14 = 229;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d start success", (uint8_t *)&v11, 0x12u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v7 = os_transaction_create("com.apple.replayd.screen-capture");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 120);
    *(_QWORD *)(v8 + 120) = v7;

    if (*(_BYTE *)(a1 + 86))
      v10 = 2;
    else
      v10 = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = v10;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "stopAllCapture");
    }
  }

}

_DWORD *sub_1000497C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *result;
  _QWORD v4[6];

  result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100049824;
    v4[3] = &unk_100082268;
    v4[4] = a2;
    v4[5] = a3;
    return objc_msgSend(result, "callDelegate:", v4);
  }
  return result;
}

id sub_100049824(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didCaptureSampleWithType:withSampleBuffer:withTransformFlags:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_100049834(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPCaptureManager startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:di"
         "spatchGroup:]_block_invoke_3";
    v6 = 1024;
    v7 = 290;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d screen capture started ", (uint8_t *)&v4, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

_DWORD *sub_100049910(uint64_t a1, uint64_t a2)
{
  _DWORD *result;
  _QWORD v3[5];

  result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100049974;
    v3[3] = &unk_1000821F8;
    v3[4] = a2;
    return objc_msgSend(result, "callDelegate:", v3);
  }
  return result;
}

id sub_100049974(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didCaptureSampleWithType:withSampleBuffer:withTransformFlags:", 1, *(_QWORD *)(a1 + 32), 0);
}

void sub_100049988(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPCaptureManager startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:di"
         "spatchGroup:]_block_invoke_3";
    v6 = 1024;
    v7 = 311;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d app audio started ", (uint8_t *)&v4, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100049C6C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049CF4;
  block[3] = &unk_100080E00;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void sub_100049CF4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5806, 0));
  objc_msgSend(v1, "captureDidFailWithError:", v2);

}

void sub_100049E50(uint64_t a1)
{
  dispatch_group_t v2;

  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "startMicrophoneCaptureWithDispatchGroup:", v2);

}

id sub_10004A098(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "captureDidFailWithError:", *(_QWORD *)(a1 + 32));
}

id sub_10004A0A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAllCapture");
}

void sub_10004A6F4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v7, "code");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "outputURL"));
  objc_msgSend(v8, "reportSummaryEvent:recordedFileSize:", v9, +[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v10));

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 384), a2);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136446978;
    v13 = "-[RPRecordSession stopRecordingWithHandler:]_block_invoke";
    v14 = 1024;
    v15 = 111;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d movie writer finished writing with output: %@ and error: %@", (uint8_t *)&v12, 0x26u);
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v6, v7);

}

void sub_10004AAB0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (v3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100052810();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 384);
    *(_QWORD *)(v4 + 384) = 0;

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void sub_10004AB74(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.replaykit.RecordSessionDispatchQueue", 0);
  v2 = (void *)qword_100095D58;
  qword_100095D58 = (uint64_t)v1;

}

void sub_10004ACEC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned int *v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startWriting for movie writer has failed. Error: %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
    v6 = *(unsigned int **)(a1 + 32);
    v7 = v6[2];
    v8 = objc_msgSend(v6, "microphoneEnabled");
    objc_msgSend(*(id *)(a1 + 32), "windowSize");
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contextID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v13));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004AEC4;
    v16[3] = &unk_100081390;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v5, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:", v6, v7, v8, 0, v14, v16, v10, v12);

  }
}

void sub_10004AEC4(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;

  v3 = a2;
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startCapture has failed. Error: %@", (uint8_t *)&v10, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 3);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = *(void (**)(void))(v5 + 16);
LABEL_10:
      v6();
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startCapture has started successfully", (uint8_t *)&v10, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 384);
    *(_QWORD *)(v7 + 384) = 0;

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v6 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }

}

id *sub_10004B090(id *result, opaqueCMSampleBuffer *a2)
{
  id *v3;
  int v4;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;

  v3 = result;
  v4 = *((_DWORD *)result + 12);
  switch(v4)
  {
    case 2:
      if ((objc_msgSend(result[4], "microphoneEnabled") & 1) == 0)
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a2);
        DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0, DataLength);
      }
      return (id *)objc_msgSend(*((id *)v3[4] + 47), "appendAudio2SampleBuffer:", a2);
    case 1:
      return (id *)objc_msgSend(*((id *)result[4] + 47), "appendAudio1SampleBuffer:", a2);
    case 0:
      return (id *)objc_msgSend(result[4], "processSampleBuffer:transformFlags:movieWriter:", a2, result[5], *((_QWORD *)result[4] + 47));
  }
  return result;
}

void sub_10004B1E4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000528A4(a1, (uint64_t)v6);
  objc_msgSend(*(id *)(a1 + 40), "notifyClientSessionDidStopWithError:movieURL:showAlert:", objc_msgSend(*(id *)(a1 + 32), "code"), v5, 1);

}

void sub_10004B48C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;

  v3 = a2;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPRecordSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    v8 = 1024;
    v9 = 286;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3)
    v4 = 3;
  else
    v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void sub_10004B8AC(uint64_t a1, uint64_t a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5807, a2, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPRecordSession handleDisplayWarning]_block_invoke";
    v4 = 1024;
    v5 = 321;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v2, 0x12u);
  }
}

void sub_10004BB88(uint64_t a1, uint64_t a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5802, a2, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPRecordSession handleDeviceRestrictionWarning]_block_invoke";
    v4 = 1024;
    v5 = 350;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v2, 0x12u);
  }
}

void sub_10004BD8C(uint64_t a1, uint64_t a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "notifyClientSessionDidStopWithError:movieURL:showAlert:", -5804, a2, 1);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPRecordSession handleResumeContextIDFailure]_block_invoke";
    v4 = 1024;
    v5 = 362;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v2, 0x12u);
  }
}

void sub_10004BE9C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error creating temp directory", v0, 2u);
  sub_10000541C();
}

void sub_10004BEDC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v1, "error in _rkRemoveFile_srDeleteFilesOlderThanTimeToLiveInSeconds, error code: %i", v2, v3, v4, v5, 0);
  sub_10000541C();
}

void sub_10004BF4C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v1, "_rkRemoveFile error: %i", v2, v3, v4, v5, 0);
  sub_10000541C();
}

void sub_10004BFBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, a3, "_rkMoveFileFromURL error: %i", a5, a6, a7, a8, 0);
  sub_10000541C();
}

void sub_10004C028(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "_rkDeleteFilesWithPrefix error: %i", buf, 8u);
}

void sub_10004C070()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  v0 = 136446466;
  v1 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
  v2 = 1024;
  v3 = 64;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d nil sample buffer", (uint8_t *)&v0, 0x12u);
}

void sub_10004C104(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = sub_100007258(a1);
  if (dword_100095B40 <= 2 && sub_100007250(&_os_log_default))
  {
    sub_100007230();
    sub_100007220((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d AVCaptureSession removeObserver failed", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
  sub_100007244();
}

void sub_10004C1C0(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = sub_100007258(a1);
  if (dword_100095B40 <= 2 && sub_100007250(&_os_log_default))
  {
    sub_100007230();
    sub_100007220((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d removeObserver failed", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
  sub_100007244();
}

void sub_10004C27C(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = sub_100007258(a1);
  if (dword_100095B40 <= 2 && sub_100007250(&_os_log_default))
  {
    sub_100007230();
    sub_100007220((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d AVCaptureSession removeObserver failed]", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
  sub_100007244();
}

void sub_10004C338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error deleting file", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004C3B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d asset writer in INCORRECT state, failing to save file", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004C430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d first sample buffer was not processed or appended", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004C4AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error in initial finish writing: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004C528()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error=%@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004C5A4(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "error"));
  objc_msgSend(v1, "code");
  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d Export Trim Video Failed, due to error: %i", v3, v4, v5, v6, 2u);

  sub_10000BDA4();
}

void sub_10004C640(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000BDAC(a1, __stack_chk_guard);
  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d error: %i", v2, v3, v4, v5, 2u);
  sub_10000BD68();
}

void sub_10004C6BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ERROR Enqueing the Sample Video Buffer", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004C738(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000BDAC(a1, __stack_chk_guard);
  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d ERROR removing the asset writer output file: %d", v2, v3, v4, v5, 2u);
  sub_10000BD68();
}

void sub_10004C7B4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000BDAC(a1, __stack_chk_guard);
  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d ERROR creating new asset writer: %d", v2, v3, v4, v5, 2u);
  sub_10000BD68();
}

void sub_10004C830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, a3, " [ERROR] %{public}s:%d Invalid timestamp with flags 0x%x", a5, a6, a7, a8, 2u);
  sub_10000BD68();
}

void sub_10004C8C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d asset writer could not appended first sample", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004C93C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ERROR starting asset writer", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004C9B8(void *a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  _WORD v8[10];
  unsigned int v9;
  __int16 v10;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "assetWriter"));
  v3 = objc_msgSend(v2, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "assetWriter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
  *(_DWORD *)v8 = 136446978;
  sub_10000BD48();
  *(_DWORD *)&v8[7] = 583;
  v8[9] = v6;
  v9 = v3;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d asset writer not started with status %d and error %@", (uint8_t *)v8, 0x22u);

}

void sub_10004CAA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ERROR Enqueing the Sample Audio Buffer", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004CB24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ERROR Enqueing the Sample Audio Buffer", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004CBA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Save to Photos error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004CC1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no photo asset to delete", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004CC98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error deleting photo asset: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004CD14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error setting listenerEndpoint", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004CD90(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  sub_10000BD48();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d Error beginning extension request: %i", v2, v3, v4, v5, 2u);
  sub_10000BD68();
}

void sub_10004CE18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d connection to broadcast extension invalidated", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004CE94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d connection to broadcast extension interrupted", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004CF10(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  sub_10000BD48();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d error getting remote proxy to extension: %i", v2, v3, v4, v5, 2u);
  sub_10000BD68();
}

void sub_10004CF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, a3, " [ERROR] %{public}s:%d %s not using as abstract class", a5, a6, a7, a8, 2u);
  sub_10000BDA4();
}

void sub_10004D028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d invalid pid", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004D0A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d unable to register for lock event", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004D118(double a1, double a2)
{
  float v2;
  float v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  double v9;
  __int16 v10;
  double v11;

  v2 = a1;
  v4 = 136446978;
  v5 = "-[RPSession checkMinWindowSizeRequirement:]";
  v3 = a2;
  v6 = 1024;
  v7 = 981;
  v8 = 2048;
  v9 = v2;
  v10 = 2048;
  v11 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Invalid requirements due to invalid window size of width: %f and height: %f", (uint8_t *)&v4, 0x26u);
  sub_10000BDA4();
}

void sub_10004D1CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing user acknowledgement alert", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004D244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing status bar alert", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004D2BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing recording / capture stopped with error alert", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004D334(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d error getting recordedFileSize :%ld", v2, v3, v4, v5, 2u);
  sub_10000BDA4();
}

void sub_10004D3C8(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;

  v1 = 136446722;
  v2 = "-[RPSession dispatchLimitReached:]";
  v3 = 1024;
  v4 = 1617;
  v5 = 1024;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d reached max dispatch count, dropping sample of type %d", (uint8_t *)&v1, 0x18u);
  sub_10000BD68();
}

void sub_10004D460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d unable to create and add client to client manager", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004D4DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d client disconnected, failed to stop active session", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004D558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error Mixing video Audio tracks", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004D5D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d unable to create and add client to client manager", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004D650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error setting up system broadcast: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004D6CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error setting up in app broadcast: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004D748()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d start in app broadcast error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004D7C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d stop in app broadcast error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004D840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no client found", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004D8BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to stop all clients", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004D938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed entitlement check", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004D9B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Save to Photos error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004DA30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d missing system entitlements", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004DAAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no photo asset to delete", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004DB28(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", NSDebugDescriptionErrorKey));
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v3, " [ERROR] %{public}s:%d Failed to present control center screen capture module error:%@", v4, v5, v6, v7, 2u);

}

void sub_10004DC00(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  v1 = 136446722;
  v2 = "-[RPStatusBarAssertion invalidateStatusBar]_block_invoke";
  v3 = 1024;
  v4 = 104;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d setRegisteredStyleOverrides replied with error: %@", (uint8_t *)&v1, 0x1Cu);
}

void sub_10004DCA0()
{
  __int16 v0;
  int v1;
  _WORD v2[10];
  int v3;

  *(_DWORD *)v2 = 136446722;
  sub_10000BD48();
  *(_DWORD *)&v2[7] = 193;
  v2[9] = v0;
  v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d status: %d", (uint8_t *)v2, 0x18u);
  sub_10000BD68();
}

void sub_10004DD30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004DDAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004DE28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error found when checking requirements: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004DEB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d %f seconds is invalid", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004DF38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to export clip recording because export is already in process", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004DFB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d VTCompressionSessionEncodeFrame error %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004E030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d VTCompressionSessionCreate error %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004E0AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Encoding OutputCallback null object reference", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004E128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Encoding OutputCallback error %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004E1A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d nil sample buffer", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004E220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to create buffer copy", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004E29C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 136446978;
  v4 = "-[RPClipSession captureDidFailWithError:]_block_invoke";
  v5 = 1024;
  v6 = 310;
  v7 = 2112;
  v8 = v2;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
  sub_10000BDA4();
}

void sub_10004E344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d video URL is nil", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004E3BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Asset Video Track constains more than one formatDescscriptions", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004E434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Asset should only contain 1 video track", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004E4AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to get videoCodecType for asset", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004E524()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  v0 = 136446466;
  v1 = "+[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]";
  v2 = 1024;
  v3 = 128;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d payloadDict cannot be null!", (uint8_t *)&v0, 0x12u);
}

void sub_10004E5B8(unsigned __int16 a1, void *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;

  v2 = 136446978;
  v3 = "+[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]";
  v4 = 1024;
  v5 = 156;
  v6 = 1024;
  v7 = a1;
  v8 = 1024;
  v9 = objc_msgSend(a2, "code");
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error reporting eventType:%d error code:%d", (uint8_t *)&v2, 0x1Eu);
}

void sub_10004E670(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:updateScreenRecordingStateWithCurrentState: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004E6D8(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:recordingDidStopWithError: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004E740(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:updateBroadcastServiceInfo: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004E7A8(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:updateBroadcastURL: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004E810(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:captureHandlerWithSample: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004E878(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:captureHandlerWithAudioSample: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004E8E0(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:recodingDidStopAndSavedToCameraRoll: video saved to camera roll: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004E948(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:shouldResumeSessionType: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004E9B0(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:recordingDidPause: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004EA18(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPClientProxy:recordingTimerDidUpdate: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004EA80(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPMultipleClientProxy:updateScreenRecordingStateWithCurrentState: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004EAE8(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPMultipleClientProxy:recordingDidStopWithError: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004EB50(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPMultipleClientProxy:updateBroadcastURL: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004EBB8(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPMultipleClientProxy:recodingDidStopAndSavedToCameraRoll: video saved to camera roll: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004EC20(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100023AAC(a1, a2);
  sub_100023AB4();
  sub_10000540C((void *)&_mh_execute_header, &_os_log_default, v2, "RPMultipleClientProxy:recordingTimerDidUpdate: error getting remote proxy: %d", v3, v4, v5, v6, v7);
  sub_10000541C();
}

void sub_10004EC88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100023AC0((void *)&_mh_execute_header, &_os_log_default, a3, "RPMultipleClientProxy:recordingDidPause: ERROR not supported", a5, a6, a7, a8, 0);
  sub_10000541C();
}

void sub_10004ECBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100023AC0((void *)&_mh_execute_header, &_os_log_default, a3, "RPMultipleClientProxy:shouldResumeSessionType: ERROR not supported", a5, a6, a7, a8, 0);
  sub_10000541C();
}

void sub_10004ECF0()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  v0 = 136446466;
  v1 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
  v2 = 1024;
  v3 = 105;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d stop current active session failed", (uint8_t *)&v0, 0x12u);
}

void sub_10004ED84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d extension token with valid permissions required", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004EDFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not consume sandbox extension handle", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004EE74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not release sandbox extension handle", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004EEEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed because client doesn't have entitlements to setup broadcast", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004EF64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed because client doesn't have entitlements for system recording", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004EFDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed because client doesn't have entitlements for system recording", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed because client doesn't have entitlements for system recording", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F0CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to resume due to missing entitlements", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F144()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to resume due to missing entitlements", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F1BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no extension token available", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not consume sandbox extension handle", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F2AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not release sandbox extension handle", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no extension token available", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F39C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not consume sandbox extension handle", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not release sandbox extension handle", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F48C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not consume sandbox extension handle", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not release sandbox extension handle", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F57C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Could not consume extension token", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_10004F5F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error found when checking requirements: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004F670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100030C54((void *)&_mh_execute_header, &_os_log_default, a3, "%s error showing broadcast stopped with error alert", a5, a6, a7, a8, 2u);
  sub_10000BD68();
}

void sub_10004F6E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100030C54((void *)&_mh_execute_header, &_os_log_default, a3, "%s showAlertForBroadcastSession: user has choosen to go to extension application", a5, a6, a7, a8, 2u);
  sub_10000BD68();
}

void sub_10004F758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100030C54((void *)&_mh_execute_header, &_os_log_default, a3, "%s showAlertForBroadcastSession: user dismiss error from extension application", a5, a6, a7, a8, 2u);
  sub_10000BD68();
}

void sub_10004F7CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting broadcast: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004F848()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d startCapture has failed. Error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004F8C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no matching broadcastExtension found, falling back to first object", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004F940()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no matching broadcastExtension found, falling back to first object", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004F9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 136446978;
  v4 = "-[RPSystemBroadcastSession captureDidFailWithError:]_block_invoke";
  v5 = 1024;
  v6 = 559;
  v7 = 2112;
  v8 = v2;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
  sub_10000BDA4();
}

void sub_10004FA64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no broadcast extension found!", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004FAE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d broadcast extension not ready", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004FB5C()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;

  v0 = 136446978;
  v1 = "-[RPSystemBroadcastSession notifyExtensionOfAction:completion:]";
  v2 = 1024;
  v3 = 711;
  v4 = 2080;
  v5 = "-[RPSystemBroadcastSession notifyExtensionOfAction:completion:]";
  v6 = 1024;
  v7 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s notify extension RPBroadcastActionFinish time out after %d seconds", (uint8_t *)&v0, 0x22u);
  sub_10000BDA4();
}

void sub_10004FC04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no broadcast extension found!", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004FC80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d broadcast extension not ready", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004FCFC(int *a1)
{
  int v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;

  v1 = *a1;
  v2 = 136446722;
  v3 = "-[RPClient pauseCurrentActiveSession]";
  v4 = 1024;
  v5 = 227;
  v6 = 1024;
  v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d pause not supported for session type %d", (uint8_t *)&v2, 0x18u);
  sub_10000BD68();
}

void sub_10004FD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d stop session failed with error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004FE14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d invalid session type", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10004FE90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting in-app recording:%@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004FF0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping in-app recording: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10004FF88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting in-app capture: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100050004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping in-app capture: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100050080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no broadcast session found", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000500FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting in-app broadcast: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100050178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping in-app broadcast: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_1000501F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting in-app recording:%@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100050270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping in-app recording: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_1000502EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting system recording: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100050368()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping System Recording: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_1000503E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error System Recording with URL handler: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100050460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Not resuming with error %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_1000504DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting system broadcast: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100050558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping system broadacst: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_1000505D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Not resuming with error %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100050650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d not allowed for system recording", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000506CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Privacy Source is nil", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050748()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  __int16 v4;
  const char *v5;

  v0 = 136446722;
  v1 = "-[RPDelegateBase init]";
  v2 = 1024;
  v3 = 27;
  v4 = 2080;
  v5 = "-[RPDelegateBase init]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s not using as abstract class", (uint8_t *)&v0, 0x1Cu);
}

void sub_1000507E8()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  v0 = 136446466;
  v1 = "-[RPAngelProxy updateTimer:]";
  v2 = 1024;
  v3 = 134;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d timer string nil", (uint8_t *)&v0, 0x12u);
}

void sub_10005087C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d AudioQueue start error: %i", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000508F8(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;

  v1 = *a1;
  v2 = 136446722;
  v3 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
  v4 = 1024;
  v5 = 291;
  v6 = 2048;
  v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d (%p) Failed to create audio tap", (uint8_t *)&v2, 0x1Cu);
  sub_10000BDA4();
}

void sub_100050998(uint64_t a1, int a2)
{
  double v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_10003A438(a1, a2, __stack_chk_guard);
  sub_10003A460();
  sub_10003A418(v2, v3);
  sub_10003A450((void *)&_mh_execute_header, &_os_log_default, v4, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: handleInputBuffer audio sample buffer timestamp %.3f earlier than previous %.3f", v5, v6, v7, v8, 2u);
  sub_10000BDA4();
}

void sub_100050A18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: error reading AudioQueue property", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050A94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: AudioQueue listener property %d not added", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050B10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error: %i", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error: %i", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050C08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d allocate audioFormat error", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050C84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create audio tap description", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050D00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create audio tap", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050D7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d contextID is nil", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050DF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: Could not enqueue audio buffer", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: Could not enqueue audio buffer", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100050EF0(uint64_t a1, int a2)
{
  double v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_10003A438(a1, a2, __stack_chk_guard);
  sub_10003A460();
  sub_10003A418(v2, v3);
  sub_10003A450((void *)&_mh_execute_header, &_os_log_default, v4, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: discarding audio sample buffer due to timestamp %.3f earlier than previous %.3f", v5, v6, v7, v8, 2u);
  sub_10000BDA4();
}

void sub_100050F70()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  v0 = 136446466;
  v1 = "+[RPStringUtility rotatingDeviceUniqueID]";
  v2 = 1024;
  v3 = 33;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Could not get NSUserDefaults shared defaults object", (uint8_t *)&v0, 0x12u);
}

void sub_100051004(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  v1 = 136446722;
  v2 = "+[RPStringUtility isInvalidBundleId:]";
  v3 = 1024;
  v4 = 54;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d bundleID=%@ is invalid", (uint8_t *)&v1, 0x1Cu);
}

void sub_1000510A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error found when checking requirements: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100051120()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting broadcast: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10005119C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d startCapture has failed. Error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100051218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 136446978;
  v4 = "-[RPBroadcastSession captureDidFailWithError:]_block_invoke";
  v5 = 1024;
  v6 = 446;
  v7 = 2112;
  v8 = v2;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
  sub_10000BDA4();
}

void sub_1000512C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100030C54((void *)&_mh_execute_header, &_os_log_default, a3, "%s error showing broadcast stopped with error alert", a5, a6, a7, a8, 2u);
  sub_10000BD68();
}

void sub_100051334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100030C54((void *)&_mh_execute_header, &_os_log_default, a3, "%s showAlertForBroadcastSession: user has choosen to go to extension application", a5, a6, a7, a8, 2u);
  sub_10000BD68();
}

void sub_1000513A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100030C54((void *)&_mh_execute_header, &_os_log_default, a3, "%s showAlertForBroadcastSession: user dismiss error from extension application", a5, a6, a7, a8, 2u);
  sub_10000BD68();
}

void sub_10005141C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing resume broadcast alert", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100051498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no broadcast extension found!", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100051514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d broadcast extension not ready", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100051590()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;

  v0 = 136446978;
  v1 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
  v2 = 1024;
  v3 = 719;
  v4 = 2080;
  v5 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
  v6 = 1024;
  v7 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s notify extension RPBroadcastActionFinish time out after %d seconds", (uint8_t *)&v0, 0x22u);
  sub_10000BDA4();
}

void sub_100051638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CGImageDestinationCreateWithData failed", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_1000516B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to get icon image", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_100051728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CreateEncodedImageData failed", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_1000517A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error found when checking requirements: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_10005181C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to connect to angel", v1, v2, v3, v4, 2u);
}

void sub_10005189C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d finishWritingAndSaveToCameraRoll error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100051918()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no movie writer instance when attempting to stop", v1, v2, v3, v4, 2u);
}

void sub_100051998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD80();
  sub_10000BD70((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d writing movie error: %@", v1, v2, v3, v4, 2u);
  sub_10000BDA4();
}

void sub_100051A14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 136446978;
  v4 = "-[RPSystemRecordSession captureDidFailWithError:]_block_invoke";
  v5 = 1024;
  v6 = 315;
  v7 = 2112;
  v8 = v2;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
  sub_10000BDA4();
}

void sub_100051ABC(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  v1 = 136446722;
  v2 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke";
  v3 = 1024;
  v4 = 64;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Save to Photos error: %@", (uint8_t *)&v1, 0x1Cu);
}

void sub_100051B5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error deleting file", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_100051BD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error Mixing video audio tracks, try saving original file", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_100051C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error deleting file", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_100051CC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007230();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing recording stopped with error alert", v1, v2, v3, v4, v5);
  sub_10000BD68();
}

void sub_100051D3C(void *a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  unsigned int v6;

  v1 = 136446722;
  v2 = "-[RPClipWriter setupAssetWriter]";
  v3 = 1024;
  v4 = 81;
  v5 = 1024;
  v6 = objc_msgSend(a1, "code");
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error: %i", (uint8_t *)&v1, 0x18u);
}

void sub_100051DDC(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  v1 = 136446722;
  v2 = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]_block_invoke";
  v3 = 1024;
  v4 = 221;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error finishing asset writing:%@", (uint8_t *)&v1, 0x1Cu);
}

void sub_100051E7C(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  v1 = 136446722;
  v2 = "-[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
  v3 = 1024;
  v4 = 52;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error found when checking requirements: %@", (uint8_t *)&v1, 0x1Cu);
}

void sub_100051F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 136446978;
  v4 = "-[RPCaptureSession captureDidFailWithError:]_block_invoke";
  v5 = 1024;
  v6 = 186;
  v7 = 2112;
  v8 = v2;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
}

void sub_100051FC8()
{
  int v0;
  _DWORD v1[2];

  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to set user dir suffix: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_10005204C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed with error code %u", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000520C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Overflow detected", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100052144()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d unsupported NonInterleaved with %d channels", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000521C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Non-positive framesPerPacket", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10005223C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CMSampleBufferCreate failed: %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000522B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CMBlockBufferAssureBlockMemory failed: %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100052334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CMBlockBufferCreateEmpty failed: %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000523B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Invalid ASBD params", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10005242C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CMAudioFormatDescriptionCreate failed: %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000524A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create the CMSampleBuffer: %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_100052524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_10000BD94();
  sub_10000BD58((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create the CMSampleBuffer description: %d", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_1000525A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BD48();
  sub_100007220((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create format description for audio buffer", v1, v2, v3, v4, 2u);
  sub_10000BD68();
}

void sub_10005261C()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  v0 = 136446466;
  v1 = "-[RPCaptureManager updateContextIDs:forProcessID:systemRecording:]";
  v2 = 1024;
  v3 = 321;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d missing contextID", (uint8_t *)&v0, 0x12u);
}

void sub_1000526B0(void *a1)
{
  id v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  id v7;

  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription")));
  v2 = 136446722;
  v3 = "-[RPCaptureManager setAVAudioSessionCategory]";
  v4 = 1024;
  v5 = 357;
  v6 = 2080;
  v7 = objc_msgSend(v1, "UTF8String");
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s", (uint8_t *)&v2, 0x1Cu);

}

void sub_100052770(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  v1 = 136446722;
  v2 = "-[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
  v3 = 1024;
  v4 = 62;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error found when checking requirements: %@", (uint8_t *)&v1, 0x1Cu);
}

void sub_100052810()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  v0 = 136446466;
  v1 = "-[RPRecordSession discardInAppRecordingWithHandler:]_block_invoke";
  v2 = 1024;
  v3 = 149;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error deleting file", (uint8_t *)&v0, 0x12u);
}

void sub_1000528A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 136446978;
  v4 = "-[RPRecordSession captureDidFailWithError:]_block_invoke";
  v5 = 1024;
  v6 = 255;
  v7 = 2112;
  v8 = v2;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
}

id objc_msgSend_CGAffineTransformFromFigTransformFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGAffineTransformFromFigTransformFlags:");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGImage");
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingPathExtension");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_auxiliaryConnection");
}

id objc_msgSend__extensionBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionBundle");
}

id objc_msgSend__extensionContextForUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionContextForUUID:");
}

id objc_msgSend__kill_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_kill:");
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_plugIn");
}

id objc_msgSend__rpFrameworkBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rpFrameworkBundle");
}

id objc_msgSend__rpLocalizedAppName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rpLocalizedAppName");
}

id objc_msgSend__rpLocalizedAppNameFromBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rpLocalizedAppNameFromBundleID:");
}

id objc_msgSend__rpLocalizedStringFromFrameworkBundleWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rpLocalizedStringFromFrameworkBundleWithKey:");
}

id objc_msgSend__rpUserErrorForCode_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rpUserErrorForCode:userInfo:");
}

id objc_msgSend__scUserErrorForCode_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scUserErrorForCode:userInfo:");
}

id objc_msgSend__srDeleteAllAndSystemTempFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srDeleteAllAndSystemTempFiles");
}

id objc_msgSend__srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:");
}

id objc_msgSend__srDeviceFreeDiskSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srDeviceFreeDiskSpace");
}

id objc_msgSend__srDeviceHasSufficientFreeSpaceForRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srDeviceHasSufficientFreeSpaceForRecording");
}

id objc_msgSend__srDeviceHasSufficientSpaceForCurrentRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srDeviceHasSufficientSpaceForCurrentRecording");
}

id objc_msgSend__srRemoveFile_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srRemoveFile:completion:");
}

id objc_msgSend__srSetupTempDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srSetupTempDirectory");
}

id objc_msgSend__srSizeOfTempDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srSizeOfTempDir:");
}

id objc_msgSend__srTempPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_srTempPath");
}

id objc_msgSend_accessWithAccessor_fromBroadcaster_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessWithAccessor:fromBroadcaster:");
}

id objc_msgSend_acquireAssertionWithPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireAssertionWithPid:");
}

id objc_msgSend_acquireAssertionWithPidWaitForCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireAssertionWithPidWaitForCompletion:");
}

id objc_msgSend_acquireWithHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireWithHandler:invalidationHandler:");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionWithIdentifier_title_options_icon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithIdentifier:title:options:icon:");
}

id objc_msgSend_actionWithIdentifier_title_url_options_icon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithIdentifier:title:url:options:icon:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activeDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDuration");
}

id objc_msgSend_addClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addClient:");
}

id objc_msgSend_addDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFrameToBuffer_isKeyFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFrameToBuffer:isKeyFrame:");
}

id objc_msgSend_addInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInput:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_processIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:processIdentifier:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserversForSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserversForSession");
}

id objc_msgSend_addOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOutput:");
}

id objc_msgSend_addResourceWithType_fileURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addResourceWithType:fileURL:options:");
}

id objc_msgSend_addSystemObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSystemObserver:");
}

id objc_msgSend_addToThermalResultsWithLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToThermalResultsWithLevel:");
}

id objc_msgSend_adjustedWindowSizeForSystemRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustedWindowSizeForSystemRecording");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anonymousListener");
}

id objc_msgSend_appAudioFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appAudioFrameCount");
}

id objc_msgSend_appendAudio1SampleBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendAudio1SampleBuffer:");
}

id objc_msgSend_appendAudio2SampleBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendAudio2SampleBuffer:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendInitialSampleBuffer_withTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendInitialSampleBuffer:withTransform:");
}

id objc_msgSend_appendSampleBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendSampleBuffer:");
}

id objc_msgSend_appendVideoSampleBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendVideoSampleBuffer:");
}

id objc_msgSend_appendVideoSampleBuffer_withWindowTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendVideoSampleBuffer:withWindowTransform:");
}

id objc_msgSend_applicationInfoForPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationInfoForPID:");
}

id objc_msgSend_applicationStateDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationStateDidChange:");
}

id objc_msgSend_applicationStateForApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationStateForApplication:");
}

id objc_msgSend_applicationStateMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationStateMonitor");
}

id objc_msgSend_applicationWithType_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationWithType:identifier:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
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

id objc_msgSend_assetWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetWithURL:");
}

id objc_msgSend_assetWriter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetWriter");
}

id objc_msgSend_assetWriterStartCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetWriterStartCount");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_attributesOfFileSystemForPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfFileSystemForPath:error:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_audioCaptureConfigForSystemRecording_processID_contextID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioCaptureConfigForSystemRecording:processID:contextID:");
}

id objc_msgSend_audioChannelCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioChannelCount");
}

id objc_msgSend_audioEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioEnabled");
}

id objc_msgSend_audioInput1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioInput1");
}

id objc_msgSend_audioInput2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioInput2");
}

id objc_msgSend_audioMix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioMix");
}

id objc_msgSend_audioMixInputParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioMixInputParameters");
}

id objc_msgSend_audioSampleRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioSampleRate");
}

id objc_msgSend_audioStreamBasicDescriptionWithStereo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioStreamBasicDescriptionWithStereo:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_averageFrameLatency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averageFrameLatency");
}

id objc_msgSend_averageFrameLatencyAudio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averageFrameLatencyAudio");
}

id objc_msgSend_averageFrameLatencyMic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averageFrameLatencyMic");
}

id objc_msgSend_averageVideoBitrate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averageVideoBitrate");
}

id objc_msgSend_backCameraUsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backCameraUsed");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_backgroundReplacementTotalDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundReplacementTotalDuration");
}

id objc_msgSend_baseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseIdentifier:");
}

id objc_msgSend_beginExtensionRequestWithInputItems_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginExtensionRequestWithInputItems:completion:");
}

id objc_msgSend_beginIntervalForAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginIntervalForAccess:");
}

id objc_msgSend_beginPrivacyAccountingIntervalwithSource_withDestination_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginPrivacyAccountingIntervalwithSource:withDestination:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_broadcastHostBundleId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "broadcastHostBundleId");
}

id objc_msgSend_broadcastServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "broadcastServiceName");
}

id objc_msgSend_broadcastSessionAudioQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "broadcastSessionAudioQueue");
}

id objc_msgSend_broadcastSessionVideoQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "broadcastSessionVideoQueue");
}

id objc_msgSend_broadcastUploadExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "broadcastUploadExtension");
}

id objc_msgSend_bufferArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufferArray");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bundleWithPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPID:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_callDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callDelegate:");
}

id objc_msgSend_cameraDeviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraDeviceType");
}

id objc_msgSend_cameraEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraEnabled");
}

id objc_msgSend_canAddInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canAddInput:");
}

id objc_msgSend_canAddOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canAddOutput:");
}

id objc_msgSend_captureDidFailWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDidFailWithError:");
}

id objc_msgSend_captureDynamicRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDynamicRange");
}

id objc_msgSend_captureHandlerWithAudioSample_bufferType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureHandlerWithAudioSample:bufferType:");
}

id objc_msgSend_captureHandlerWithSample_timingData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureHandlerWithSample:timingData:");
}

id objc_msgSend_captureResolutionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureResolutionType");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:options:");
}

id objc_msgSend_centerStageEffectTotalDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerStageEffectTotalDuration");
}

id objc_msgSend_checkAndHandleMicInterruption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAndHandleMicInterruption");
}

id objc_msgSend_checkAndPlaySystemSessionSound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAndPlaySystemSessionSound:");
}

id objc_msgSend_checkApplicationForegroundRequirement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkApplicationForegroundRequirement");
}

id objc_msgSend_checkCaptureRequirementsWithMicrophoneEnabled_cameraEnabled_windowSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:");
}

id objc_msgSend_checkContextIDRequirement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkContextIDRequirement");
}

id objc_msgSend_checkContextIDsMatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkContextIDsMatch:");
}

id objc_msgSend_checkDeviceLockedRequirement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkDeviceLockedRequirement");
}

id objc_msgSend_checkForAcknowledgementAlertTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForAcknowledgementAlertTimeout");
}

id objc_msgSend_checkMinWindowSizeRequirement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkMinWindowSizeRequirement:");
}

id objc_msgSend_checkMultiWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkMultiWindow");
}

id objc_msgSend_checkMultiWindowRequirement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkMultiWindowRequirement");
}

id objc_msgSend_checkSufficientFreeSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkSufficientFreeSpace");
}

id objc_msgSend_chipId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chipId");
}

id objc_msgSend_clearSystemRecordingUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearSystemRecordingUI");
}

id objc_msgSend_clientApplicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientApplicationDidEnterBackground");
}

id objc_msgSend_clientApplicationDidEnterForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientApplicationDidEnterForeground");
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientBundleID");
}

id objc_msgSend_clientMainBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientMainBundleID");
}

id objc_msgSend_clientProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientProxy");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectSummaryEventMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectSummaryEventMetrics");
}

id objc_msgSend_collectSummaryRecordingEventMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectSummaryRecordingEventMetrics");
}

id objc_msgSend_colorMatrix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorMatrix");
}

id objc_msgSend_colorSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorSpace");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectToAngelWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToAngelWithCompletionHandler:");
}

id objc_msgSend_connectionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionManager");
}

id objc_msgSend_connectionManagerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionManagerQueue");
}

id objc_msgSend_connectionSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionSet");
}

id objc_msgSend_connectionWithEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionWithEndpoint:");
}

id objc_msgSend_consumeSandboxExtensionToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consumeSandboxExtensionToken:");
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingBundle");
}

id objc_msgSend_containingUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingUrl");
}

id objc_msgSend_containsDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsDelegate:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextID");
}

id objc_msgSend_convertThermalPressureLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertThermalPressureLevel:");
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

id objc_msgSend_createAssetURLFromPhotosIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAssetURLFromPhotosIdentifier:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createEncodingSessionWithWidth_withHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEncodingSessionWithWidth:withHeight:");
}

id objc_msgSend_createNewBroadcastClientWithBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_isSystemBroadcast_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:");
}

id objc_msgSend_createNotificationRequestWithAssetURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNotificationRequestWithAssetURL:");
}

id objc_msgSend_createNotificationRequestWithAssetURL_ignoreDoNotDisturb_isClip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNotificationRequestWithAssetURL:ignoreDoNotDisturb:isClip:");
}

id objc_msgSend_creationRequestForAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationRequestForAsset");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateSuffix");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeXPCObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeXPCObjectForKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultDeviceWithMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDeviceWithMediaType:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultOptions");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateCount");
}

id objc_msgSend_deleteAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAssets:");
}

id objc_msgSend_destSurfaceHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destSurfaceHeight");
}

id objc_msgSend_destSurfaceWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destSurfaceWidth");
}

id objc_msgSend_deviceInputWithDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInputWithDevice:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didProcessFirstSample(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didProcessFirstSample");
}

id objc_msgSend_disableBroadcast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableBroadcast");
}

id objc_msgSend_disableCameraPip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableCameraPip");
}

id objc_msgSend_discardInAppRecordingWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discardInAppRecordingWithHandler:");
}

id objc_msgSend_dispatchCaptureQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchCaptureQueue");
}

id objc_msgSend_dispatchClipWriterQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchClipWriterQueue");
}

id objc_msgSend_dispatchCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchCompleted:");
}

id objc_msgSend_dispatchLimitReached_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchLimitReached:");
}

id objc_msgSend_dispatchedAppendVideoSampleBuffer_withWindowTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchedAppendVideoSampleBuffer:withWindowTransform:");
}

id objc_msgSend_dispatchedDidStartHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchedDidStartHandler");
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayBacklightLevel");
}

id objc_msgSend_displayScreenRecorderNotificationWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayScreenRecorderNotificationWithURL:");
}

id objc_msgSend_displayScreenRecorderNotificationWithURL_ignoreDoNotDisturb_isClip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayScreenRecorderNotificationWithURL:ignoreDoNotDisturb:isClip:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_enableBroadcastStartCaptureWithListenerEndpoint_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableBroadcastStartCaptureWithListenerEndpoint:withHandler:");
}

id objc_msgSend_enableBroadcastWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableBroadcastWithListenerEndpoint:");
}

id objc_msgSend_enableCameraPip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCameraPip");
}

id objc_msgSend_enableMicrophone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMicrophone");
}

id objc_msgSend_enableMixedRealityCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMixedRealityCamera");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeXPCObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeXPCObject:forKey:");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_endPrivacyAccountingInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endPrivacyAccountingInterval");
}

id objc_msgSend_endReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endReason");
}

id objc_msgSend_endSessionAtSourceTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSessionAtSourceTime:");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_endpointForMachName_service_instance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointForMachName:service:instance:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorHandler");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_establishConnectionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "establishConnectionWithHandler:");
}

id objc_msgSend_excludeCallingClientAudio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excludeCallingClientAudio");
}

id objc_msgSend_excludedApplicationsCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excludedApplicationsCount");
}

id objc_msgSend_excludedWindowsCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excludedWindowsCount");
}

id objc_msgSend_executablePathWithPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executablePathWithPID:");
}

id objc_msgSend_exportAsynchronouslyWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportAsynchronouslyWithCompletionHandler:");
}

id objc_msgSend_exportClipToURL_duration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportClipToURL:duration:completionHandler:");
}

id objc_msgSend_exportPresetForAVAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportPresetForAVAsset:");
}

id objc_msgSend_exportVideoToPhotosAsynchronously_mixAudioTracks_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:");
}

id objc_msgSend_exportVideoToPhotosLibrary_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportVideoToPhotosLibrary:completionHandler:");
}

id objc_msgSend_extensionPointIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionPointIdentifier");
}

id objc_msgSend_extensionsWithMatchingAttributes_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsWithMatchingAttributes:completion:");
}

id objc_msgSend_extensionsWithMatchingPointName_baseIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsWithMatchingPointName:baseIdentifier:completion:");
}

id objc_msgSend_extensionsWithMatchingPointName_baseIdentifier_unwantedActivationRule_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsWithMatchingPointName:baseIdentifier:unwantedActivationRule:completion:");
}

id objc_msgSend_extensionsWithMatchingPointName_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsWithMatchingPointName:completion:");
}

id objc_msgSend_fallbackLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fallbackLanguage");
}

id objc_msgSend_fetchAssetsWithLocalIdentifiers_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAssetsWithLocalIdentifiers:options:");
}

id objc_msgSend_fetchAssetsWithMediaType_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAssetsWithMediaType:options:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileModificationDate");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterSource");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finishStartup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishStartup");
}

id objc_msgSend_finishWriting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWriting");
}

id objc_msgSend_finishWritingAndSaveToCameraRollWithSessionID_mixAudioTracks_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:");
}

id objc_msgSend_finishWritingWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWritingWithCompletionHandler:");
}

id objc_msgSend_finishWritingWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWritingWithHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_floatingSessionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatingSessionCount");
}

id objc_msgSend_floatingToNewsroomTransitionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatingToNewsroomTransitionCount");
}

id objc_msgSend_floatingTotalDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatingTotalDuration");
}

id objc_msgSend_floatingTotalFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatingTotalFrameCount");
}

id objc_msgSend_flushBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flushBuffer");
}

id objc_msgSend_flushClipBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flushClipBuffer");
}

id objc_msgSend_formatDescriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatDescriptions");
}

id objc_msgSend_frameHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameHeight");
}

id objc_msgSend_frameQueueSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameQueueSize");
}

id objc_msgSend_frameWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameWidth");
}

id objc_msgSend_frontCameraUsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontCameraUsed");
}

id objc_msgSend_frontmostApplicationDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontmostApplicationDidChange:");
}

id objc_msgSend_gestureDetectionBasedReactionsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gestureDetectionBasedReactionsEnabled");
}

id objc_msgSend_getAcknowledgementAlertResultsWithMicrophone_cameraEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:");
}

id objc_msgSend_getBSServiceInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBSServiceInterface");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getCallingConnectionBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCallingConnectionBundleID");
}

id objc_msgSend_getCallingConnectionClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCallingConnectionClient");
}

id objc_msgSend_getClientForBroadcastWithHostBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getClientForBroadcastWithHostBundleID:");
}

id objc_msgSend_getClientWithBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getClientWithBundleID:");
}

id objc_msgSend_getColorFromRGBA_withGreen_withBlue_withAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getColorFromRGBA:withGreen:withBlue:withAlpha:");
}

id objc_msgSend_getCurrentPressureLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentPressureLevel");
}

id objc_msgSend_getCurrentStreamScreenConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentStreamScreenConfiguration");
}

id objc_msgSend_getFileSizeForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFileSizeForURL:");
}

id objc_msgSend_getFormatDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFormatDescription");
}

id objc_msgSend_getHostedPidsForPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHostedPidsForPid:");
}

id objc_msgSend_getImageDataFromExtensionContainingAppBundleUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getImageDataFromExtensionContainingAppBundleUrl:");
}

id objc_msgSend_getNotificationBodyTextForSessionType_cameraEnabled_microphoneEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNotificationBodyTextForSessionType:cameraEnabled:microphoneEnabled:");
}

id objc_msgSend_getNotificationTitleTextForSessionType_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNotificationTitleTextForSessionType:bundleID:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSamplesForDuration_latestSeconds_withOutputArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSamplesForDuration:latestSeconds:withOutputArray:");
}

id objc_msgSend_getStateWithToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStateWithToken:");
}

id objc_msgSend_getSystemBroadcastExtensionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemBroadcastExtensionInfo:");
}

id objc_msgSend_getSystemBroadcastPickerInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemBroadcastPickerInfo:");
}

id objc_msgSend_getTotalNumberOfSamples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTotalNumberOfSamples");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_handleApplicationStateChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleApplicationStateChange:");
}

id objc_msgSend_handleBroadcastError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBroadcastError:");
}

id objc_msgSend_handleBroadcastServiceInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBroadcastServiceInfo:");
}

id objc_msgSend_handleBroadcastURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBroadcastURL:");
}

id objc_msgSend_handleClientApplicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleClientApplicationDidEnterBackground");
}

id objc_msgSend_handleClientApplicationDidEnterForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleClientApplicationDidEnterForeground");
}

id objc_msgSend_handleDeviceLockedWarning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDeviceLockedWarning");
}

id objc_msgSend_handleDeviceRestrictionWarning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDeviceRestrictionWarning");
}

id objc_msgSend_handleDisplayBacklightUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDisplayBacklightUpdate:");
}

id objc_msgSend_handleDisplayWarning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDisplayWarning");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleFrontmostApplicationDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFrontmostApplicationDidChange:");
}

id objc_msgSend_handleIncomingCallWarning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleIncomingCallWarning");
}

id objc_msgSend_handleMemoryWarning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMemoryWarning");
}

id objc_msgSend_handleMemoryWarningForCurrentActiveSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMemoryWarningForCurrentActiveSession");
}

id objc_msgSend_handleNewConnection_currentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleNewConnection:currentState:");
}

id objc_msgSend_handleResumeCaptureWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleResumeCaptureWithCompletionHandler:");
}

id objc_msgSend_handleScreenCaptureFailureWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleScreenCaptureFailureWithError:");
}

id objc_msgSend_handleStartAudioQueueFailed_didFailHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleStartAudioQueueFailed:didFailHandler:");
}

id objc_msgSend_handleSystemAlertStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSystemAlertStop");
}

id objc_msgSend_handleUpdateDisplayLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUpdateDisplayLayout:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hasBroadcastEntitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasBroadcastEntitlements");
}

id objc_msgSend_hasDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDelegate:");
}

id objc_msgSend_hasEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEnded");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSystemRecordingEntitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSystemRecordingEntitlements");
}

id objc_msgSend_hasUnitTestEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasUnitTestEntitlement");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hideAndStopRecordingBanner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideAndStopRecordingBanner");
}

id objc_msgSend_hostApplicationWithAuditToken_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostApplicationWithAuditToken:bundleID:");
}

id objc_msgSend_hostProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostProcess");
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconWithSystemImageName:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageForImageDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageForImageDescriptor:");
}

id objc_msgSend_includedApplicationsCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includedApplicationsCount");
}

id objc_msgSend_includedWindowsCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includedWindowsCount");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_initFileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initForVideo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForVideo:");
}

id objc_msgSend_initPreSpatialSceneIdentifierTapWithFormat_sceneIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPreSpatialSceneIdentifierTapWithFormat:sceneIdentifier:");
}

id objc_msgSend_initProcessTapWithFormat_PID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initProcessTapWithFormat:PID:");
}

id objc_msgSend_initScreenSharingTapWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initScreenSharingTapWithFormat:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAsset_presetName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAsset:presetName:");
}

id objc_msgSend_initWithBroadcastUploadExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBroadcastUploadExtension:");
}

id objc_msgSend_initWithBroadcastUploadListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBroadcastUploadListenerEndpoint:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClientProxy_callingPID_bundleID_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientProxy:callingPID:bundleID:delegate:");
}

id objc_msgSend_initWithClientProxy_sessionType_callingPID_bundleID_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientProxy:sessionType:callingPID:bundleID:delegate:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_clientProxy_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:clientProxy:bundleIdentifier:");
}

id objc_msgSend_initWithConnectionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnectionManager:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithIsStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIsStart:");
}

id objc_msgSend_initWithItem_typeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItem:typeIdentifier:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMediaType_outputSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaType:outputSettings:");
}

id objc_msgSend_initWithMediaType_outputSettings_sourceFormatHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaType:outputSettings:sourceFormatHint:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithStatusBarStyleOverrides_forPID_exclusive_showsWhenForeground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:");
}

id objc_msgSend_initWithStreamDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStreamDescription:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithTapDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTapDescription:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_fileType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:fileType:error:");
}

id objc_msgSend_initWithURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:options:");
}

id objc_msgSend_initWithWindowSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowSize:");
}

id objc_msgSend_initWithWindowSize_outputPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowSize:outputPath:");
}

id objc_msgSend_initWithWindowSize_outputPath_videoCodecType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowSize:outputPath:videoCodecType:");
}

id objc_msgSend_inputSurfaceHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSurfaceHeight");
}

id objc_msgSend_inputSurfaceWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSurfaceWidth");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intToSCReportingAudioSampleRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intToSCReportingAudioSampleRate:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithIdentifier:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateConnection");
}

id objc_msgSend_invalidateStatusBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateStatusBar");
}

id objc_msgSend_isApplicationInForegroundWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplicationInForegroundWithBundleIdentifier:");
}

id objc_msgSend_isBroadcastSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBroadcastSetup");
}

id objc_msgSend_isClientScreenCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isClientScreenCapture");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinishingWriting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinishingWriting");
}

id objc_msgSend_isIPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIPad");
}

id objc_msgSend_isKeyFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeyFrame");
}

id objc_msgSend_isNativeScreenOrientationPortrait(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNativeScreenOrientationPortrait");
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOutgoing");
}

id objc_msgSend_isReadyForMoreMediaData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReadyForMoreMediaData");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isValidProcessId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidProcessId:");
}

id objc_msgSend_isVoiceOverRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVoiceOverRunning");
}

id objc_msgSend_lastAudio1PresentationTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastAudio1PresentationTime");
}

id objc_msgSend_lastAudio2PresentationTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastAudio2PresentationTime");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastVideoPresentationTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastVideoPresentationTime");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_limitRecordingWindowSizeFromSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "limitRecordingWindowSizeFromSize:");
}

id objc_msgSend_listAllRunningProcesses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listAllRunningProcesses:");
}

id objc_msgSend_listOfProcessesMatchingSameParentPid_withProcessList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listOfProcessesMatchingSameParentPid:withProcessList:");
}

id objc_msgSend_loadBroadcastUploadExtensionWithBaseIdentifier_broadcastExtensionBundleID_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadBroadcastUploadExtensionWithBaseIdentifier:broadcastExtensionBundleID:withHandler:");
}

id objc_msgSend_loadBroadcastUploadExtensionWithBaseIdentifier_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadBroadcastUploadExtensionWithBaseIdentifier:withHandler:");
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdentifier");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedFailureReason");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:localization:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_macApplicationDidBecomeActiveWithContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "macApplicationDidBecomeActiveWithContextID:completionHandler:");
}

id objc_msgSend_macApplicationDidResignActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "macApplicationDidResignActive");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_manualTriggeredReactionsCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manualTriggeredReactionsCount");
}

id objc_msgSend_markAsFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markAsFinished");
}

id objc_msgSend_metadataItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataItem");
}

id objc_msgSend_micEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "micEnabled");
}

id objc_msgSend_micFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "micFrameCount");
}

id objc_msgSend_microphoneEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "microphoneEnabled");
}

id objc_msgSend_minIntervalBetweenFrames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minIntervalBetweenFrames");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mixAudioForMovie_finalMovieURL_outputFileType_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:");
}

id objc_msgSend_mixAudioForMovie_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mixAudioForMovie:withCompletionHandler:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_movieWriterQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movieWriterQueue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_newAudioTapForAudioCaptureConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newAudioTapForAudioCaptureConfig:");
}

id objc_msgSend_newInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newInstance");
}

id objc_msgSend_newsroomBottomLeftWindowCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomBottomLeftWindowCount");
}

id objc_msgSend_newsroomBottomRightWindowCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomBottomRightWindowCount");
}

id objc_msgSend_newsroomFullScreenContentCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomFullScreenContentCount");
}

id objc_msgSend_newsroomSessionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomSessionCount");
}

id objc_msgSend_newsroomToFloatingTransitionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomToFloatingTransitionCount");
}

id objc_msgSend_newsroomTopLeftWindowCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomTopLeftWindowCount");
}

id objc_msgSend_newsroomTopRightWindowCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomTopRightWindowCount");
}

id objc_msgSend_newsroomTotalDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomTotalDuration");
}

id objc_msgSend_newsroomTotalFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newsroomTotalFrameCount");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notification");
}

id objc_msgSend_notifyClientSessionDidStopWithError_movieURL_showAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyClientSessionDidStopWithError:movieURL:showAlert:");
}

id objc_msgSend_notifyExtensionOfAction_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyExtensionOfAction:completion:");
}

id objc_msgSend_notifyExtensionOfVideoSampleBuffer_withType_sampleOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:");
}

id objc_msgSend_notifyInAppSessionShouldPauseOrResume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyInAppSessionShouldPauseOrResume:");
}

id objc_msgSend_notifyRecordingMayBeStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyRecordingMayBeStopped");
}

id objc_msgSend_notifyRecordingResumed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyRecordingResumed");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observers");
}

id objc_msgSend_observersCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observersCount");
}

id objc_msgSend_observersCountDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observersCountDidChange");
}

id objc_msgSend_openApplicationWithBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplicationWithBundleID:");
}

id objc_msgSend_openControlCenterSystemRecordingView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openControlCenterSystemRecordingView");
}

id objc_msgSend_orientationFromFigTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientationFromFigTransform:");
}

id objc_msgSend_originalOutputPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalOutputPath");
}

id objc_msgSend_outputPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputPath");
}

id objc_msgSend_outputPath_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputPath:bundleID:");
}

id objc_msgSend_outputURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputURL");
}

id objc_msgSend_parentProcessIdForProcessId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentProcessIdForProcessId:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pauseCurrentActiveSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseCurrentActiveSession");
}

id objc_msgSend_pauseInAppBroadcast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseInAppBroadcast");
}

id objc_msgSend_pauseInAppCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseInAppCapture");
}

id objc_msgSend_pauseInAppRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseInAppRecording");
}

id objc_msgSend_pauseSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseSession");
}

id objc_msgSend_performChangesAndWait_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performChangesAndWait:error:");
}

id objc_msgSend_periodic_urgency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "periodic:urgency:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pixelFormat");
}

id objc_msgSend_placeholderForCreatedAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholderForCreatedAsset");
}

id objc_msgSend_pluginKitProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginKitProxyForIdentifier:");
}

id objc_msgSend_portraitEffectTotalDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portraitEffectTotalDuration");
}

id objc_msgSend_portraitIntensityEndValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portraitIntensityEndValue");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferredLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguage");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_presentAcknowledgmentWithMicrophoneEnabled_cameraEnabled_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_presentModuleWithIdentifier_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentModuleWithIdentifier:options:completionHandler:");
}

id objc_msgSend_preserveAspectRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preserveAspectRatio");
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousState");
}

id objc_msgSend_processAcknowledgementSetupBroadcastWithMicrophoneEnabled_cameraEnabled_listenerEndpoint_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processNewConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processNewConnection:");
}

id objc_msgSend_processPayload_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processPayload:completion:");
}

id objc_msgSend_processSaveToPhotos_mixAudioTracks_ignoreDoNotDisturb_isClip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:");
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocolForProtocol:");
}

id objc_msgSend_purge_urgency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purge:urgency:");
}

id objc_msgSend_purgeable_urgency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeable:urgency:");
}

id objc_msgSend_queueAndWaitForSample_withAssetInput_withBuffer_didAppendIdleFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:");
}

id objc_msgSend_recordedFileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordedFileSize");
}

id objc_msgSend_recordingDidPause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingDidPause");
}

id objc_msgSend_recordingDidStopWithError_movieURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingDidStopWithError:movieURL:");
}

id objc_msgSend_recordingLockInterrupted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingLockInterrupted:");
}

id objc_msgSend_recordingOutputCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingOutputCount");
}

id objc_msgSend_recordingOutputDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingOutputDuration");
}

id objc_msgSend_recordingOutputFileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingOutputFileSize");
}

id objc_msgSend_recordingOutputFileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingOutputFileType");
}

id objc_msgSend_recordingOutputVideoCodecType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingOutputVideoCodecType");
}

id objc_msgSend_recordingTimerDidUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingTimerDidUpdate:");
}

id objc_msgSend_recordingTotalDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingTotalDuration");
}

id objc_msgSend_recordingTotalFileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingTotalFileSize");
}

id objc_msgSend_releaseSandboxExtensionHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseSandboxExtensionHandle:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteTargetWithLaunchingAssertionAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteTargetWithLaunchingAssertionAttributes:");
}

id objc_msgSend_removeAllDelegates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllDelegates");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeClient:");
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeInput:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeObserverWithProcessIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserverWithProcessIdentifier:");
}

id objc_msgSend_removeObserversForSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserversForSession");
}

id objc_msgSend_removeOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOutput:");
}

id objc_msgSend_removeSystemObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSystemObserver");
}

id objc_msgSend_replayKitScreenRecordingHEVC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replayKitScreenRecordingHEVC");
}

id objc_msgSend_reportCameraUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportCameraUsage:");
}

id objc_msgSend_reportEventWithType_dictionary_clientBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportEventWithType:dictionary:clientBundleId:");
}

id objc_msgSend_reportSCEventWithType_dictionary_streamID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportSCEventWithType:dictionary:streamID:");
}

id objc_msgSend_reportSessionEndReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportSessionEndReason:");
}

id objc_msgSend_reportSessionEnded_endReason_withServiceName_clientBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportSessionEnded:endReason:withServiceName:clientBundleId:");
}

id objc_msgSend_reportSummaryEvent_recordedFileSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportSummaryEvent:recordedFileSize:");
}

id objc_msgSend_reportingAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportingAgent");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestMediaDataWhenReadyOnQueue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestMediaDataWhenReadyOnQueue:usingBlock:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_resetReportingMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetReportingMetrics");
}

id objc_msgSend_resetThermalResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetThermalResults");
}

id objc_msgSend_restartAppAudioCaptureForProcessID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restartAppAudioCaptureForProcessID:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeCurrentActiveSessionWithContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeCurrentActiveSessionWithContextID:completionHandler:");
}

id objc_msgSend_resumeInAppBroadcastWithContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeInAppBroadcastWithContextID:completionHandler:");
}

id objc_msgSend_resumeInAppBroadcastWithWindowLayerContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeInAppBroadcastWithWindowLayerContextID:completionHandler:");
}

id objc_msgSend_resumeInAppCaptureWithContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeInAppCaptureWithContextID:completionHandler:");
}

id objc_msgSend_resumeInAppCaptureWithWindowLayerContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeInAppCaptureWithWindowLayerContextID:completionHandler:");
}

id objc_msgSend_resumeInAppClipWithContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeInAppClipWithContextID:completionHandler:");
}

id objc_msgSend_resumeInAppClipWithWindowLayerContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeInAppClipWithWindowLayerContextID:completionHandler:");
}

id objc_msgSend_resumeInAppRecordingWithContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeInAppRecordingWithContextID:completionHandler:");
}

id objc_msgSend_resumeInAppRecordingWithWindowLayerContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeInAppRecordingWithWindowLayerContextID:completionHandler:");
}

id objc_msgSend_resumeSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeSession");
}

id objc_msgSend_resumeSessionWithWindowLayerContextID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeSessionWithWindowLayerContextID:completionHandler:");
}

id objc_msgSend_resumeSystemBroadcastWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeSystemBroadcastWithCompletionHandler:");
}

id objc_msgSend_resumeSystemRecordingWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeSystemRecordingWithCompletionHandler:");
}

id objc_msgSend_resumeWithConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeWithConfig:");
}

id objc_msgSend_rotatingDeviceUniqueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotatingDeviceUniqueID");
}

id objc_msgSend_rpLocalizedStatusStringForPaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpLocalizedStatusStringForPaused:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_sampleBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sampleBuffer");
}

id objc_msgSend_saveClipToCameraRoll_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveClipToCameraRoll:handler:");
}

id objc_msgSend_saveToCameraRoll_mixAudioTracks_ignoreDoNotDisturb_isClip_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:");
}

id objc_msgSend_saveVideo_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveVideo:handler:");
}

id objc_msgSend_saveVideoToCameraRoll_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveVideoToCameraRoll:handler:");
}

id objc_msgSend_saveVideoToCameraRoll_sessionID_mixAudioTracks_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:");
}

id objc_msgSend_scaleToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scaleToFit");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_screenCaptureControllerWithSize_minIntervalBetweenFrames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenCaptureControllerWithSize:minIntervalBetweenFrames:");
}

id objc_msgSend_screenCaptureDidFailWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenCaptureDidFailWithError:");
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seconds");
}

id objc_msgSend_sendBiomeEventWithSessionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendBiomeEventWithSessionState:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendOneMessageWithSessionInfo_userInfo_category_type_payload_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:");
}

id objc_msgSend_sendReportEventWithType_dictionary_withServiceName_clientBundleId_sessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceNameForReporting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceNameForReporting");
}

id objc_msgSend_sessionDidStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionDidStop");
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionState");
}

id objc_msgSend_setAVAudioSessionCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAVAudioSessionCategory");
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivationHandler:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAppAudioFrameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppAudioFrameCount:");
}

id objc_msgSend_setApplicationStateMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationStateMonitor:");
}

id objc_msgSend_setAssertionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssertionDelegate:");
}

id objc_msgSend_setAssetWriter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetWriter:");
}

id objc_msgSend_setAssetWriterStartCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetWriterStartCount:");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedTitle:");
}

id objc_msgSend_setAudioInput1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioInput1:");
}

id objc_msgSend_setAudioInput2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioInput2:");
}

id objc_msgSend_setAudioMix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioMix:");
}

id objc_msgSend_setAutomaticallyConfiguresApplicationAudioSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticallyConfiguresApplicationAudioSession:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBroadcastHostBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBroadcastHostBundleId:");
}

id objc_msgSend_setBroadcastPickerPreferredExt_showsMicButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBroadcastPickerPreferredExt:showsMicButton:");
}

id objc_msgSend_setBroadcastServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBroadcastServiceName:");
}

id objc_msgSend_setBroadcastURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBroadcastURL:");
}

id objc_msgSend_setBroadcastURLHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBroadcastURLHandler:");
}

id objc_msgSend_setBroadcastUploadExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBroadcastUploadExtension:");
}

id objc_msgSend_setBroadcasting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBroadcasting:");
}

id objc_msgSend_setBufferArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBufferArray:");
}

id objc_msgSend_setCameraEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraEnabled:");
}

id objc_msgSend_setCaptureMicrophoneEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureMicrophoneEnabled:");
}

id objc_msgSend_setCategory_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:withOptions:error:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClient:");
}

id objc_msgSend_setClientBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientBundleID:");
}

id objc_msgSend_setClientMainBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientMainBundleID:");
}

id objc_msgSend_setClientMessagingExpectation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientMessagingExpectation:");
}

id objc_msgSend_setClientPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientPID:");
}

id objc_msgSend_setClientProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientProxy:");
}

id objc_msgSend_setCloneMirroringMode_contextIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCloneMirroringMode:contextIDs:");
}

id objc_msgSend_setColorMatrix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorMatrix:");
}

id objc_msgSend_setColorSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorSpace:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setConnectionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionManager:");
}

id objc_msgSend_setConnectionReadyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionReadyHandler:");
}

id objc_msgSend_setConnectionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionSet:");
}

id objc_msgSend_setContextID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContextID:");
}

id objc_msgSend_setCurrentActiveSessionMicrophoneEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentActiveSessionMicrophoneEnabled:");
}

id objc_msgSend_setCurrentAvailableExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentAvailableExtensions:");
}

id objc_msgSend_setCurrentConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentConnection:");
}

id objc_msgSend_setCurrentConnectionProcessIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentConnectionProcessIdentifier:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setDeviceLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLocked:");
}

id objc_msgSend_setDidProcessFirstSample_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidProcessFirstSample:");
}

id objc_msgSend_setDurationInSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDurationInSeconds:");
}

id objc_msgSend_setEndReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndReason:");
}

id objc_msgSend_setEndpoint_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndpoint:completionHandler:");
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorHandler:");
}

id objc_msgSend_setExpectsMediaDataInRealTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpectsMediaDataInRealTime:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFigVirtualDisplayOption_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFigVirtualDisplayOption:forKey:");
}

id objc_msgSend_setFirstSampleReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirstSampleReceived:");
}

id objc_msgSend_setFrontCameraUsed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontCameraUsed:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setIOSurface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIOSurface:");
}

id objc_msgSend_setIncludesApproximationPhrase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludesApproximationPhrase:");
}

id objc_msgSend_setIncludesTimeRemainingPhrase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludesTimeRemainingPhrase:");
}

id objc_msgSend_setInputParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputParameters:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceTarget:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsClientScreenCapture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsClientScreenCapture:");
}

id objc_msgSend_setIsFinishingWriting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFinishingWriting:");
}

id objc_msgSend_setIsKeyFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsKeyFrame:");
}

id objc_msgSend_setIsVideo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsVideo:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setKeySpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeySpace:");
}

id objc_msgSend_setLastAudio1PresentationTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastAudio1PresentationTime:");
}

id objc_msgSend_setLastAudio2PresentationTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastAudio2PresentationTime:");
}

id objc_msgSend_setLastVideoPresentationTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastVideoPresentationTime:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListenerEndpoint:");
}

id objc_msgSend_setMaximumUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumUnitCount:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMicFrameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMicFrameCount:");
}

id objc_msgSend_setMicrophoneEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMicrophoneEnabled:");
}

id objc_msgSend_setNeedsUserInteractivePriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUserInteractivePriority:");
}

id objc_msgSend_setNewestSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNewestSeconds:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationCategories:");
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

id objc_msgSend_setOldestSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOldestSeconds:");
}

id objc_msgSend_setOriginalOutputPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalOutputPath:");
}

id objc_msgSend_setOutputFileType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputFileType:");
}

id objc_msgSend_setOutputPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputPath:");
}

id objc_msgSend_setOutputURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputURL:");
}

id objc_msgSend_setPixelFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPixelFormat:");
}

id objc_msgSend_setPreviousState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousState:");
}

id objc_msgSend_setProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocol:");
}

id objc_msgSend_setRecordedFileSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordedFileSize:");
}

id objc_msgSend_setRegisteredStyleOverrides_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegisteredStyleOverrides:reply:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSampleBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSampleBuffer:");
}

id objc_msgSend_setSampleBufferDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSampleBufferDelegate:queue:");
}

id objc_msgSend_setScreenSharingHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenSharingHost:");
}

id objc_msgSend_setSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeconds:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setServiceInfoHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceInfoHandler:");
}

id objc_msgSend_setServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceName:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setSessionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionState:");
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:");
}

id objc_msgSend_setShouldMoveFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldMoveFile:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setStatusString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusString:");
}

id objc_msgSend_setStreamID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamID:");
}

id objc_msgSend_setStreamUpdateFilterTimers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamUpdateFilterTimers:");
}

id objc_msgSend_setSystemBroadcastHostBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemBroadcastHostBundleId:");
}

id objc_msgSend_setSystemObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemObserver:");
}

id objc_msgSend_setTargetQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetQueue:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setTimeRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeRange:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTrackID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackID:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setTrimVideoPresentationTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrimVideoPresentationTime:");
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnitsStyle:");
}

id objc_msgSend_setUpAssetWriterWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpAssetWriterWithHandler:");
}

id objc_msgSend_setUpDeviceLockNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpDeviceLockNotifications");
}

id objc_msgSend_setUpFrontBoardServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpFrontBoardServices");
}

id objc_msgSend_setUpMemoryPressureNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpMemoryPressureNotification");
}

id objc_msgSend_setUpStatusBarAssertionWithServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpStatusBarAssertionWithServiceName:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserNotificationCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserNotificationCenter:");
}

id objc_msgSend_setUsesApplicationAudioSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsesApplicationAudioSession:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVideoCodecType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoCodecType:");
}

id objc_msgSend_setVideoFrameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoFrameCount:");
}

id objc_msgSend_setVideoInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoInput:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWindowSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindowSize:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setZeroFormattingBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZeroFormattingBehavior:");
}

id objc_msgSend_setupAssetWriter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAssetWriter");
}

id objc_msgSend_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:");
}

id objc_msgSend_setupConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupConnection");
}

id objc_msgSend_setupDispatchLimits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDispatchLimits");
}

id objc_msgSend_setupInAppBroadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:");
}

id objc_msgSend_setupNewConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupNewConnection:");
}

id objc_msgSend_setupSystemBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPhotoLibrary");
}

id objc_msgSend_shouldBypassAlertForTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldBypassAlertForTest");
}

id objc_msgSend_shouldReportBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldReportBundleID:");
}

id objc_msgSend_shouldResumeSessionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldResumeSessionType:");
}

id objc_msgSend_shouldSupressAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSupressAlert");
}

id objc_msgSend_showAcknowledgementAlertWithMicrophone_camera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAcknowledgementAlertWithMicrophone:camera:");
}

id objc_msgSend_showAlertFailedSaveToPhotosWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertFailedSaveToPhotosWithError:");
}

id objc_msgSend_showAlertForBroadcastSessionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertForBroadcastSessionWithError:");
}

id objc_msgSend_showAlertRecordingCaptureSessionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertRecordingCaptureSessionWithError:");
}

id objc_msgSend_showAlertWithTitle_bodyText_defaultButtonText_secondaryButtonText_url_requireReponse_imageURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:");
}

id objc_msgSend_showCursor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCursor");
}

id objc_msgSend_showMouseClicks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showMouseClicks");
}

id objc_msgSend_showResumeBroadcastAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showResumeBroadcastAlert");
}

id objc_msgSend_showSavedToPhotosBannerWithPhotosURL_identifier_sessionID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:");
}

id objc_msgSend_showStopSystemSessionAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showStopSystemSessionAlert");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAcknowledgementAlertTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAcknowledgementAlertTimer");
}

id objc_msgSend_startAppAudioCaptureForSystemRecording_processID_contextIDs_outputHandler_didStartHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAppAudioCaptureForSystemRecording:processID:contextIDs:outputHandler:didStartHandler:");
}

id objc_msgSend_startBroadcastWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_listenerEndpoint_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:");
}

id objc_msgSend_startCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCapture");
}

id objc_msgSend_startCaptureForDelegate_forProcessID_shouldStartMicrophoneCapture_windowSize_systemRecording_contextIDs_didStartHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:");
}

id objc_msgSend_startCaptureForDelegate_forProcessID_shouldStartMicrophoneCapture_windowSize_systemRecording_contextIDs_mixedRealityCamera_didStartHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:mixedRealityCamera:didStartHandler:");
}

id objc_msgSend_startCaptureManagersForProcessID_windowSize_systemRecording_contextIDs_mixedRealityCamera_dispatchGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:dispatchGroup:");
}

id objc_msgSend_startCaptureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCaptureSession");
}

id objc_msgSend_startCaptureWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:");
}

id objc_msgSend_startClipBufferingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:");
}

id objc_msgSend_startClipWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:");
}

id objc_msgSend_startInAppBroadcastSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:");
}

id objc_msgSend_startInAppBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:");
}

id objc_msgSend_startInAppCaptureSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startInAppCaptureWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppCaptureWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startInAppClipSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startInAppRecordingSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startInAppRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startMicrophoneCaptureWithDispatchGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMicrophoneCaptureWithDispatchGroup:");
}

id objc_msgSend_startMicrophoneCaptureWithOutput_didStartHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMicrophoneCaptureWithOutput:didStartHandler:");
}

id objc_msgSend_startRecordingWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:");
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRunning");
}

id objc_msgSend_startSessionAtSourceTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSessionAtSourceTime:");
}

id objc_msgSend_startSessionWithPID_windowSize_systemRecording_contextIDs_mixedRealityCamera_outputHandler_didStartHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:outputHandler:didStartHandler:");
}

id objc_msgSend_startSystemBroadcastSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSystemBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:");
}

id objc_msgSend_startSystemBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSystemBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:");
}

id objc_msgSend_startSystemBroadcastWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_listenerEndpoint_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSystemBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:withHandler:");
}

id objc_msgSend_startSystemRecordingSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startSystemRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startSystemRecordingWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:");
}

id objc_msgSend_startWithCompositeMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithCompositeMode");
}

id objc_msgSend_startWithConfig_outputHandler_didStartHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithConfig:outputHandler:didStartHandler:");
}

id objc_msgSend_startWriting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWriting");
}

id objc_msgSend_startWritingHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWritingHandler:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAllActiveClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAllActiveClients");
}

id objc_msgSend_stopAllCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAllCapture");
}

id objc_msgSend_stopAllClientStreamsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAllClientStreamsWithError:");
}

id objc_msgSend_stopAllClientsWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAllClientsWithHandler:");
}

id objc_msgSend_stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:");
}

id objc_msgSend_stopAppAudioCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAppAudioCapture");
}

id objc_msgSend_stopBroadcastWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopBroadcastWithHandler:");
}

id objc_msgSend_stopCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCapture");
}

id objc_msgSend_stopCaptureForDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCaptureForDelegate:");
}

id objc_msgSend_stopCaptureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCaptureSession");
}

id objc_msgSend_stopCaptureWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCaptureWithHandler:");
}

id objc_msgSend_stopClipBufferingWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopClipBufferingWithCompletionHandler:");
}

id objc_msgSend_stopClipWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopClipWithHandler:");
}

id objc_msgSend_stopCurrentActiveSessionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCurrentActiveSessionWithHandler:");
}

id objc_msgSend_stopInAppBroadcastSessionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopInAppBroadcastSessionWithHandler:");
}

id objc_msgSend_stopInAppBroadcastWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopInAppBroadcastWithHandler:");
}

id objc_msgSend_stopInAppCaptureSessionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopInAppCaptureSessionWithHandler:");
}

id objc_msgSend_stopInAppCaptureWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopInAppCaptureWithHandler:");
}

id objc_msgSend_stopInAppClipSessionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopInAppClipSessionWithHandler:");
}

id objc_msgSend_stopInAppRecordingSessionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopInAppRecordingSessionWithHandler:");
}

id objc_msgSend_stopInAppRecordingWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopInAppRecordingWithHandler:");
}

id objc_msgSend_stopInAppRecordingWithUrl_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopInAppRecordingWithUrl:handler:");
}

id objc_msgSend_stopMicrophoneCapture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMicrophoneCapture");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stopRecordingWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRecordingWithHandler:");
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRunning");
}

id objc_msgSend_stopSystemBroadcastSessionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSystemBroadcastSessionWithHandler:");
}

id objc_msgSend_stopSystemBroadcastWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSystemBroadcastWithHandler:");
}

id objc_msgSend_stopSystemRecordingSessionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSystemRecordingSessionWithHandler:");
}

id objc_msgSend_stopSystemRecordingSessionWithURLHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSystemRecordingSessionWithURLHandler:");
}

id objc_msgSend_stopSystemRecordingWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSystemRecordingWithHandler:");
}

id objc_msgSend_stopSystemRecordingWithURLHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSystemRecordingWithURLHandler:");
}

id objc_msgSend_streamID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamID");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringToSCReportingColorMatrix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringToSCReportingColorMatrix:");
}

id objc_msgSend_stringToSCReportingColorSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringToSCReportingColorSpace:");
}

id objc_msgSend_stringToSCReportingPixelFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringToSCReportingPixelFormat:");
}

id objc_msgSend_stringToSCReportingRecordingFileType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringToSCReportingRecordingFileType:");
}

id objc_msgSend_stringToSCReportingRecordingVideoCodecType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringToSCReportingRecordingVideoCodecType:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithTimeInterval:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_studioLightEffectTotalDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "studioLightEffectTotalDuration");
}

id objc_msgSend_studioLightIntensityEndValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "studioLightIntensityEndValue");
}

id objc_msgSend_supportsShutterSound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsShutterSound");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_systemBannerEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBannerEnabled");
}

id objc_msgSend_systemBroadcastSessionAudioQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBroadcastSessionAudioQueue");
}

id objc_msgSend_systemBroadcastSessionVideoQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBroadcastSessionVideoQueue");
}

id objc_msgSend_systemObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemObserver");
}

id objc_msgSend_targetFrameRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetFrameRate");
}

id objc_msgSend_tempFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tempFileURL");
}

id objc_msgSend_thermalDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thermalDescription");
}

id objc_msgSend_thermalPressureDidChangeWithLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thermalPressureDidChangeWithLevel:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timerDidUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerDidUpdate:");
}

id objc_msgSend_totalAudioFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalAudioFrameCount");
}

id objc_msgSend_totalFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalFrameCount");
}

id objc_msgSend_totalMicFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalMicFrameCount");
}

id objc_msgSend_trackID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackID");
}

id objc_msgSend_tracksWithMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tracksWithMediaType:");
}

id objc_msgSend_trimVideoPresentationTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trimVideoPresentationTime");
}

id objc_msgSend_uniqueClientIdentifierWithPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueClientIdentifierWithPID:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updateBroadcastServiceInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBroadcastServiceInfo:");
}

id objc_msgSend_updateBroadcastURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBroadcastURL:");
}

id objc_msgSend_updateClient_withHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_isSystemBroadcast_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:");
}

id objc_msgSend_updateClientProxy_callingPID_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClientProxy:callingPID:bundleID:");
}

id objc_msgSend_updateContextIDs_forProcessID_systemRecording_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContextIDs:forProcessID:systemRecording:");
}

id objc_msgSend_updateLatestSampleTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLatestSampleTime:");
}

id objc_msgSend_updateOutputPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateOutputPath");
}

id objc_msgSend_updatePauseOffsetForSampleBuffer_withSampleType_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePauseOffsetForSampleBuffer:withSampleType:handler:");
}

id objc_msgSend_updatePauseOffsetFromVideoBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePauseOffsetFromVideoBuffer:");
}

id objc_msgSend_updateProcessIDForAudioCaptureWithPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProcessIDForAudioCaptureWithPID:");
}

id objc_msgSend_updateReportingSampleCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateReportingSampleCount:");
}

id objc_msgSend_updateScreenRecordingStateWithCurrentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateScreenRecordingStateWithCurrentState:");
}

id objc_msgSend_updateTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTimer:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInitiated");
}

id objc_msgSend_userNotificationCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNotificationCenter");
}

id objc_msgSend_uuidFromLocalIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuidFromLocalIdentifier:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_videoCaptureRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoCaptureRate");
}

id objc_msgSend_videoCaptureSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoCaptureSize");
}

id objc_msgSend_videoCodecType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoCodecType");
}

id objc_msgSend_videoCodecTypeForAVAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoCodecTypeForAVAsset:");
}

id objc_msgSend_videoCompressionProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoCompressionProperties");
}

id objc_msgSend_videoFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoFrameCount");
}

id objc_msgSend_videoInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoInput");
}

id objc_msgSend_volumeMatchesCachePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeMatchesCachePath:");
}

id objc_msgSend_waitForCompletionAndFinishWriting_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForCompletionAndFinishWriting:withHandler:");
}

id objc_msgSend_weekOfYear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekOfYear");
}

id objc_msgSend_windowSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowSize");
}

id objc_msgSend_yearForWeekOfYear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "yearForWeekOfYear");
}
