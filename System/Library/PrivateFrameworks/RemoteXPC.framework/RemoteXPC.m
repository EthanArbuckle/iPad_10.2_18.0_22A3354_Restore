void __xpc_remote_channel_send_block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t error_code;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = a1[4];
      v7 = a1[8];
      v12 = 134218498;
      v13 = v6;
      v14 = 2048;
      v15 = v7;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_INFO, "[%p] Send of msg_id %llu complete with error=%@.", (uint8_t *)&v12, 0x20u);
    }

    error_code = nw_error_get_error_code(v3);
  }
  else
  {
    if (v5)
    {
      v9 = a1[4];
      v10 = a1[8];
      v12 = 134218240;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_INFO, "[%p] Send of msg_id %llu completed successfully", (uint8_t *)&v12, 0x16u);
    }

    error_code = 0;
  }
  v11 = a1[5];
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, error_code);

}

void ___xpc_remote_connection_send_reply_message_block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___xpc_remote_connection_send_reply_message_block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] Reply send completed", (uint8_t *)&v7, 0xCu);
  }

}

void ___xpc_remote_connection_handle_read_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = 134218240;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_1D4245000, v2, OS_LOG_TYPE_INFO, "[%p] Handler block for %llx complete, re-arming", (uint8_t *)&v5, 0x16u);
  }

  xpc_remote_channel_arm_read(*(void **)(a1 + 40));
}

void xpc_remote_channel_arm_read(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD completion[4];
  NSObject *v7;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!*((_DWORD *)v1 + 12))
  {
    if (v1[2])
    {
      _log_0();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        xpc_remote_channel_arm_read_cold_3();

      v4 = v2[2];
      completion[0] = MEMORY[0x1E0C809B0];
      completion[1] = 3221225472;
      completion[2] = __xpc_remote_channel_arm_read_block_invoke;
      completion[3] = &unk_1E9784B60;
      v7 = v2;
      nw_connection_receive(v4, 0x18u, 0x18u, completion);
      v5 = v7;
    }
    else
    {
      if (*((_DWORD *)v1 + 10) <= 2u)
        xpc_remote_channel_arm_read_cold_1(&v8, v9);
      _log_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        xpc_remote_channel_arm_read_cold_2();
    }

  }
}

void xpc_remote_connection_send_reply(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  xpc_dictionary_get_remote_connection(v3);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1)
    xpc_remote_connection_send_reply_cold_1(&v4, v5);
  v2 = v1;

  xpc_remote_connection_send_message(v2, v3);
}

void xpc_remote_connection_send_message(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  if (MEMORY[0x1D825AA08]() != MEMORY[0x1E0C812F8])
    xpc_remote_connection_send_message_cold_1();
  objc_msgSend(v3, "internal_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __xpc_remote_connection_send_message_block_invoke;
  block[3] = &unk_1E97845D0;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_sync(v5, block);

}

void ___xpc_remote_connection_handle_read_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;

  if (objc_msgSend(*(id *)(a1 + 32), "state") <= 5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "internal_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___xpc_remote_connection_handle_read_block_invoke_3;
  v3[3] = &unk_1E9784960;
  v4 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 64);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);

}

void __xpc_remote_connection_send_message_block_invoke(uint64_t a1)
{
  uint64_t reply_msg_id;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[88];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 2)
    __xpc_remote_connection_send_message_block_invoke_cold_1(&v8, buf);
  if (objc_msgSend(*(id *)(a1 + 32), "state") <= 5)
  {
    reply_msg_id = _xpc_dictionary_get_reply_msg_id();
    if (!reply_msg_id || objc_msgSend(*(id *)(a1 + 32), "state") == 4)
    {
      _xpc_remote_message_create(*(void **)(a1 + 32), *(void **)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      _log();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
      if (reply_msg_id)
      {
        if (v5)
        {
          v6 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v6;
          _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_INFO, "[%p] Sending outgoing reply", buf, 0xCu);
        }

        _xpc_remote_connection_send_reply_message(*(void **)(a1 + 32), v3);
      }
      else
      {
        if (v5)
        {
          v7 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v7;
          _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_INFO, "[%p] Enqueueing outgoing message", buf, 0xCu);
        }

        _xpc_remote_connection_enqueue_message(*(void **)(a1 + 32), v3);
      }

    }
  }
}

_QWORD *_xpc_remote_message_create(void *a1, void *a2)
{
  _QWORD *v3;
  id v4;
  _QWORD *v5;
  uint64_t reply_msg_id;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  const void *v10;
  dispatch_data_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  size_t v19;

  v3 = a1;
  v4 = a2;
  v5 = (_QWORD *)objc_opt_new();
  reply_msg_id = _xpc_dictionary_extract_reply_msg_id();
  v5[1] = reply_msg_id;
  if (reply_msg_id)
  {
    xpc_dictionary_get_remote_connection(v4);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v7 != v3)
      _xpc_remote_message_create_cold_2();
  }
  else
  {
    v5[1] = v3[18];
    v3[18] += 2;
  }
  v19 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ___xpc_remote_message_create_block_invoke;
  v16[3] = &unk_1E9784AC8;
  v8 = v5;
  v17 = v8;
  v9 = v3;
  v18 = v9;
  v10 = (const void *)MEMORY[0x1D825AA2C](v4, &v19, v16);
  if (!v10 || !v19)
    _xpc_remote_message_create_cold_1();
  v11 = dispatch_data_create(v10, v19, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
  v12 = (void *)v8[3];
  v8[3] = v11;

  v13 = v18;
  v14 = v8;

  return v14;
}

void _xpc_remote_connection_send_reply_message(void *a1, void *a2)
{
  _BYTE *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  int v13;
  _BYTE *v14;
  __int16 v15;
  uint64_t v16;
  _OWORD v17[5];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v4[1] || (v4[1] & 1) != v3[65])
  {
    v12 = 0;
    memset(v17, 0, sizeof(v17));
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    v9 = v4[1];
    v13 = 134218240;
    v14 = v3;
    v15 = 2048;
    v16 = v9;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_6:
    _xpc_remote_connection_send_reply_message_cold_1(&v13, v17);
  }
  if (objc_msgSend(v3, "state") != 4)
    goto LABEL_6;
  v5 = v4[1];
  _xpc_remote_connection_send_ool_message_content(v3, v4);
  v6 = (void *)*((_QWORD *)v3 + 7);
  v7 = (void *)v4[3];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___xpc_remote_connection_send_reply_message_block_invoke;
  v10[3] = &unk_1E97848C0;
  v11 = v3;
  v8 = v3;
  xpc_remote_channel_send(v6, v5, 131073, v7, v10);

}

void xpc_remote_channel_send(void *a1, uint64_t a2, int a3, void *a4, void *a5)
{
  dispatch_queue_t *v9;
  NSObject *v10;
  void (**v11)(id, uint64_t);
  id v12;
  NSObject *v13;
  NSObject *concat;
  NSObject *v15;
  uint64_t v16;
  size_t size;
  NSObject *v18;
  NSObject *v19;
  void (**v20)(id, uint64_t);
  dispatch_queue_t *v21;
  _QWORD v22[4];
  dispatch_queue_t *v23;
  void (**v24)(id, uint64_t);
  __int128 v25;
  uint64_t v26;
  __int128 buffer;
  uint64_t v28;
  uint8_t buf[4];
  dispatch_queue_t *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  size_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a4;
  v11 = a5;
  dispatch_assert_queue_V2(v9[1]);
  if (v11 && *((_DWORD *)v9 + 10) >= 3u)
    v11[2](v11, 89);
  if (!v10)
  {
    v10 = MEMORY[0x1E0C80D00];
    v12 = MEMORY[0x1E0C80D00];
  }
  LODWORD(buffer) = 699403154;
  BYTE4(buffer) = *((_BYTE *)v9 + 73);
  BYTE5(buffer) = a3;
  WORD3(buffer) = HIWORD(a3);
  *((_QWORD *)&buffer + 1) = dispatch_data_get_size(v10);
  v28 = a2;
  v13 = dispatch_data_create(&buffer, 0x18uLL, 0, 0);
  concat = dispatch_data_create_concat(v13, v10);
  _log_0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = v28;
    size = dispatch_data_get_size(v10);
    *(_DWORD *)buf = 134218496;
    v30 = v9;
    v31 = 2048;
    v32 = v16;
    v33 = 2048;
    v34 = size;
    _os_log_impl(&dword_1D4245000, v15, OS_LOG_TYPE_INFO, "[%p] Starting write of msg_id %llu (%zd bytes).", buf, 0x20u);
  }

  v18 = v9[2];
  v19 = *MEMORY[0x1E0CCECE8];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __xpc_remote_channel_send_block_invoke;
  v22[3] = &unk_1E9784B88;
  v25 = buffer;
  v26 = v28;
  v23 = v9;
  v24 = v11;
  v20 = v11;
  v21 = v9;
  nw_connection_send(v18, concat, v19, 1, v22);

}

void _xpc_remote_connection_send_ool_message_content(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t transfer_id;
  void *v8;
  _QWORD *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id *v22;
  _QWORD *v23;
  id *v24;
  id *v25;
  id *v26;
  id *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  int *v32;
  int *v33;
  id v34;
  _QWORD *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  _QWORD *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[5];
  id v53;
  uint8_t v54[4];
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE buf[24];
  void *v61;
  id v62;
  id v63;
  uint64_t *v64;
  _QWORD *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v36 = a1;
  v32 = a2;
  if (v32[8] >= 1)
  {
    v3 = 0;
    v33 = v32 + 10;
    do
    {
      v4 = *(id *)&v33[2 * v3];
      if (MEMORY[0x1D825AA08]() != MEMORY[0x1E0C81320])
        _xpc_remote_connection_send_ool_message_content_cold_2();
      v5 = v36;
      v6 = v4;
      transfer_id = xpc_file_transfer_get_transfer_id();
      v8 = (void *)xpc_file_transfer_copy_io();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = ___send_file_transfer_block_invoke;
      v37[3] = &unk_1E97849D8;
      v34 = v6;
      v38 = v34;
      v39 = v5;
      v9 = v39;
      v10 = v8;
      v35 = v37;
      objc_msgSend(v9, "internal_queue");
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v11);

      if (objc_msgSend(v9, "state") != 4)
        _xpc_remote_connection_send_ool_message_content_cold_1(v40, buf);
      _log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = transfer_id;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v61) = 1;
        _os_log_impl(&dword_1D4245000, v12, OS_LOG_TYPE_DEFAULT, "[%p] Opening stream_id %lld with direction %x", buf, 0x1Cu);
      }

      _xpc_remote_connection_create_sub_nw_connection(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x3032000000;
      v52[3] = __Block_byref_object_copy__231;
      v52[4] = __Block_byref_object_dispose__232;
      v53 = 0;
      v53 = (id)MEMORY[0x1D825A744](v35);
      v46 = 0;
      v47 = &v46;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy_;
      v50 = __Block_byref_object_dispose_;
      v51 = 0;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = ___xpc_remote_connection_open_stream_block_invoke;
      v40[3] = &unk_1E9784A00;
      v42 = &v46;
      v44 = transfer_id;
      v45 = 1;
      v14 = v9;
      v41 = v14;
      v43 = v52;
      v15 = (void *)MEMORY[0x1D825A744](v40);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___xpc_remote_connection_open_stream_block_invoke_233;
      v61 = &unk_1E9784A28;
      v16 = v14;
      v66 = transfer_id;
      v62 = v16;
      v64 = &v46;
      v67 = 1;
      v17 = v10;
      v63 = v17;
      v65 = v52;
      v18 = (void *)MEMORY[0x1D825A744](buf);
      objc_msgSend(v16, "internal_queue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_remote_channel_create(v13, v19, *((_BYTE *)v36 + 66), 0, v15, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v47[5];
      v47[5] = v20;

      v22 = (id *)objc_opt_new();
      objc_storeStrong(v22 + 1, (id)v47[5]);
      v23 = v16;
      v24 = v22;
      v25 = v24;
      if (*((_QWORD *)v36 + 14))
      {
        v26 = (id *)*((id *)v36 + 15);
        objc_storeStrong(v26 + 2, v22);
      }
      else
      {
        v27 = v24;
        v26 = (id *)*((_QWORD *)v36 + 14);
        *((_QWORD *)v36 + 14) = v27;
      }

      v28 = (void *)*((_QWORD *)v36 + 15);
      *((_QWORD *)v36 + 15) = v25;

      _log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v47[5];
        *(_DWORD *)v54 = 134218496;
        v55 = v36;
        v56 = 2048;
        v57 = transfer_id;
        v58 = 2048;
        v59 = v30;
        _os_log_impl(&dword_1D4245000, v29, OS_LOG_TYPE_DEFAULT, "[%p] Opened stream %lld (%p)", v54, 0x20u);
      }

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(v52, 8);

      v31 = *(void **)&v33[2 * v3];
      *(_QWORD *)&v33[2 * v3] = 0;

      ++v3;
    }
    while (v3 < v32[8]);
  }

}

void sub_1D4247B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void _xpc_remote_message_create_cold_1()
{
  _os_crash();
  __break(1u);
}

void ___xpc_remote_channel_header_handler_block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  unsigned int error_code;
  void *v20;
  size_t size;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  _QWORD *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  size_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = *(unsigned int *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v16 = v9;
  v17 = v11;
  if (v17)
  {
    _log_0();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      ___xpc_remote_channel_header_handler_block_invoke_cold_3();

    error_code = nw_error_get_error_code(v17);
    v20 = v15;
LABEL_5:
    xpc_remote_channel_cancel(v20, error_code);
    goto LABEL_6;
  }
  if (!v16)
  {
    if ((a4 & 1) == 0)
      _os_assumes_log();
    _log_0();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      ___xpc_remote_channel_header_handler_block_invoke_cold_1();

    v20 = v15;
    error_code = 57;
    goto LABEL_5;
  }
  size = dispatch_data_get_size(v16);
  _log_0();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (size != v12)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = 134218496;
      v26 = v15;
      v27 = 2048;
      v28 = v12;
      v29 = 2048;
      v30 = dispatch_data_get_size(v16);
      _os_log_error_impl(&dword_1D4245000, v23, OS_LOG_TYPE_ERROR, "[%p] Body read returned with short data (message_size=%llu, data_size=%zu), disconnecting", (uint8_t *)&v25, 0x20u);
    }

    v20 = v15;
    error_code = 22;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    ___xpc_remote_channel_header_handler_block_invoke_cold_2();

  _xpc_remote_channel_deliver_message(v15, v13, v14, v16);
LABEL_6:

}

void _xpc_remote_channel_deliver_message(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSObject *v7;
  id v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a1[1];
  v8 = a4;
  v9 = a1;
  dispatch_assert_queue_V2(v7);
  _log_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = a2;
    _os_log_impl(&dword_1D4245000, v10, OS_LOG_TYPE_INFO, "Delivering %llu", (uint8_t *)&v12, 0xCu);
  }

  v11 = v9[4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, a2, a3, v8);

}

void _xpc_remote_connection_handle_read(void *a1, void *a2, objc_class *a3, uint64_t a4, void *a5)
{
  NSObject *v9;
  Class v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_data_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  int64_t int64;
  objc_class *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id *v40;
  id *v41;
  id *v42;
  id *v43;
  NSObject *v44;
  id *v45;
  id *v46;
  id *v47;
  id *v48;
  id *v49;
  id *v50;
  id *v51;
  id *v52;
  NSObject *v53;
  id *v54;
  id *v55;
  id v56;
  _QWORD *v57;
  _QWORD *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  NSObject *v64;
  id *v65;
  void *v66;
  dispatch_data_t v67;
  id *v68;
  _QWORD block[4];
  NSObject *v70;
  id v71;
  objc_class *v72;
  id v73;
  objc_class *v74;
  uint64_t v75;
  _QWORD v76[4];
  id *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, void *);
  void *v82;
  NSObject *v83;
  size_t size_ptr;
  _BYTE buf[12];
  __int16 v86;
  objc_class *v87;
  __int16 v88;
  const char *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a5;
  v12 = v11;
  if (a4 == 2)
  {
    _log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1D4245000, v14, OS_LOG_TYPE_INFO, "[%p] Received a PING", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!(_BYTE)a4)
  {
    if (-[NSObject state](v9, "state") >= 5)
    {
      _log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1D4245000, v13, OS_LOG_TYPE_INFO, "[%p] Ignoring HELO received after disconnect", buf, 0xCu);
      }
      goto LABEL_6;
    }
    if (v9[5].isa != v10)
    {
      if (v9[7].isa != v10)
      {
        _log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          _xpc_remote_connection_handle_read_cold_15();
LABEL_54:

        v32 = v9;
LABEL_55:
        _xpc_remote_connection_disconnect(v32, 53);
        goto LABEL_56;
      }
      if (LOBYTE(v9[6].isa))
      {
        _log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          _xpc_remote_connection_handle_read_cold_14();
        goto LABEL_54;
      }
      LOBYTE(v9[6].isa) = 1;
      _log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1D4245000, v20, OS_LOG_TYPE_INFO, "[%p] Received reply channel HELO", buf, 0xCu);
      }
LABEL_60:

      v14 = v9;
      if (-[NSObject state](v14, "state") != 3)
        _xpc_remote_connection_handle_read_cold_9(&size_ptr, buf);
      if (LOBYTE(v14[4].isa))
      {
        if (LOBYTE(v14[6].isa))
        {
          -[NSObject setState:](v14, "setState:", 4);
          _xpc_remote_connection_wakeup(v14);
LABEL_9:

LABEL_10:
          xpc_remote_channel_arm_read(v10);
          goto LABEL_56;
        }
        _log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          _xpc_remote_connection_handle_read_cold_8();
      }
      else
      {
        _log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          _xpc_remote_connection_handle_read_cold_7();
      }

      goto LABEL_9;
    }
    if (LOBYTE(v9[4].isa))
    {
      _log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        _xpc_remote_connection_handle_read_cold_13();
      goto LABEL_54;
    }
    LOBYTE(v9[4].isa) = 1;
    _log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1D4245000, v19, OS_LOG_TYPE_INFO, "[%p] Received root channel HELO", buf, 0xCu);
    }

    v20 = v9;
    if (v12 != MEMORY[0x1E0C80D00] && v12)
    {
      *(_QWORD *)buf = 0;
      size_ptr = 0;
      v21 = dispatch_data_create_map(v12, (const void **)buf, &size_ptr);
      v22 = xpc_create_from_serialization();
      v23 = v22;
      if (v22)
      {
        v24 = MEMORY[0x1D825AA08](v22);
        v25 = MEMORY[0x1E0C812F8];

        if (v24 == v25)
        {
          v26 = (void *)MEMORY[0x1D825A96C](v23);
          _log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            _xpc_remote_connection_handle_read_cold_12();

          free(v26);
          int64 = xpc_dictionary_get_int64(v23, "ServiceVersion");
          if (int64)
          {
            v29 = (objc_class *)int64;
            _log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v20;
              v86 = 2048;
              v87 = v29;
              _os_log_impl(&dword_1D4245000, v30, OS_LOG_TYPE_INFO, "[%p] HELO message specified ServiceVersion %lld", buf, 0x16u);
            }

            v20[21].isa = v29;
          }
LABEL_59:

          goto LABEL_60;
        }
      }
      else
      {

      }
      _log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        _xpc_remote_connection_handle_read_cold_11();

      v32 = v20;
      goto LABEL_55;
    }
    _log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      _xpc_remote_connection_handle_read_cold_10();
    goto LABEL_59;
  }
  if (a4 != 1 || !a3)
    goto LABEL_10;
  if ((~(_DWORD)a4 & 0x30000) == 0)
  {
    _log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      _xpc_remote_connection_handle_read_cold_1();
    goto LABEL_54;
  }
  if ((a4 & 0x20000) != 0)
  {
    if (v9[7].isa != v10 && ((uint64_t)v9[9].isa & 4) != 0)
    {
      _log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        _xpc_remote_connection_handle_read_cold_6();
      goto LABEL_54;
    }
    if (!v11)
    {
      v18 = (void *)MEMORY[0x1E0C81258];
      v34 = MEMORY[0x1E0C81258];
      goto LABEL_67;
    }
  }
  else if (!v11)
  {
    _log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      _xpc_remote_connection_handle_read_cold_2();
    goto LABEL_54;
  }
  *(_QWORD *)buf = 0;
  size_ptr = 0;
  v67 = dispatch_data_create_map(v11, (const void **)buf, &size_ptr);
  MEMORY[0x1D825AA44]();
  v79 = MEMORY[0x1E0C809B0];
  v80 = 3221225472;
  v81 = ___xpc_remote_connection_handle_read_block_invoke;
  v82 = &unk_1E9784938;
  v16 = v9;
  v83 = v16;
  v17 = xpc_receive_remote_msg();
  if (!v17)
  {
    v18 = v67;
    _log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      _xpc_remote_connection_handle_read_cold_3();

    _xpc_remote_connection_disconnect(v16, 53);
    goto LABEL_81;
  }
  v18 = (void *)v17;

LABEL_67:
  _log();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = "(wanting reply)";
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v9;
    if ((a4 & 0x10000) == 0)
      v36 = (const char *)&unk_1D4256231;
    v86 = 2048;
    v87 = a3;
    v88 = 2082;
    v89 = v36;
    _os_log_impl(&dword_1D4245000, v35, OS_LOG_TYPE_INFO, "[%p] Message %llx received %{public}s, dispatching handler block", buf, 0x20u);
  }

  if ((a4 & 0x20000) != 0)
  {
    v40 = v9;
    v41 = (id *)v40[16];
    if (!v41)
    {
LABEL_77:

      goto LABEL_78;
    }
    v42 = v41;
    while (v42[1] != a3)
    {
      v43 = (id *)v42[4];

      v42 = v43;
      if (!v43)
        goto LABEL_77;
    }
    v45 = v40;
    v46 = v42;
    v47 = v46;
    v48 = (id *)v40[16];
    if (v48 == v46)
    {
      v54 = v46;
      objc_storeStrong(v40 + 16, v54[4]);
      v55 = (id *)v54[4];
      if (!v55)
      {
        v56 = v45[17];
        v45[17] = 0;

        v55 = (id *)v54[4];
      }
      v54[4] = 0;
    }
    else
    {
      v49 = v48;
      if (!v49)
        goto LABEL_103;
      v50 = v49;
      while (1)
      {
        v51 = (id *)v50[4];
        if (v51 == v47)
          break;
        v52 = v51;

        v50 = v52;
        if (!v52)
          goto LABEL_103;
      }
      v68 = v45;
      v55 = v50;
      v57 = v50[4];
      if (!v57)
        _xpc_remote_connection_handle_read_cold_5(&size_ptr, buf);
      v58 = v57;

      v66 = v58;
      v59 = (void *)v58[4];
      v60 = v59;
      v61 = v59;
      v62 = v60;
      objc_storeStrong(v50 + 4, v61);
      v63 = v62;
      v45 = v68;
      if (!v63)
      {
        objc_storeStrong(v68 + 17, v50);
        v63 = 0;
      }

      v54 = v55;
    }

LABEL_103:
    if (v47)
    {
      v64 = v47[3];
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = ___xpc_remote_connection_handle_read_block_invoke_228;
      v76[3] = &unk_1E97845D0;
      v77 = v47;
      v78 = v18;
      v65 = v47;
      dispatch_async(v64, v76);
      xpc_remote_channel_arm_read(v10);

LABEL_81:
      goto LABEL_56;
    }
LABEL_78:
    _log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      _xpc_remote_connection_handle_read_cold_4();

    _xpc_remote_connection_disconnect(v40, 53);
    goto LABEL_81;
  }
  -[NSObject event_handler](v9, "event_handler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject target_queue](v9, "target_queue");
  v38 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___xpc_remote_connection_handle_read_block_invoke_2;
  block[3] = &unk_1E9784988;
  v70 = v9;
  v71 = v18;
  v73 = v37;
  v74 = a3;
  v75 = a4;
  v72 = v10;
  v13 = v18;
  v39 = v37;
  dispatch_async(v38, block);

LABEL_6:
LABEL_56:

}

void ___xpc_remote_connection_connect_complete_block_invoke_2(uint64_t a1, objc_class *a2, uint64_t a3, void *a4)
{
  _xpc_remote_connection_handle_read(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 40), a2, a3, a4);
}

void __xpc_remote_channel_arm_read_block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject **v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  unsigned int error_code;
  NSObject **v17;
  dispatch_data_t v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject **v22;
  unsigned int v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  int v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  size_t size_ptr;
  void *buffer_ptr;
  _BYTE buf[32];
  NSObject **v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = (NSObject **)*(id *)(a1 + 32);
  v13 = v9;
  v14 = v11;
  if (!v14)
  {
    if (!v13)
    {
      if ((a4 & 1) == 0)
        _os_assumes_log();
      _log_0();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_1D4245000, v25, OS_LOG_TYPE_INFO, "[%p] Header read returned without data, disconnecting", buf, 0xCu);
      }

      v17 = v12;
      error_code = 57;
      goto LABEL_5;
    }
    size_ptr = 0;
    buffer_ptr = 0;
    v18 = dispatch_data_create_map(v13, (const void **)&buffer_ptr, &size_ptr);
    _log_0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      __xpc_remote_channel_arm_read_block_invoke_cold_5();

    if (size_ptr == 24 && *(_DWORD *)buffer_ptr == 699403154)
    {
      if (*((unsigned __int8 *)buffer_ptr + 4) == *((unsigned __int8 *)v12 + 73))
      {
        v20 = *((_QWORD *)buffer_ptr + 1);
        if (!(v20 >> 27))
        {
          v31 = *((_QWORD *)buffer_ptr + 2);
          v32 = *((unsigned __int8 *)buffer_ptr + 5);
          v33 = *((unsigned __int16 *)buffer_ptr + 3);
          v34 = v32 | (v33 << 16);
          if ((_DWORD)v20)
          {
            if (v12[2])
            {
              _log_0();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                __xpc_remote_channel_arm_read_block_invoke_cold_4();

              v36 = v12[2];
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = ___xpc_remote_channel_header_handler_block_invoke;
              *(_QWORD *)&buf[24] = &unk_1E9784BD8;
              v42 = v12;
              v43 = v31;
              v44 = v34;
              v45 = v20;
              nw_connection_receive(v36, v20, v20, buf);

            }
            else
            {
              if (*((_DWORD *)v12 + 10) <= 2u)
                __xpc_remote_channel_arm_read_block_invoke_cold_2(&v38, buf);
              _log_0();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                __xpc_remote_channel_arm_read_block_invoke_cold_3();

            }
          }
          else
          {
            _xpc_remote_channel_deliver_message(v12, v31, v32 | (v33 << 16), 0);
          }
          goto LABEL_19;
        }
        _log_0();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __xpc_remote_channel_arm_read_block_invoke_cold_1();

        v22 = v12;
        v23 = 40;
LABEL_18:
        xpc_remote_channel_cancel(v22, v23);
LABEL_19:

        goto LABEL_20;
      }
      _log_0();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v26 = *((unsigned __int8 *)buffer_ptr + 4);
        v27 = *((unsigned __int8 *)v12 + 73);
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v26;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v27;
        v28 = "[%p] Invalid wire version: %d != %d";
        v29 = v24;
        v30 = 24;
LABEL_34:
        _os_log_error_impl(&dword_1D4245000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
      }
    }
    else
    {
      _log_0();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = size_ptr;
        *(_WORD *)&buf[18] = 2096;
        *(_QWORD *)&buf[20] = buffer_ptr;
        v28 = "[%p] Invalid header received: %.*P";
        v29 = v24;
        v30 = 28;
        goto LABEL_34;
      }
    }

    v22 = v12;
    v23 = 22;
    goto LABEL_18;
  }
  _log_0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_1D4245000, v15, OS_LOG_TYPE_INFO, "[%p] Header read returned with error=%@, disconnecting", buf, 0x16u);
  }

  error_code = nw_error_get_error_code(v14);
  v17 = v12;
LABEL_5:
  xpc_remote_channel_cancel(v17, error_code);
LABEL_20:

}

id _log()
{
  if (_log_onceToken != -1)
    dispatch_once(&_log_onceToken, &__block_literal_global_192);
  return (id)_log_logger;
}

id _log_0()
{
  if (_log_onceToken_0 != -1)
    dispatch_once(&_log_onceToken_0, &__block_literal_global_0);
  return (id)_log_logger_0;
}

unint64_t xpc_remote_connection_get_version_flags()
{
  return ((unint64_t)XPC_REMOTE_CONNECTION_PROTOCOL_VERSION_CURRENT << 56) | 6;
}

uint64_t xpc_remote_connection_get_failsafe_version_flags()
{
  return 0x100000000000000;
}

uint64_t xpc_remote_connection_get_remote_service_version(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = a1;
  if (!v1)
    xpc_remote_connection_get_remote_service_version_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v1, "internal_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __xpc_remote_connection_get_remote_service_version_block_invoke;
  v7[3] = &unk_1E97844E8;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D4249054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __xpc_remote_connection_get_remote_service_version_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 168);
  return result;
}

void xpc_remote_connection_set_local_service_version(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a1;
  if (!v3)
    xpc_remote_connection_get_remote_service_version_cold_1();
  v4 = v3;
  objc_msgSend(v3, "internal_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __xpc_remote_connection_set_local_service_version_block_invoke;
  block[3] = &unk_1E9784510;
  v8 = v4;
  v9 = a2;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __xpc_remote_connection_set_local_service_version_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if ((_DWORD)result)
    __xpc_remote_connection_set_local_service_version_block_invoke_cold_1();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = *(_QWORD *)(a1 + 40);
  return result;
}

uint64_t xpc_remote_connection_create_with_remote_service(void *a1, void *a2, char a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t xpc_remote_connection_version_flags;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char xpc_remote_connection_mode_flags;

  v6 = a1;
  v7 = a2;
  if (!v6)
    xpc_remote_connection_create_with_remote_service_cold_1();
  v8 = v7;
  v9 = _xpc_remote_connection_alloc();
  objc_msgSend((id)v9, "setType:", 1);
  objc_msgSend((id)v9, "setTarget_queue:", v8);
  objc_storeStrong((id *)(v9 + 184), a1);
  *(_QWORD *)(v9 + 168) = remote_service_get_version();
  xpc_remote_connection_version_flags = remote_service_get_xpc_remote_connection_version_flags();
  if (!xpc_remote_connection_version_flags)
    goto LABEL_8;
  v11 = xpc_remote_connection_version_flags;
  if (!HIBYTE(xpc_remote_connection_version_flags) || (xpc_remote_connection_version_flags & 1) != 0)
  {
    _log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      xpc_remote_connection_create_with_remote_service_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);

LABEL_8:
    v11 = 0x100000000000000;
  }
  if (remote_service_xpc_remote_connection_tls_enabled())
  {
    remote_service_copy_xpc_remote_connection_tls_identity();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
      xpc_remote_connection_create_with_remote_service_cold_2();
    v21 = (void *)v20;
    remote_service_copy_xpc_remote_connection_tls_verify_block();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "internal_queue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_set_tls((void *)v9, v21, v22, v23);

  }
  v24 = (void *)remote_service_copy_device();
  xpc_remote_connection_mode_flags = remote_device_get_xpc_remote_connection_mode_flags();
  _xpc_remote_connection_parse_flags((void *)v9, v11, xpc_remote_connection_mode_flags | a3);

  return v9;
}

uint64_t _xpc_remote_connection_alloc()
{
  uint64_t v0;
  NSObject *v1;
  dispatch_queue_t v2;

  if (install_libxpc_hooks_onceToken != -1)
    dispatch_once(&install_libxpc_hooks_onceToken, &__block_literal_global_190);
  v0 = objc_opt_new();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.xpc.remote.internal", v1);
  objc_msgSend((id)v0, "setInternal_queue:", v2);

  *(_DWORD *)(v0 + 192) = -1;
  *(_QWORD *)(v0 + 144) = 1;
  return v0;
}

void xpc_remote_connection_set_tls(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;

  v11 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v11, "state"))
    xpc_remote_connection_set_tls_cold_3();
  if (!objc_msgSend(v11, "type") && v11[25])
    xpc_remote_connection_set_tls_cold_2();
  if (!v7)
    xpc_remote_connection_set_tls_cold_1();
  objc_msgSend(v11, "setTls_identity:", v7);
  v10 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v11, "setTls_verify:", v10);

  objc_msgSend(v11, "setTls_verify_queue:", v9);
}

void _xpc_remote_connection_parse_flags(void *a1, unint64_t a2, char a3)
{
  id v5;
  _BYTE *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  _xpc_remote_connection_parse_mode_flags(v5, a3);
  v6 = v5;
  v7 = HIBYTE(a2);
  if (!HIBYTE(a2) || (a2 & 1) != 0)
    _xpc_remote_connection_parse_flags_cold_1(&v9, v10);
  if (XPC_REMOTE_CONNECTION_PROTOCOL_VERSION_CURRENT < v7)
    LOBYTE(v7) = XPC_REMOTE_CONNECTION_PROTOCOL_VERSION_CURRENT;
  v6[66] = v7;
  *((_QWORD *)v6 + 9) = a2 & 6;
  v8 = v6;

}

_DWORD *xpc_remote_connection_create_with_connected_fd(int a1, void *a2, unint64_t a3, char a4)
{
  id v7;
  _DWORD *v8;

  v7 = a2;
  v8 = (_DWORD *)_xpc_remote_connection_alloc();
  objc_msgSend(v8, "setType:", 0);
  objc_msgSend(v8, "setTarget_queue:", v7);

  v8[48] = a1;
  _xpc_remote_connection_parse_flags(v8, a3, a4);
  return v8;
}

_QWORD *xpc_remote_connection_create_with_nw_connection(void *a1, void *a2, unint64_t a3, char a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;

  v7 = a1;
  v8 = a2;
  v9 = (_QWORD *)_xpc_remote_connection_alloc();
  objc_msgSend(v9, "setType:", 0);
  objc_msgSend(v9, "setTarget_queue:", v8);

  v10 = (void *)v9[25];
  v9[25] = v7;

  _xpc_remote_connection_parse_flags(v9, a3, a4);
  return v9;
}

_QWORD *xpc_remote_connection_create_remote_service_listener(const char *a1, void *a2, char a3)
{
  id v5;
  void *v6;
  _QWORD *v7;

  v5 = a2;
  if (!a1)
    xpc_remote_connection_create_remote_service_listener_cold_1();
  v6 = v5;
  v7 = (_QWORD *)_xpc_remote_connection_alloc();
  objc_msgSend(v7, "setType:", 2);
  v7[1] = strdup(a1);
  objc_msgSend(v7, "setTarget_queue:", v6);
  _xpc_remote_connection_parse_mode_flags(v7, a3 | 1);

  return v7;
}

void _xpc_remote_connection_parse_mode_flags(void *a1, char a2)
{
  _BYTE *v3;
  _BYTE *v4;
  NSObject *v5;

  v3 = a1;
  v4 = v3;
  if ((a2 & 1) != 0)
  {
    v3[65] = 1;
    *((_QWORD *)v3 + 18) = 2;
    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      _xpc_remote_connection_parse_mode_flags_cold_1();

  }
  if ((a2 & 2) != 0)
    v4[208] = 1;
  v4[64] = (a2 & 4) != 0;

}

void xpc_remote_connection_create_connected_pair(_QWORD *a1, _QWORD *a2, void *a3, unint64_t a4, char a5)
{
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10[0] = 0;
  if (!socketpair(1, 1, 0, (int *)v10))
  {
    *a1 = xpc_remote_connection_create_with_connected_fd(v10[0], v9, a4, a5);
    *a2 = xpc_remote_connection_create_with_connected_fd(SHIDWORD(v10[0]), v9, a4, a5 | 1u);
  }

}

uint64_t xpc_remote_connection_create_asymmetric_connected_ipv6_pair(_QWORD *a1, unint64_t a2, char a3, _QWORD *a4, unint64_t a5, char a6, void *a7)
{
  id v13;
  void *v14;
  uint64_t connected_ipv6_pair;

  v13 = a7;
  _log();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  connected_ipv6_pair = remote_socket_create_connected_ipv6_pair();

  if (!(_DWORD)connected_ipv6_pair)
  {
    *a1 = xpc_remote_connection_create_with_connected_fd(0, v13, a2, a3);
    *a4 = xpc_remote_connection_create_with_connected_fd(0, v13, a5, a6 | 1u);
  }

  return connected_ipv6_pair;
}

uint64_t xpc_remote_connection_create_connected_ipv6_pair(_QWORD *a1, _QWORD *a2, void *a3, unint64_t a4, char a5)
{
  return xpc_remote_connection_create_asymmetric_connected_ipv6_pair(a1, a4, a5, a2, a4, a5, a3);
}

uint64_t xpc_remote_connection_copy_remote_address_string(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = a1;
  if (!v1)
    xpc_remote_connection_get_remote_service_version_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v1, "internal_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __xpc_remote_connection_copy_remote_address_string_block_invoke;
  v7[3] = &unk_1E9784538;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D424997C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __xpc_remote_connection_copy_remote_address_string_block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = nw_connection_copy_connected_remote_endpoint();
    if (v2)
    {
      v3 = v2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = nw_endpoint_copy_address_string(v2);
      v2 = v3;
    }

  }
}

id xpc_remote_connection_copy_remote_endpoint(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v1 = a1;
  if (!v1)
    xpc_remote_connection_get_remote_service_version_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  objc_msgSend(v1, "internal_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __xpc_remote_connection_copy_remote_endpoint_block_invoke;
  v7[3] = &unk_1E9784538;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_1D4249AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __xpc_remote_connection_copy_remote_endpoint_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = nw_connection_copy_connected_remote_endpoint();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void xpc_remote_connection_set_event_handler(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if (objc_msgSend(v4, "state"))
    xpc_remote_connection_set_tls_cold_3();
  objc_msgSend(v4, "setEvent_handler:", v3);

}

void xpc_remote_connection_set_target_queue(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if (objc_msgSend(v4, "state"))
    xpc_remote_connection_set_tls_cold_3();
  objc_msgSend(v4, "setTarget_queue:", v3);

}

void xpc_remote_connection_set_traffic_class(void *a1, int a2)
{
  _DWORD *v3;

  v3 = a1;
  if (objc_msgSend(v3, "state"))
    xpc_remote_connection_set_tls_cold_3();
  v3[44] = a2;

}

uint64_t xpc_remote_connection_is_server(void *a1)
{
  unsigned __int8 *v1;
  uint64_t v2;

  v1 = a1;
  if (!v1)
    xpc_remote_connection_get_remote_service_version_cold_1();
  v2 = v1[65];

  return v2;
}

uint64_t xpc_remote_connection_create_configure_tls_block(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __xpc_remote_connection_create_configure_tls_block_block_invoke;
  v13[3] = &unk_1E9784560;
  v15 = v7;
  v16 = v6;
  v14 = v5;
  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = objc_msgSend(v13, "copy");

  return v11;
}

void __xpc_remote_connection_create_configure_tls_block_block_invoke(uint64_t a1, id a2)
{
  void *v3;
  NSObject *v4;
  NSObject *options;

  options = a2;
  sec_protocol_options_set_local_identity(options, *(sec_identity_t *)(a1 + 32));
  sec_protocol_options_set_min_tls_protocol_version(options, tls_protocol_version_TLSv12);
  sec_protocol_options_set_max_tls_protocol_version(options, tls_protocol_version_TLSv12);
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);
  sec_protocol_options_set_peer_authentication_required(options, 1);
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 40);
    if (v4)
      sec_protocol_options_set_verify_block(options, v3, v4);
  }

}

void xpc_remote_connection_setup_nw_parameters(void *a1)
{
  id v1;
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[88];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  nw_protocol_http2_transport_identifier();
  v2 = (id)nw_parameters_create_protocol_parameters();
  if (!v2)
    xpc_remote_connection_setup_nw_parameters_cold_1(&v5, buf);
  v3 = v2;

  if (xpc_remote_connection_setup_nw_parameters_pred != -1)
    dispatch_once(&xpc_remote_connection_setup_nw_parameters_pred, &__block_literal_global);
  if (xpc_remote_connection_setup_nw_parameters_window_size != 0x100000)
  {
    _log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = xpc_remote_connection_setup_nw_parameters_window_size;
      _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_DEFAULT, "Using non-default XPC_REMOTE_CONNECTION_H2_WINDOW_SIZE=%d", buf, 8u);
    }

  }
  nw_protocol_http2_transport_parameters_set_stream_receive_window_size();
  nw_protocol_http2_transport_parameters_set_connection_receive_window_size();
  nw_parameters_set_data_mode();
  nw_parameters_set_server_mode();
  nw_parameters_add_protocol_stack_member();

}

const char *__xpc_remote_connection_setup_nw_parameters_block_invoke()
{
  const char *result;

  result = getenv("XPC_REMOTE_CONNECTION_H2_WINDOW_SIZE");
  if (result)
  {
    result = (const char *)strtoul(result, 0, 0);
    if (result)
      xpc_remote_connection_setup_nw_parameters_window_size = (int)result;
  }
  return result;
}

void xpc_remote_connection_activate(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  objc_msgSend(v1, "internal_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __xpc_remote_connection_activate_block_invoke;
  block[3] = &unk_1E97845A8;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

void __xpc_remote_connection_activate_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  int v6;
  void *v7;
  _QWORD *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  void (*v16)(uint64_t, void *, int);
  void *v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "event_handler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      __xpc_remote_connection_activate_block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_queue_create("com.apple.xpc.remote.target", v4);
      objc_msgSend(*(id *)(a1 + 32), "setTarget_queue:", v5);

    }
    v6 = objc_msgSend(*(id *)(a1 + 32), "type");
    v7 = *(void **)(a1 + 32);
    if (v6 == 2)
    {
      v8 = v7;
      objc_msgSend(v8, "internal_queue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v9);

      if (objc_msgSend(v8, "type") != 2)
        __xpc_remote_connection_activate_block_invoke_cold_3(&v14, &v15);
      if (objc_msgSend(v8, "state"))
        __xpc_remote_connection_activate_block_invoke_cold_2(&v14, &v15);
      objc_msgSend(v8, "setState:", 4);
      v10 = v8[1];
      objc_msgSend(v8, "internal_queue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v15 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v15 + 1) = 3221225472;
      v16 = ___xpc_remote_connection_listen_block_invoke;
      v17 = &unk_1E9784700;
      v18 = v8;
      v12 = v8;
      xpc_remote_listener_create_for_remote_service(v10, v11, &v15, &__block_literal_global_199);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setListener:", v13);

    }
    else
    {
      objc_msgSend(v7, "setState:", 1);
      if (!objc_msgSend(*(id *)(a1 + 32), "type"))
        _xpc_remote_connection_connect(*(void **)(a1 + 32));
    }
  }
}

void _xpc_remote_connection_connect(void *a1)
{
  _QWORD *v1;
  NSObject *v2;
  NSObject *v3;
  int v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint8_t buf[88];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "internal_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (objc_msgSend(v1, "state") != 1)
    _xpc_remote_connection_connect_cold_1(&v7, buf);
  objc_msgSend(v1, "setState:", 2);
  _log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v1;
    _os_log_impl(&dword_1D4245000, v3, OS_LOG_TYPE_INFO, "[%p] Connecting", buf, 0xCu);
  }

  v1[19] = v1[18];
  v4 = objc_msgSend(v1, "type");
  switch(v4)
  {
    case 0:
      goto LABEL_8;
    case 1:
      objc_msgSend(v1, "internal_queue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v1;
      remote_service_connect_socket();

      break;
    case 2:
      __break(1u);
LABEL_8:
      _xpc_remote_connection_connect_complete(v1, -1);
      break;
  }

}

void xpc_remote_connection_cancel(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  objc_msgSend(v1, "internal_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __xpc_remote_connection_cancel_block_invoke;
  block[3] = &unk_1E97845A8;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

void __xpc_remote_connection_cancel_block_invoke(uint64_t a1)
{
  _xpc_remote_connection_cancel(*(void **)(a1 + 32));
}

void _xpc_remote_connection_cancel(void *a1)
{
  NSObject *v1;
  id v2;

  v2 = a1;
  objc_msgSend(v2, "internal_queue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v1);

  __xpc_remote_connection_teardown(v2, 0, 89);
}

void _xpc_remote_connection_enqueue_message(void *a1, void *a2)
{
  _QWORD *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  id *v12;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "internal_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = v3[10];
  v12 = v3;
  v7 = v4;
  v8 = v7;
  if (v3[10])
  {
    v9 = (id *)v12[11];
    objc_storeStrong(v9 + 21, a2);
  }
  else
  {
    v10 = v7;
    v9 = (id *)v3[10];
    v3[10] = v10;
  }

  v11 = v12[11];
  v12[11] = v8;

  if (!v6)
    _xpc_remote_connection_wakeup(v12);

}

void xpc_remote_connection_send_barrier(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "internal_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __xpc_remote_connection_send_barrier_block_invoke;
  block[3] = &unk_1E97845F8;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_sync(v5, block);

}

void __xpc_remote_connection_send_barrier_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[88];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 2)
    __xpc_remote_connection_send_message_block_invoke_cold_1(&v8, buf);
  if (objc_msgSend(*(id *)(a1 + 32), "state") < 6)
  {
    v2 = (_QWORD *)objc_opt_new();
    v3 = MEMORY[0x1D825A744](*(_QWORD *)(a1 + 40));
    v4 = (void *)v2[2];
    v2[2] = v3;

    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] Enqueueing barrier", buf, 0xCu);
    }

    _xpc_remote_connection_enqueue_message(*(void **)(a1 + 32), v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, *(dispatch_block_t *)(a1 + 40));

  }
}

void xpc_remote_connection_send_message_with_reply(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (MEMORY[0x1D825AA08](v8) != MEMORY[0x1E0C812F8])
    xpc_remote_connection_send_message_cold_1();
  objc_msgSend(v7, "internal_queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __xpc_remote_connection_send_message_with_reply_block_invoke;
  block[3] = &unk_1E9784648;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  dispatch_sync(v11, block);

}

void __xpc_remote_connection_send_message_with_reply_block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void **v10;
  id v11;
  void *v12;
  void **v13;
  void *v14;
  void **v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "type") == 2)
    __xpc_remote_connection_send_message_block_invoke_cold_1(&v20, buf);
  if (_xpc_dictionary_get_reply_msg_id())
    __xpc_remote_connection_send_message_with_reply_block_invoke_cold_2(&v20, buf);
  v2 = a1[6];
  if (!v2)
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(a1[4], "state") < 6)
  {
    _xpc_remote_message_create(a1[4], a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v3 + 176) = 1;
    _log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = a1[4];
      v6 = *(_QWORD *)(v3 + 8);
      *(_DWORD *)buf = 134218240;
      v22 = v5;
      v23 = 2048;
      v24 = v6;
      _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_INFO, "[%p] Enqueueing send of %llx", buf, 0x16u);
    }

    _xpc_remote_connection_enqueue_message(a1[4], (void *)v3);
    v7 = objc_opt_new();
    *(_QWORD *)(v7 + 8) = *(_QWORD *)(v3 + 8);
    objc_storeStrong((id *)(v7 + 24), v2);
    v8 = MEMORY[0x1D825A744](a1[7]);
    v9 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v8;

    v10 = (void **)a1[4];
    v11 = (id)v7;
    v12 = v11;
    v13 = v10 + 16;
    if (v10[16])
      v13 = (void **)((char *)v10[17] + 32);
    v14 = *v13;
    *v13 = v11;
    v15 = v10;
    v16 = v12;

    v17 = v15[17];
    v15[17] = v16;

  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __xpc_remote_connection_send_message_with_reply_block_invoke_50;
    v18[3] = &unk_1E9784620;
    v19 = a1[7];
    dispatch_async(v2, v18);
    v3 = (uint64_t)v19;
  }

}

uint64_t __xpc_remote_connection_send_message_with_reply_block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id xpc_remote_connection_send_message_with_reply_sync(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  int v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "internal_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  _log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    xpc_remote_connection_send_message_with_reply_sync_cold_4();

  v7 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  objc_msgSend(v3, "internal_queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __xpc_remote_connection_send_message_with_reply_sync_block_invoke;
  v16[3] = &unk_1E9784670;
  v19 = &v20;
  v9 = v3;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  xpc_remote_connection_send_message_with_reply(v9, v4, v8, v16);

  _log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    xpc_remote_connection_send_message_with_reply_sync_cold_3();

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (!v21[5])
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    v26 = 134217984;
    v27 = 0;
    _os_log_send_and_compose_impl();
    v15 = _os_crash_msg();
    xpc_remote_connection_send_message_with_reply_sync_cold_1(v15);
  }
  _log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    xpc_remote_connection_send_message_with_reply_sync_cold_2();

  v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

void sub_1D424AD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __xpc_remote_connection_send_message_with_reply_sync_block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __xpc_remote_connection_send_message_with_reply_sync_block_invoke_cold_1();

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t _xpc_remote_connection_desc(void *a1, char *a2, size_t a3)
{
  unsigned __int8 *v5;
  const char *v6;
  const char *v7;
  const char *remote_service_name;
  size_t v9;

  if (a3 < 2)
    return 1;
  v5 = a1;
  v6 = type2str[objc_msgSend(v5, "type")];
  v7 = state2str[objc_msgSend(v5, "state")];
  remote_service_name = _xpc_remote_connection_get_remote_service_name(v5);
  LODWORD(a2) = snprintf(a2, a3, "<%s: %p> { type = %s, state = %s, remote service name = %s, server mode = %d, protocol version number = %u, protocol feature flags = 0x%llx, local service version = %llu, remote service version = %llu, traffic class = %u }", "remote connection", v5, v6, v7, remote_service_name, v5[65], v5[66], *((_QWORD *)v5 + 9), *((_QWORD *)v5 + 20), *((_QWORD *)v5 + 21), *((_DWORD *)v5 + 44));

  v9 = (int)a2;
  if ((int)a2 >= a3)
    v9 = a3 - 1;
  return v9 + 1;
}

uint64_t _xpc_remote_connection_debug_desc(void *a1, char *a2, size_t a3)
{
  unsigned __int8 *v4;
  const char *remote_service_name;
  int v6;
  size_t v7;
  const char *v9;
  const char *v10;

  if (a3 < 2)
    return 1;
  v4 = a1;
  v10 = type2str[objc_msgSend(v4, "type")];
  v9 = state2str[objc_msgSend(v4, "state")];
  remote_service_name = _xpc_remote_connection_get_remote_service_name(v4);
  v6 = snprintf(a2, a3, "<%s: %p> { type = %s, state = %s, remote service name = %s, server mode = %d, protocol version number = %u, protocol feature flags = 0x%llx, local service version = %llu, remote service version = %llu, traffic class = %u, (root, reply) helo received = (%d, %d), next msg id = %llu, first msg id = %llu, send in progress = %d, preexisting socket = %d", "remote connection", v4, v10, v9, remote_service_name, v4[65], v4[66], *((_QWORD *)v4 + 9), *((_QWORD *)v4 + 20), *((_QWORD *)v4 + 21), *((_DWORD *)v4 + 44), v4[32], v4[48],
         *((_QWORD *)v4 + 18),
         *((_QWORD *)v4 + 19),
         objc_msgSend(v4, "send_in_progress"),
         *((_DWORD *)v4 + 48));

  v7 = v6;
  if (v6 >= a3)
    v7 = a3 - 1;
  return v7 + 1;
}

uint64_t __install_libxpc_hooks_block_invoke()
{
  xpc_extension_type_init();
  objc_opt_class();
  qword_1ED0D3FF0 = objc_claimAutoreleasedReturnValue();
  return xpc_install_remote_hooks();
}

void xpc_remote_connection_message_dispose(void *a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a1;
  objc_msgSend(v3, "internal_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __xpc_remote_connection_message_dispose_block_invoke;
  v6[3] = &unk_1E9784510;
  v7 = v3;
  v8 = a2;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __xpc_remote_connection_message_dispose_block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 2)
    __xpc_remote_connection_send_message_block_invoke_cold_1(&v9, buf);
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 4)
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(id *)(a1 + 32);
    if (!v2)
      __xpc_remote_connection_message_dispose_block_invoke_cold_2(&v9, buf);
    v4 = v3;
    v5 = objc_opt_new();
    *(_QWORD *)(v5 + 8) = v2;
    objc_storeStrong((id *)(v5 + 24), MEMORY[0x1E0C80D00]);

    _log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218240;
      v11 = v7;
      v12 = 2048;
      v13 = v8;
      _os_log_impl(&dword_1D4245000, v6, OS_LOG_TYPE_INFO, "[%p] Sending error reply for msg_id %llu", buf, 0x16u);
    }

    _xpc_remote_connection_send_reply_message(*(void **)(a1 + 32), (void *)v5);
  }
}

void ___log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.xpc.remote", "connection");
  v1 = (void *)_log_logger;
  _log_logger = (uint64_t)v0;

}

void ___xpc_remote_connection_listen_block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  char v7;
  unint64_t xpc_remote_connection_version_flags;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  _DWORD *v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  _OWORD v37[5];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5)
    ___xpc_remote_connection_listen_block_invoke_cold_1(&v36, v37);
  if (a3 == -1)
    ___xpc_remote_connection_listen_block_invoke_cold_2(&v36, v37);
  v6 = v5;
  v7 = remote_device_get_xpc_remote_connection_mode_flags() | 1;
  xpc_remote_connection_version_flags = remote_device_get_xpc_remote_connection_version_flags();
  if (!xpc_remote_connection_version_flags)
    goto LABEL_9;
  v9 = xpc_remote_connection_version_flags;
  if (!HIBYTE(xpc_remote_connection_version_flags) || (xpc_remote_connection_version_flags & 1) != 0)
  {
    _log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ___xpc_remote_connection_listen_block_invoke_cold_4(v10, v11, v12, v13, v14, v15, v16, v17);

LABEL_9:
    v9 = 0x100000000000000;
  }
  objc_msgSend(*(id *)(a1 + 32), "target_queue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = xpc_remote_connection_create_with_connected_fd(a3, v18, v9, v7);

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(v20 + 160);
  if (v21)
  {
    xpc_remote_connection_set_local_service_version(v19, v21);
    v20 = *(_QWORD *)(a1 + 32);
  }
  v22 = *(_DWORD *)(v20 + 176);
  if (v22)
    xpc_remote_connection_set_traffic_class(v19, v22);
  if (remote_device_xpc_remote_connection_tls_enabled())
  {
    remote_device_copy_xpc_remote_connection_tls_identity();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      ___xpc_remote_connection_listen_block_invoke_cold_3();
    v24 = (void *)v23;
    remote_device_copy_xpc_remote_connection_tls_verify_block();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "internal_queue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_set_tls(v19, v24, v25, v26);

  }
  objc_msgSend(*(id *)(a1 + 32), "event_handler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "target_queue");
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___xpc_remote_connection_listen_block_invoke_196;
  block[3] = &unk_1E97846D8;
  v29 = *(id *)(a1 + 32);
  v34 = v19;
  v35 = v27;
  v33 = v29;
  v30 = v19;
  v31 = v27;
  dispatch_async(v28, block);

}

uint64_t ___xpc_remote_connection_listen_block_invoke_196(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result <= 5)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

void ___xpc_remote_connection_listen_block_invoke_2()
{
  _os_crash();
  __break(1u);
}

void _xpc_remote_connection_connect_complete(void *a1, int a2)
{
  id *v3;
  id *v4;
  id *v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id *v15;
  void *v16;
  char *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  _QWORD v31[4];
  char *v32;
  _QWORD v33[4];
  id *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  int v42;
  uint64_t v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3 + 5;
  if (v3[5])
    _xpc_remote_connection_connect_complete_cold_12(&v36, buf);
  v5 = v3;
  if (objc_msgSend(v3, "type"))
  {
    if (a2 == -1)
      _xpc_remote_connection_connect_complete_cold_11(&v36, buf);
  }
  else if (a2 != -1)
  {
    _xpc_remote_connection_connect_complete_cold_10(&v36, buf);
  }
  if (objc_msgSend(v5, "state") == 2)
  {
    if (objc_msgSend(v5, "type") || (v9 = *((_DWORD *)v5 + 48), v9 == -1))
    {
      if (a2 == -1)
      {
        v6 = v5[25];
        if (!v6)
          _xpc_remote_connection_connect_complete_cold_1();
        objc_storeStrong(v5 + 2, v6);
        v7 = v5[25];
        v5[25] = 0;

        goto LABEL_26;
      }
    }
    else
    {
      *((_DWORD *)v5 + 48) = -1;
      a2 = v9;
    }
    if (fcntl(a2, 4, 4) == -1)
      _xpc_remote_connection_connect_complete_cold_4(&v36, buf);
    if (fcntl(a2, 73, 1) == -1)
    {
      if (*__error() != 22)
        _xpc_remote_connection_connect_complete_cold_5(&v36, buf);
      _log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v5;
        _os_log_impl(&dword_1D4245000, v27, OS_LOG_TYPE_DEFAULT, "[%p] fcntl(F_SETNOSIGPIPE) failed with EINVAL", buf, 0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }
    else if (*((_DWORD *)v5 + 44) && (v42 = *((_DWORD *)v5 + 44), setsockopt(a2, 0xFFFF, 4230, &v42, 4u) == -1))
    {
      if (*__error() != 22)
        _xpc_remote_connection_connect_complete_cold_6(&v36, buf);
      _log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v5;
        _os_log_impl(&dword_1D4245000, v29, OS_LOG_TYPE_DEFAULT, "[%p] fcntl(SO_TRAFFIC_CLASS) failed with EINVAL", buf, 0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }
    else
    {
      _xpc_remote_connection_create_nw_parameters(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = nw_connection_create_with_connected_socket_and_parameters();
      if (v11)
      {
        v12 = v5[2];
        v5[2] = (id)v11;

LABEL_26:
        if (!*((_BYTE *)v5 + 208))
        {
          _log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4245000, v13, OS_LOG_TYPE_DEFAULT, "xpc_remote_connection_connect_complete setup_nw_listener", buf, 2u);
          }

          _xpc_remote_connection_setup_nw_listener(v5);
        }
        v36 = 0;
        v37 = &v36;
        v38 = 0x3032000000;
        v39 = __Block_byref_object_copy_;
        v40 = __Block_byref_object_dispose_;
        v41 = 0;
        v14 = MEMORY[0x1E0C809B0];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = ___xpc_remote_connection_connect_complete_block_invoke;
        v33[3] = &unk_1E97847D0;
        v15 = v5;
        v34 = v15;
        v35 = &v36;
        v16 = (void *)MEMORY[0x1D825A744](v33);
        v31[0] = v14;
        v31[1] = 3221225472;
        v31[2] = ___xpc_remote_connection_connect_complete_block_invoke_2;
        v31[3] = &unk_1E97847F8;
        v17 = v15;
        v32 = v17;
        v18 = (void *)MEMORY[0x1D825A744](v31);
        v19 = v17[64];
        v20 = (void *)*((_QWORD *)v17 + 2);
        objc_msgSend(v17, "internal_queue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          v22 = 2;
        else
          v22 = 3;
        xpc_remote_channel_create(v20, v21, v17[66], v22, v16, v18);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v37[5];
        v37[5] = v23;

        v25 = (void *)v37[5];
        if (!v25)
        {
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          v42 = 134217984;
          v43 = 0;
          _os_log_send_and_compose_impl();
          v30 = _os_crash_msg();
          xpc_remote_connection_send_message_with_reply_sync_cold_1(v30);
        }
        objc_storeStrong(v4, v25);
        _log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          _xpc_remote_connection_connect_complete_cold_3();

        v17[32] = 0;
        v17[48] = 0;

        _Block_object_dispose(&v36, 8);
        goto LABEL_48;
      }
      _log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v5;
        _os_log_impl(&dword_1D4245000, v28, OS_LOG_TYPE_DEFAULT, "[%p] Couldn't create nw_connection", buf, 0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }
  }
  else
  {
    if (objc_msgSend(v5, "state") <= 5)
      _xpc_remote_connection_connect_complete_cold_7(&v36, buf);
    _log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      _xpc_remote_connection_connect_complete_cold_9();

    if (a2 != -1 && close(a2) == -1)
      _xpc_remote_connection_connect_complete_cold_8();
  }
LABEL_48:

}

void sub_1D424BC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___xpc_remote_connection_connect_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (a2 == -1)
  {
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 134218240;
      v11 = v9;
      v12 = 1024;
      v13 = a3;
      _os_log_impl(&dword_1D4245000, v6, OS_LOG_TYPE_INFO, "[%p] remote_service_connect_socket: %{errno}d", (uint8_t *)&v10, 0x12u);
    }

    _xpc_remote_connection_connect_failed(*(void **)(a1 + 32), a3);
  }
  else
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 134217984;
      v11 = v8;
      _os_log_impl(&dword_1D4245000, v6, OS_LOG_TYPE_INFO, "[%p] Got socket to Remote Service.", (uint8_t *)&v10, 0xCu);
    }

    _xpc_remote_connection_connect_complete(*(void **)(a1 + 32), a2);
  }
}

void _xpc_remote_connection_connect_failed(void *a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3[5])
    _xpc_remote_connection_connect_failed_cold_5(&v6, v7);
  v4 = v3;
  if (v3[2])
    _xpc_remote_connection_connect_failed_cold_4(&v6, v7);
  if (objc_msgSend(v3, "state") == 2)
  {
    if ((_DWORD)a2 == 83)
    {
      if (objc_msgSend(v4, "type") != 1)
        _xpc_remote_connection_connect_failed_cold_1(&v6, v7);
      _xpc_remote_connection_cancel(v4);
    }
    else
    {
      _xpc_remote_connection_disconnect(v4, a2);
    }
  }
  else
  {
    if (objc_msgSend(v4, "state") <= 5)
      _xpc_remote_connection_connect_failed_cold_2(&v6, v7);
    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      _xpc_remote_connection_connect_failed_cold_3();

  }
}

void _xpc_remote_connection_connect_doa(void *a1, int a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[88];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  _log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_DEFAULT, "[%p] fd is DOA; connect failed", buf, 0xCu);
  }

  if (v3[2])
    _xpc_remote_connection_connect_failed_cold_4(&v5, buf);
  if (v3[3])
    _xpc_remote_connection_connect_doa_cold_3(&v5, buf);
  if (v3[5])
    _xpc_remote_connection_connect_failed_cold_5(&v5, buf);
  if (close(a2) == -1)
    _xpc_remote_connection_connect_complete_cold_8();
  _xpc_remote_connection_connect_failed(v3, 22);

}

nw_parameters_t _xpc_remote_connection_create_nw_parameters(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *configure_tls_block;
  nw_parameters_t secure_tcp;

  v1 = a1;
  objc_msgSend(v1, "tls_identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "tls_identity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "tls_verify");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "tls_verify_queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    configure_tls_block = (void *)xpc_remote_connection_create_configure_tls_block(v3, v4, v5);

    secure_tcp = nw_parameters_create_secure_tcp(configure_tls_block, (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
  }
  else
  {
    secure_tcp = nw_parameters_create();
  }

  xpc_remote_connection_setup_nw_parameters(secure_tcp);
  return secure_tcp;
}

void _xpc_remote_connection_setup_nw_listener(void *a1)
{
  nw_connection_t *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  nw_connection_t *v6;
  nw_connection_t *v7;
  nw_connection_t v8;
  NSObject *v9;
  _QWORD v10[4];
  nw_connection_t *v11;
  _QWORD v12[4];
  nw_connection_t *v13;

  v1 = a1;
  _xpc_remote_connection_create_nw_parameters(v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_listener_create_with_connection(v1[2], v2);
  -[nw_connection_t internal_queue](v1, "internal_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_listener_set_queue(v3, v4);

  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___xpc_remote_connection_setup_nw_listener_block_invoke;
  v12[3] = &unk_1E9784820;
  v6 = v1;
  v13 = v6;
  MEMORY[0x1D825A588](v3, v12);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = ___xpc_remote_connection_setup_nw_listener_block_invoke_214;
  v10[3] = &unk_1E9784848;
  v11 = v6;
  v7 = v6;
  nw_listener_set_new_connection_handler(v3, v10);
  nw_listener_start(v3);
  v8 = v7[3];
  v7[3] = v3;
  v9 = v3;

}

void ___xpc_remote_connection_connect_complete_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v5;
  _QWORD *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  xpc_object_t v13;
  int64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  size_t size;
  __int128 buf;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v6, "internal_queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if ((id)v6[5] != v7)
    ___xpc_remote_connection_connect_complete_block_invoke_cold_4(&size, &buf);
  if (a2 == 2)
  {
    if (objc_msgSend(v6, "state") < 2 || objc_msgSend(v6, "state") >= 7)
      ___xpc_remote_connection_connect_complete_block_invoke_cold_3(&size, &buf);
    _log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1D4245000, v15, OS_LOG_TYPE_INFO, "[%p] Root channel received canceled event", (uint8_t *)&buf, 0xCu);
    }

    v16 = (void *)v6[2];
    v6[2] = 0;

    v17 = (void *)v6[5];
    v6[5] = 0;

    _xpc_remote_connection_disconnect(v6, a3);
  }
  else if (a2 == 1)
  {
    _log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1D4245000, v9, OS_LOG_TYPE_INFO, "[%p] Root channel ready, sending HELO", (uint8_t *)&buf, 0xCu);
    }

    v10 = v6;
    if (objc_msgSend(v10, "state") <= 4)
    {
      if (objc_msgSend(v10, "state") == 2)
      {
        objc_msgSend(v10, "setState:", 3);
        if (*((_BYTE *)v10 + 208))
        {
          _log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1D4245000, v11, OS_LOG_TYPE_DEFAULT, "_xpc_remote_connection_ready setup_nw_listener", (uint8_t *)&buf, 2u);
          }

          _xpc_remote_connection_setup_nw_listener(v10);
        }
        v12 = MEMORY[0x1E0C80D00];
        v13 = xpc_dictionary_create(0, 0, 0);
        v14 = v10[20];
        if (v14)
          xpc_dictionary_set_int64(v13, "ServiceVersion", v14);
        size = 0;
        xpc_make_serialization();
        ___xpc_remote_connection_connect_complete_block_invoke_cold_1(&v18, &buf);
      }
      ___xpc_remote_connection_connect_complete_block_invoke_cold_2(&size, &buf);
    }

  }
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t error_code;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && nw_error_get_error_domain(v5) == nw_error_domain_posix)
  {
    error_code = nw_error_get_error_code(v6);
    _log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ___xpc_remote_connection_setup_nw_listener_block_invoke_cold_1();

  }
  else
  {
    error_code = 0;
  }
  _log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v13 = 134218240;
    v14 = v10;
    v15 = 1024;
    v16 = a2;
    _os_log_impl(&dword_1D4245000, v9, OS_LOG_TYPE_INFO, "[%p] listener moved to state %d", (uint8_t *)&v13, 0x12u);
  }

  if (a2 >= 3)
  {
    if (a2 == 4)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 24);
      *(_QWORD *)(v11 + 24) = 0;

    }
    _xpc_remote_connection_disconnect(*(void **)(a1 + 32), error_code);
  }

}

void _xpc_remote_connection_disconnect(void *a1, uint64_t a2)
{
  NSObject *v3;
  id v4;

  v4 = a1;
  objc_msgSend(v4, "internal_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  __xpc_remote_connection_teardown(v4, 1, a2);
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke_214(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  id v17;
  id *v18;
  id *v19;
  id *v20;
  id *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[4];
  __int128 buf;
  void (*v35)(uint64_t, int, uint64_t);
  void *v36;
  id v37;
  uint64_t *v38;
  _QWORD *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "internal_queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (objc_msgSend(v4, "state") < 5)
  {
    _log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1D4245000, v7, OS_LOG_TYPE_DEFAULT, "[%p] Got incoming h2 stream", (uint8_t *)&buf, 0xCu);
    }

    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy_;
    v31 = __Block_byref_object_dispose_;
    v32 = 0;
    v8 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v35 = ___xpc_remote_connection_handle_new_channel_block_invoke;
    v36 = &unk_1E9784898;
    v9 = v4;
    v37 = v9;
    v38 = &v27;
    v39 = v33;
    v10 = (void *)MEMORY[0x1D825A744](&buf);
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = ___xpc_remote_connection_handle_new_channel_block_invoke_218;
    v23[3] = &unk_1E97848E8;
    v11 = v9;
    v24 = v11;
    v25 = &v27;
    v26 = v33;
    v12 = (void *)MEMORY[0x1D825A744](v23);
    objc_msgSend(v11, "internal_queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_channel_create(v5, v13, *((_BYTE *)v11 + 66), 0, v10, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v28[5];
    v28[5] = v14;

    if (*((_BYTE *)v11 + 65) && !*((_QWORD *)v11 + 7))
    {
      objc_storeStrong((id *)v11 + 7, (id)v28[5]);
    }
    else
    {
      v16 = (id *)objc_opt_new();
      objc_storeStrong(v16 + 1, (id)v28[5]);
      v17 = v11;
      v18 = v16;
      v19 = v18;
      if (*((_QWORD *)v17 + 14))
      {
        v20 = (id *)*((id *)v17 + 15);
        objc_storeStrong(v20 + 2, v16);
      }
      else
      {
        v21 = v18;
        v20 = (id *)*((_QWORD *)v17 + 14);
        *((_QWORD *)v17 + 14) = v21;
      }

      v22 = (void *)*((_QWORD *)v17 + 15);
      *((_QWORD *)v17 + 15) = v19;

    }
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(v33, 8);
  }
  else
  {
    nw_connection_cancel(v5);
  }

}

void sub_1D424CAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __xpc_remote_connection_teardown(void *a1, int a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  char *v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  id *v20;
  id *v21;
  id v22;
  void *v23;
  void (**v24)(id, uint64_t);
  id v25;
  unsigned int v26;
  objc_class *v27;
  void **v28;
  NSObject *v29;
  void **v30;
  char *v31;
  uint64_t v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(v5, "internal_queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (objc_msgSend(v5, "state") != 7)
  {
    if (!a2 && objc_msgSend(v5, "state") == 5)
    {
      objc_msgSend(v5, "setState:", 6);
      _log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v34 = v5;
        _os_log_impl(&dword_1D4245000, v7, OS_LOG_TYPE_INFO, "[%p] disconnect => cancel promotion", buf, 0xCu);
      }

    }
    if (objc_msgSend(v5, "state") < 5)
    {
      if (a2 == 1)
      {
        _log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v11 = state2str[objc_msgSend(v5, "state")];
          *(_DWORD *)buf = 134218498;
          v34 = v5;
          v35 = 2082;
          v36 = v11;
          v37 = 1024;
          v38 = a3;
          _os_log_impl(&dword_1D4245000, v9, OS_LOG_TYPE_DEFAULT, "[%p] Connection Disconnected (state: %{public}s, error %{errno}d)", buf, 0x1Cu);
        }
      }
      else
      {
        if (a2)
          __xpc_remote_connection_teardown_cold_2(&v32, buf);
        _log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = state2str[objc_msgSend(v5, "state")];
          *(_DWORD *)buf = 134218242;
          v34 = v5;
          v35 = 2082;
          v36 = v10;
          _os_log_impl(&dword_1D4245000, v9, OS_LOG_TYPE_DEFAULT, "[%p] Connection Canceled (state: %{public}s)", buf, 0x16u);
        }
        a3 = 89;
      }

      *((_DWORD *)v5 + 45) = a3;
      if (objc_msgSend(v5, "type"))
        v12 = a2 == 0;
      else
        v12 = 1;
      if (v12)
        v13 = 6;
      else
        v13 = 5;
      objc_msgSend(v5, "setState:", v13);
      v14 = *((_QWORD *)v5 + 3);
      if (v14)
        nw_listener_cancel(v14);
      v15 = (void *)*((_QWORD *)v5 + 5);
      if (v15)
      {
        xpc_remote_channel_cancel(v15, a3);
      }
      else if (!objc_msgSend(v5, "type"))
      {
        v16 = *((_DWORD *)v5 + 48);
        if (v16 != -1)
        {
          if (close(v16) == -1)
            _xpc_remote_connection_connect_complete_cold_8();
          *((_DWORD *)v5 + 48) = -1;
        }
      }
      v17 = (void *)*((_QWORD *)v5 + 7);
      if (v17)
        xpc_remote_channel_cancel(v17, a3);
      v18 = v5;
      v19 = (void *)*((_QWORD *)v18 + 12);
      if (v19)
      {
        v20 = 0;
        do
        {
          v21 = v19;
          objc_storeStrong((id *)v18 + 12, v21[7]);
          v22 = v21[7];
          if (!v22)
          {
            v23 = (void *)*((_QWORD *)v18 + 13);
            *((_QWORD *)v18 + 13) = 0;

            v22 = v21[7];
          }
          v21[7] = 0;

          v24 = (void (**)(id, uint64_t))v21[5];
          if (v24)
            v24[2](v24, a3);
          v25 = v18;
          v19 = (void *)*((_QWORD *)v18 + 12);
          v20 = v21;
        }
        while (v19);
      }
      else
      {
        v21 = 0;
      }

      v26 = *((_DWORD *)v5 + 45);
      v8 = v18;
      v27 = v8[14].isa;
      if (v27)
      {
        v28 = (void **)v27;
        do
        {
          _log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v31 = (char *)v28[1];
            *(_DWORD *)buf = 134218240;
            v34 = v8;
            v35 = 2048;
            v36 = v31;
            _os_log_debug_impl(&dword_1D4245000, v29, OS_LOG_TYPE_DEBUG, "[%p] Canceling channel (%p)", buf, 0x16u);
          }

          xpc_remote_channel_cancel(v28[1], v26);
          v30 = v28[2];

          v28 = v30;
        }
        while (v30);
      }
    }
    else
    {
      _log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __xpc_remote_connection_teardown_cold_1();
    }

    __xpc_remote_connection_teardown_continue(v5);
  }

}

void __xpc_remote_connection_teardown_continue(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[88];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "internal_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (objc_msgSend(v1, "state") != 5 && objc_msgSend(v1, "state") != 6)
    __xpc_remote_connection_teardown_continue_cold_7(&v16, buf);
  if (*((_QWORD *)v1 + 5))
  {
    _log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __xpc_remote_connection_teardown_continue_cold_6();
  }
  else if (*((_QWORD *)v1 + 7))
  {
    _log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __xpc_remote_connection_teardown_continue_cold_5();
  }
  else if (*((_QWORD *)v1 + 3))
  {
    _log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __xpc_remote_connection_teardown_continue_cold_4();
  }
  else if (*((_QWORD *)v1 + 14))
  {
    _log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __xpc_remote_connection_teardown_continue_cold_3();
  }
  else
  {
    objc_msgSend(v1, "event_handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "state") == 5)
    {
      _log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v1;
        _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_DEFAULT, "[%p] Disconnect complete, delivering XPC_ERROR_CONNECTION_INTERRUTPED", buf, 0xCu);
      }

      objc_msgSend(v1, "setState:", 1);
      v6 = (void *)MEMORY[0x1E0C81258];
      v7 = MEMORY[0x1E0C81258];
    }
    else
    {
      if (objc_msgSend(v1, "state") != 6)
        __xpc_remote_connection_teardown_continue_cold_2();
      _log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v1;
        _os_log_impl(&dword_1D4245000, v8, OS_LOG_TYPE_DEFAULT, "[%p] Cancel complete, delivering XPC_ERROR_CONNECTION_INVALID", buf, 0xCu);
      }

      objc_msgSend(v1, "setState:", 7);
      v6 = (void *)MEMORY[0x1E0C81260];
      v9 = MEMORY[0x1E0C81260];
      objc_msgSend(v1, "setEvent_handler:", 0);
    }
    _xpc_remote_connection_flush(v1, v6);
    if (*((_QWORD *)v1 + 12))
      __xpc_remote_connection_teardown_continue_cold_1(&v16, buf);
    *((_DWORD *)v1 + 45) = 0;
    objc_msgSend(v1, "target_queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = ____xpc_remote_connection_teardown_continue_block_invoke;
    v12[3] = &unk_1E9784870;
    v15 = v4;
    v13 = v6;
    v14 = v1;
    v11 = v6;
    v3 = v4;
    dispatch_async(v10, v12);

  }
}

void _xpc_remote_connection_flush(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "internal_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  _xpc_remote_connection_dequeue_message(v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = MEMORY[0x1E0C81320];
    do
    {
      if (*(int *)(v7 + 32) >= 1)
      {
        v9 = 0;
        v10 = v7 + 40;
        do
        {
          v11 = *(id *)(v10 + 8 * v9);
          if (MEMORY[0x1D825AA08]() != v8)
            _xpc_remote_connection_flush_cold_1();
          v12 = v3;
          v13 = v11;
          v14 = xpc_file_transfer_copy_io();
          dispatch_io_close(v14, 0);
          objc_msgSend(v12, "target_queue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          xpc_file_transfer_send_finished();
          v16 = *(void **)(v10 + 8 * v9);
          *(_QWORD *)(v10 + 8 * v9) = 0;

          ++v9;
        }
        while (v9 < *(int *)(v7 + 32));
      }
      if (*(_QWORD *)(v7 + 16))
      {
        objc_msgSend(v3, "target_queue");
        v17 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v17, *(dispatch_block_t *)(v7 + 16));

      }
      _xpc_remote_connection_dequeue_message(v3);
      v18 = objc_claimAutoreleasedReturnValue();

      v7 = v18;
    }
    while (v18);
  }
  v19 = v3;
  v20 = (void *)*((_QWORD *)v19 + 16);
  if (v20)
  {
    v21 = 0;
    v22 = MEMORY[0x1E0C809B0];
    do
    {
      v23 = v20;
      objc_storeStrong((id *)v19 + 16, *((id *)v23 + 4));
      v24 = (void *)*((_QWORD *)v23 + 4);
      if (!v24)
      {
        v25 = (void *)*((_QWORD *)v19 + 17);
        *((_QWORD *)v19 + 17) = 0;

        v24 = (void *)*((_QWORD *)v23 + 4);
      }
      *((_QWORD *)v23 + 4) = 0;

      v26 = *((_QWORD *)v23 + 3);
      v28[0] = v22;
      v28[1] = 3221225472;
      v28[2] = ___xpc_remote_connection_flush_block_invoke;
      v28[3] = &unk_1E97845D0;
      v21 = v23;
      v29 = v21;
      v30 = v4;
      dispatch_async(v26, v28);

      v27 = v19;
      v20 = (void *)*((_QWORD *)v19 + 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

}

void ____xpc_remote_connection_teardown_continue_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a1[6];
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[4]);
  }
  else
  {
    _log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[5];
      v5 = 134217984;
      v6 = v4;
      _os_log_impl(&dword_1D4245000, v3, OS_LOG_TYPE_DEFAULT, "[%p] No event handler to deliver teardown complete", (uint8_t *)&v5, 0xCu);
    }

  }
}

id _xpc_remote_connection_dequeue_message(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  void *v4;
  id *v5;
  id v6;
  void *v7;

  v1 = a1;
  objc_msgSend(v1, "internal_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = v1;
  v4 = (void *)*((_QWORD *)v3 + 10);
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)v3 + 10, v5[21]);
    v6 = v5[21];
    if (!v6)
    {
      v7 = (void *)*((_QWORD *)v3 + 11);
      *((_QWORD *)v3 + 11) = 0;

      v6 = v5[21];
    }
    v5[21] = 0;

  }
  return v4;
}

uint64_t ___xpc_remote_connection_flush_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  _QWORD *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (id *)(a1 + 32);
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v8 == (void *)v6[7])
    {
      v6[7] = 0;

      if (objc_msgSend(*v7, "state") < 2 || objc_msgSend(*v7, "state") >= 7)
        ___xpc_remote_connection_handle_new_channel_block_invoke_cold_2(&v19, buf, (id *)(a1 + 32));
      _log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *v7;
        *(_DWORD *)buf = 134218240;
        v21 = v16;
        v22 = 1024;
        LODWORD(v23) = a3;
        _os_log_impl(&dword_1D4245000, v15, OS_LOG_TYPE_INFO, "[%p] Reply channel received CANCELED event with error %{errno}d", buf, 0x12u);
      }

      _xpc_remote_connection_disconnect(*v7, a3);
    }
    else
    {
      _xpc_remote_pending_stream_find(v6, *(id **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v9 = objc_claimAutoreleasedReturnValue();
      _log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v11)
        {
          v12 = *(void **)(a1 + 32);
          v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          *(_DWORD *)buf = 134218496;
          v21 = v12;
          v22 = 2048;
          v23 = v13;
          v24 = 1024;
          v25 = a3;
          _os_log_impl(&dword_1D4245000, v10, OS_LOG_TYPE_INFO, "[%p] Stream %llu canceled with error %d, leaving tombstone", buf, 0x1Cu);
        }

        v14 = *(void **)(v9 + 16);
        *(_QWORD *)(v9 + 16) = 0;

        *(_DWORD *)(v9 + 48) = a3;
        _xpc_remote_pending_stream_insert((id *)*v7, (void *)v9);
      }
      else
      {
        if (v11)
        {
          v17 = *(void **)(a1 + 32);
          v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          *(_DWORD *)buf = 134218240;
          v21 = v17;
          v22 = 2048;
          v23 = v18;
          _os_log_impl(&dword_1D4245000, v10, OS_LOG_TYPE_INFO, "[%p] Stream %llu canceled but not pending", buf, 0x16u);
        }

      }
      _xpc_remote_stream_remove(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      if (objc_msgSend(*(id *)(a1 + 32), "state") >= 5)
        __xpc_remote_connection_teardown_continue(*v7);

    }
  }
  else if (a2 == 1)
  {
    _log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      ___xpc_remote_connection_handle_new_channel_block_invoke_cold_1();

  }
}

id *_xpc_remote_pending_stream_find(void *a1, id *a2)
{
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  id *v7;
  id *v8;
  id *v9;
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v21;
  __int128 v22[5];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (a2)
  {
    v5 = (id *)v3[12];
    if (v5)
    {
      v6 = v5;
      while (v6[1] != a2)
      {
        v7 = (id *)v6[7];

        v6 = v7;
        if (!v7)
          goto LABEL_6;
      }
      v8 = v4;
      a2 = v6;
      v9 = (id *)v4[12];
      if (v9 == a2)
      {
        if (!v9)
        {
LABEL_22:

          goto LABEL_23;
        }
        v9 = v9;
        objc_storeStrong(v4 + 12, v9[7]);
        v14 = (id *)v9[7];
        if (!v14)
        {
          v15 = v8[13];
          v8[13] = 0;

          v14 = (id *)v9[7];
        }
        v9[7] = 0;
      }
      else
      {
        v10 = v9;
        if (!v10)
        {
LABEL_23:

          goto LABEL_24;
        }
        v11 = v10;
        while (1)
        {
          v12 = (id *)v11[7];
          if (v12 == a2)
            break;
          v13 = v12;

          v11 = v13;
          if (!v13)
            goto LABEL_23;
        }
        v14 = v11;
        v16 = v11[7];
        if (!v16)
          _xpc_remote_connection_handle_read_cold_5(&v21, v22);
        v17 = v16;

        v18 = (void *)v17[7];
        v19 = v18;
        objc_storeStrong(v11 + 7, v18);
        if (!v19)
          objc_storeStrong(v8 + 13, v11);

        v9 = v14;
      }

      goto LABEL_22;
    }
LABEL_6:
    a2 = 0;
  }
LABEL_24:

  return a2;
}

void _xpc_remote_pending_stream_insert(id *a1, void *a2)
{
  id *v4;
  id *v5;
  id v6;
  id v7;

  v7 = a2;
  v4 = a1 + 12;
  if (a1[12])
    v4 = (id *)((char *)a1[13] + 56);
  objc_storeStrong(v4, a2);
  v5 = a1;
  v6 = v5[13];
  v5[13] = v7;

}

void _xpc_remote_stream_remove(void *a1, void *a2)
{
  id v3;
  id *v4;
  id *v5;
  id *v6;
  id *v7;
  id *v8;
  id *v9;
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  id *v20;
  uint64_t v21;
  __int128 v22[5];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = a1;
  v3 = a2;
  v4 = (id *)v20[14];
  if (v4)
  {
    v5 = v4;
    while (v5[1] != v3)
    {
      v6 = (id *)v5[2];

      v5 = v6;
      if (!v6)
        goto LABEL_23;
    }
    v7 = v20;
    v8 = v5;
    v9 = (id *)v20[14];
    if (v9 == v8)
    {
      if (!v9)
      {
LABEL_21:

        goto LABEL_22;
      }
      v9 = v9;
      objc_storeStrong(v20 + 14, v9[2]);
      v14 = (id *)v9[2];
      if (!v14)
      {
        v15 = v7[15];
        v7[15] = 0;

        v14 = (id *)v9[2];
      }
      v9[2] = 0;
    }
    else
    {
      v10 = v9;
      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
      v11 = v10;
      while (1)
      {
        v12 = (id *)v11[2];
        if (v12 == v8)
          break;
        v13 = v12;

        v11 = v13;
        if (!v13)
          goto LABEL_22;
      }
      v14 = v11;
      v16 = v11[2];
      if (!v16)
        _xpc_remote_connection_handle_read_cold_5(&v21, v22);
      v17 = v16;

      v18 = (void *)v17[2];
      v19 = v18;
      objc_storeStrong(v11 + 2, v18);
      if (!v19)
        objc_storeStrong(v7 + 15, v11);

      v9 = v14;
    }

    goto LABEL_21;
  }
LABEL_23:

}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218(uint64_t a1, objc_class *a2, unint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void **v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  int v42;
  _QWORD v43[4];
  _QWORD *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  _BYTE v48[10];
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v9 = (void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 48))
  {
    v10 = *(void **)(v8 + 56);
    if (v10 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      _xpc_remote_connection_handle_read((void *)v8, v10, a2, a3, v7);
      goto LABEL_10;
    }
  }
  if (objc_msgSend((id)v8, "state") <= 4)
  {
    if ((_BYTE)a3)
    {
      _log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_6();
LABEL_7:

LABEL_8:
      _xpc_remote_connection_disconnect(*v9, 53);
      goto LABEL_10;
    }
    v12 = a3 >> 16;
    if (((a3 >> 16) & 0x40) != 0)
    {
      _log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = *v9;
        *(_DWORD *)buf = 134217984;
        v46 = v28;
        _os_log_impl(&dword_1D4245000, v27, OS_LOG_TYPE_INFO, "[%p] Got HEADER for reply channel", buf, 0xCu);
      }

      v29 = *v9;
      if (*((_BYTE *)*v9 + 65))
      {
        v30 = (void *)v29[7];
        v32 = *(_QWORD *)(a1 + 40);
        v31 = a1 + 40;
        if (v30 == *(void **)(*(_QWORD *)(v32 + 8) + 40))
        {
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = ___xpc_remote_connection_handle_new_channel_block_invoke_219;
          v43[3] = &unk_1E97848C0;
          v44 = v29;
          xpc_remote_channel_send(v30, 0, 0x400000, MEMORY[0x1E0C80D00], v43);
          _xpc_remote_connection_handle_read(*v9, *(void **)(*(_QWORD *)(*(_QWORD *)v31 + 8) + 40), a2, a3, v7);

          goto LABEL_10;
        }
        _log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_5();

        xpc_remote_channel_cancel(*(void **)(*(_QWORD *)(*(_QWORD *)v31 + 8) + 40), 0x35u);
      }
      else
      {
        _log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_4();

      }
      goto LABEL_8;
    }
    v13 = WORD1(a3);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      _log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_3();

    }
    _log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(void **)(a1 + 32);
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218496;
      v46 = v16;
      v47 = 2048;
      *(_QWORD *)v48 = v17;
      *(_WORD *)&v48[8] = 1024;
      v49 = v13;
      _os_log_impl(&dword_1D4245000, v15, OS_LOG_TYPE_INFO, "[%p] Got HEADER for stream %lld, flags = 0x%x", buf, 0x1Cu);
    }

    v18 = (v12 >> 3) & 2 | (v12 >> 5) & 1;
    if (!v18)
    {
      _log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_1();
      goto LABEL_7;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    v19 = *(id **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (!v19)
    {
      _log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_2();
      goto LABEL_7;
    }
    _xpc_remote_pending_stream_find(*v9, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)(v20 + 24);
      _log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (v24)
        {
          v25 = *(void **)(a1 + 32);
          v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          *(_DWORD *)buf = 134218240;
          v46 = v25;
          v47 = 2048;
          *(_QWORD *)v48 = v26;
          _os_log_impl(&dword_1D4245000, v23, OS_LOG_TYPE_INFO, "[%p] Found pending stream ID for %lld", buf, 0x16u);
        }

        if (*(_DWORD *)(v21 + 32) == v18)
        {
          _xpc_remote_channel_send_stream_header(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v18);
          xpc_remote_channel_attach_stream(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_DWORD *)(v21 + 32), *(void **)(v21 + 24), *(void **)(v21 + 40));
        }
        else
        {
          _log();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = *v9;
            v42 = *(_DWORD *)(v21 + 32);
            *(_DWORD *)buf = 134218496;
            v46 = v41;
            v47 = 1024;
            *(_DWORD *)v48 = v42;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v18;
            _os_log_error_impl(&dword_1D4245000, v40, OS_LOG_TYPE_ERROR, "[%p] Pending stream direction mismatch: %d != %d", buf, 0x18u);
          }

          _xpc_remote_connection_disconnect(*v9, 53);
        }
      }
      else
      {
        if (v24)
        {
          v38 = *(void **)(a1 + 32);
          v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          *(_DWORD *)buf = 134218240;
          v46 = v38;
          v47 = 2048;
          *(_QWORD *)v48 = v39;
          _os_log_impl(&dword_1D4245000, v23, OS_LOG_TYPE_INFO, "[%p] Found pending tombstone ID for %lld", buf, 0x16u);
        }

        xpc_remote_channel_cancel(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0x59u);
      }
    }
    else
    {
      _log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = *(void **)(a1 + 32);
        v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 134218240;
        v46 = v36;
        v47 = 2048;
        *(_QWORD *)v48 = v37;
        _os_log_impl(&dword_1D4245000, v35, OS_LOG_TYPE_INFO, "[%p] Pending incoming stream %lld", buf, 0x16u);
      }

      v21 = objc_opt_new();
      *(_QWORD *)(v21 + 8) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)(v21 + 32) = v18;
      objc_storeStrong((id *)(v21 + 16), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      _xpc_remote_pending_stream_insert(*(id **)(a1 + 32), (void *)v21);
    }

  }
LABEL_10:

}

void ___xpc_remote_connection_handle_new_channel_block_invoke_219(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___xpc_remote_connection_handle_new_channel_block_invoke_219_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent reply HELO", (uint8_t *)&v7, 0xCu);
  }

}

void _xpc_remote_channel_send_stream_header(void *a1, uint64_t a2, int a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (!a2)
    _xpc_remote_channel_send_stream_header_cold_1(&v8, buf);
  if (!a3)
    _xpc_remote_channel_send_stream_header_cold_2(&v8, buf);
  v6 = v5;
  _log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v10 = v6;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_1D4245000, v7, OS_LOG_TYPE_INFO, "[%p] Sending HEADER for stream %lld", buf, 0x16u);
  }

  xpc_remote_channel_send(v6, a2, (a3 & 3) << 20, MEMORY[0x1E0C80D00], 0);
}

void ___xpc_remote_connection_ready_block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___xpc_remote_connection_ready_block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent root channel HELO", (uint8_t *)&v7, 0xCu);
  }

}

id _xpc_remote_connection_create_sub_nw_connection(_QWORD *a1)
{
  NSObject *v1;
  _QWORD *v2;
  NSObject *v3;
  nw_parameters_t v4;
  void *v5;

  v1 = a1[2];
  v2 = a1;
  v3 = nw_connection_copy_parameters(v1);
  v4 = nw_parameters_copy(v3);

  nw_parameters_set_data_mode();
  nw_parameters_set_server_mode();

  v5 = (void *)nw_connection_create_with_connection();
  return v5;
}

void ___xpc_remote_connection_ready_block_invoke_223(uint64_t a1, int a2, uint64_t a3)
{
  _QWORD *v3;
  void *v4;
  id *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  _QWORD *v11;

  if (a2 == 2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = (id *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = 0;

    if (objc_msgSend(*v6, "state") <= 4)
    {
      _log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ___xpc_remote_connection_ready_block_invoke_223_cold_1();

    }
    _xpc_remote_connection_disconnect(*v6, a3);
  }
  else if (a2 == 1)
  {
    v3 = *(_QWORD **)(a1 + 32);
    v4 = (void *)v3[7];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = ___xpc_remote_connection_ready_block_invoke_2;
    v10[3] = &unk_1E97848C0;
    v11 = v3;
    xpc_remote_channel_send(v4, 0, 0x400000, MEMORY[0x1E0C80D00], v10);

  }
}

void ___xpc_remote_connection_ready_block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___xpc_remote_connection_handle_new_channel_block_invoke_219_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent reply channel HELO", (uint8_t *)&v7, 0xCu);
  }

}

void ___xpc_remote_connection_ready_block_invoke_224(uint64_t a1, objc_class *a2, uint64_t a3, void *a4)
{
  _xpc_remote_connection_handle_read(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 56), a2, a3, a4);
}

void ___xpc_remote_connection_handle_read_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (MEMORY[0x1D825AA08]() != MEMORY[0x1E0C81320])
    ___xpc_remote_connection_handle_read_block_invoke_cold_1();
  v5 = *(id *)(a1 + 32);
  v4 = v5;
  xpc_file_transfer_set_transport_writing_callbacks();

}

uint64_t ___xpc_remote_connection_handle_read_block_invoke_228(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

void _xpc_remote_connection_wakeup(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  Class v10;
  id v11;
  Class isa;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  Class v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "internal_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if ((objc_msgSend(v1, "send_in_progress") & 1) == 0)
  {
    switch(objc_msgSend(v1, "state"))
    {
      case 0u:
        _xpc_remote_connection_wakeup_cold_1();
      case 1u:
        _xpc_remote_connection_connect(v1);
        goto LABEL_4;
      case 2u:
      case 3u:
LABEL_4:
        _log();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
          _xpc_remote_connection_wakeup_cold_2();
        goto LABEL_6;
      case 5u:
      case 6u:
      case 7u:
        break;
      default:
        _xpc_remote_connection_dequeue_message(v1);
        v4 = objc_claimAutoreleasedReturnValue();
        v3 = v4;
        if (v4)
        {
          v5 = *(_QWORD *)(v4 + 8);
          if (v5 && (*(_QWORD *)(v4 + 8) & 1) == *((_BYTE *)v1 + 65))
          {
            v16 = 0;
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            *(_OWORD *)buf = 0u;
            os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            isa = v3[1].isa;
            v17 = 134218240;
            v18 = v1;
            v19 = 2048;
            v20 = isa;
            _os_log_send_and_compose_impl();
            _os_crash_msg();
            __break(1u);
          }
          if (*(_BYTE *)(v4 + 176))
            v6 = 65537;
          else
            v6 = 1;
          _log();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v1;
            _os_log_impl(&dword_1D4245000, v7, OS_LOG_TYPE_INFO, "[%p] Send initiated", buf, 0xCu);
          }

          objc_msgSend(v1, "setSend_in_progress:", 1);
          _xpc_remote_connection_send_ool_message_content(v1, v3);
          v8 = (void *)MEMORY[0x1D825A744](v3[2].isa);
          v9 = (void *)*((_QWORD *)v1 + 5);
          v10 = v3[3].isa;
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = ___xpc_remote_connection_wakeup_block_invoke;
          v13[3] = &unk_1E97849B0;
          v14 = v1;
          v15 = v8;
          v11 = v8;
          xpc_remote_channel_send(v9, v5, v6, v10, v13);

        }
LABEL_6:

        break;
    }
  }

}

void ___xpc_remote_connection_wakeup_block_invoke(uint64_t a1, int a2)
{
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setSend_in_progress:", 0);
  if (v4[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, *(dispatch_block_t *)(a1 + 40));

  }
  _log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___xpc_remote_connection_wakeup_block_invoke_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *v4;
      v9 = 134217984;
      v10 = v8;
      _os_log_impl(&dword_1D4245000, v7, OS_LOG_TYPE_INFO, "[%p] Send completed", (uint8_t *)&v9, 0xCu);
    }

    _xpc_remote_connection_wakeup(*v4);
  }
}

void ___send_file_transfer_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 40), "target_queue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  xpc_file_transfer_send_finished();

}

uint64_t __Block_byref_object_copy__231(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1D825A744](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__232(uint64_t a1)
{

}

void ___xpc_remote_connection_open_stream_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 56);
      v11 = 134218240;
      v12 = v6;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] Got CANCELED for stream %lld", (uint8_t *)&v11, 0x16u);
    }

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(_QWORD *)(v8 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, a3);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v8 + 40);
    }
    else
    {
      v10 = 0;
    }
    *(_QWORD *)(v8 + 40) = 0;

    _xpc_remote_stream_remove(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    if (objc_msgSend(*(id *)(a1 + 32), "state") >= 5)
      __xpc_remote_connection_teardown_continue(*(void **)(a1 + 32));
  }
  else if (a2 == 1)
  {
    _xpc_remote_channel_send_stream_header(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 64));
  }
}

void ___xpc_remote_connection_open_stream_block_invoke_233(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 64);
    v7 = 134218240;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_1D4245000, v2, OS_LOG_TYPE_INFO, "[%p] Got HEADER for stream %lld", (uint8_t *)&v7, 0x16u);
  }

  xpc_remote_channel_attach_stream(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_DWORD *)(a1 + 72), *(void **)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void ___recv_file_transfer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "internal_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___recv_file_transfer_block_invoke_2;
  block[3] = &unk_1E9784A50;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void ___recv_file_transfer_block_invoke_2(uint64_t a1)
{
  id *transfer_id;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") < 5)
  {
    transfer_id = (id *)xpc_file_transfer_get_transfer_id();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v19 = ___recv_file_transfer_block_invoke_3;
    v20 = &unk_1E97849D8;
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 48);
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 32);
    v5 = v3;
    v6 = v4;
    v7 = v18;
    objc_msgSend(v5, "internal_queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    if (objc_msgSend(v5, "state") >= 5)
      ___recv_file_transfer_block_invoke_2_cold_2(&v23, buf);
    _xpc_remote_pending_stream_find(v5, transfer_id);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)(v9 + 16);
      _log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)buf = 134218240;
          v25 = v5;
          v26 = 2048;
          v27 = transfer_id;
          _os_log_impl(&dword_1D4245000, v12, OS_LOG_TYPE_INFO, "[%p] Found pending stream channel for %lld", buf, 0x16u);
        }

        if (*(_DWORD *)(v10 + 32) != 2)
          ___recv_file_transfer_block_invoke_2_cold_1(&v23, buf);
        _xpc_remote_channel_send_stream_header(*(void **)(v10 + 16), (uint64_t)transfer_id, 2);
        xpc_remote_channel_attach_stream(*(void **)(v10 + 16), 2, v6, v7);
      }
      else
      {
        if (v13)
        {
          *(_DWORD *)buf = 134218240;
          v25 = v5;
          v26 = 2048;
          v27 = transfer_id;
          _os_log_impl(&dword_1D4245000, v12, OS_LOG_TYPE_INFO, "[%p] Found pending tombstone channel for %lld", buf, 0x16u);
        }

        ((void (*)(_QWORD *, _QWORD))v19)(v7, *(unsigned int *)(v10 + 48));
      }
    }
    else
    {
      _log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v25 = v5;
        v26 = 2048;
        v27 = transfer_id;
        _os_log_impl(&dword_1D4245000, v14, OS_LOG_TYPE_INFO, "[%p] Pending future stream %lld", buf, 0x16u);
      }

      v10 = objc_opt_new();
      *(_QWORD *)(v10 + 8) = transfer_id;
      *(_DWORD *)(v10 + 32) = 2;
      objc_storeStrong((id *)(v10 + 24), v4);
      v15 = MEMORY[0x1D825A744](v7);
      v16 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v15;

      _xpc_remote_pending_stream_insert((id *)v5, (void *)v10);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    xpc_file_transfer_write_finished();

  }
}

void ___recv_file_transfer_block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 40), "target_queue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  xpc_file_transfer_write_finished();

}

void ___recv_file_transfer_block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "internal_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___recv_file_transfer_block_invoke_5;
  v5[3] = &unk_1E9784510;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(v4, v5);

}

void ___recv_file_transfer_block_invoke_5(uint64_t a1)
{
  id *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") <= 4)
  {
    v2 = *(id **)(a1 + 40);
    v3 = *(id *)(a1 + 32);
    objc_msgSend(v3, "internal_queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    _xpc_remote_pending_stream_find(v3, v2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(v5 + 16);
      _log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (v7)
      {
        if (v9)
        {
          *(_DWORD *)buf = 134218240;
          v13 = v3;
          v14 = 2048;
          v15 = v2;
          _os_log_impl(&dword_1D4245000, v8, OS_LOG_TYPE_INFO, "[%p] Found pending stream channel for canceling %lld", buf, 0x16u);
        }

        if (*(_DWORD *)(v6 + 32) != 2)
          ___recv_file_transfer_block_invoke_5_cold_1(&v11, buf);
        xpc_remote_channel_cancel(*(void **)(v6 + 16), 0x59u);
      }
      else
      {
        if (v9)
        {
          *(_DWORD *)buf = 134218240;
          v13 = v3;
          v14 = 2048;
          v15 = v2;
          _os_log_impl(&dword_1D4245000, v8, OS_LOG_TYPE_INFO, "[%p] Found pending tombstone for canceling %lld", buf, 0x16u);
        }

      }
    }
    else
    {
      _log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v13 = v3;
        v14 = 2048;
        v15 = v2;
        _os_log_impl(&dword_1D4245000, v10, OS_LOG_TYPE_INFO, "[%p] Leaving stream tombstone %lld", buf, 0x16u);
      }

      v6 = objc_opt_new();
      *(_QWORD *)(v6 + 8) = v2;
      _xpc_remote_pending_stream_insert((id *)v3, (void *)v6);
    }

  }
}

uint64_t ___xpc_remote_message_create_block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = a2;
  v5 = v4;
  if (*(int *)(*(_QWORD *)(a1 + 32) + 32) < 16)
  {
    if (MEMORY[0x1D825AA08](v4) == MEMORY[0x1E0C81320])
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(int *)(v16 + 32);
      *(_DWORD *)(v16 + 32) = v17 + 1;
      objc_storeStrong((id *)(v16 + 8 * v17 + 40), a2);
      v14 = 1;
      goto LABEL_10;
    }
    if (MEMORY[0x1D825AA08](v5) == MEMORY[0x1E0C812E8]
      && (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 72) & 2) == 0
      && xpc_data_get_length(v5) > 0x4000)
    {
      ___xpc_remote_message_create_block_invoke_cold_2();
    }
  }
  else
  {
    _log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___xpc_remote_message_create_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = 0;
LABEL_10:

  return v14;
}

const char *_xpc_remote_connection_get_remote_service_name(void *a1)
{
  const char **v1;
  const char **v2;
  const char *name;

  v1 = a1;
  v2 = v1;
  name = v1[1];
  if (!name)
  {
    if (v1[23])
      name = (const char *)remote_service_get_name();
    else
      name = "(null)";
  }

  return name;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

double OUTLINED_FUNCTION_3(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_4()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_8(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_19(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_20()
{
  void *v0;

  return objc_msgSend(v0, "state");
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return _os_assumes_log();
}

id xpc_remote_channel_create(void *a1, void *a2, char a3, char a4, void *a5, void *a6)
{
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)();
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;

  v11 = a1;
  v12 = a2;
  v13 = a6;
  v14 = a5;
  v15 = objc_opt_new();
  objc_storeStrong((id *)(v15 + 8), a2);
  *(_BYTE *)(v15 + 73) = a3;
  v16 = MEMORY[0x1D825A744](v14);

  v17 = *(void **)(v15 + 24);
  *(_QWORD *)(v15 + 24) = v16;

  v18 = MEMORY[0x1D825A744](v13);
  v19 = *(void **)(v15 + 32);
  *(_QWORD *)(v15 + 32) = v18;

  nw_connection_set_queue(v11, v12);
  v20 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __xpc_remote_channel_create_block_invoke;
  v51[3] = &unk_1E9784820;
  v21 = (id)v15;
  v52 = v21;
  MEMORY[0x1D825A4F8](v11, v51);
  v46 = v20;
  v47 = 3221225472;
  v48 = __xpc_remote_channel_create_block_invoke_21;
  v49 = &unk_1E97845A8;
  v50 = v21;
  nw_connection_set_read_close_handler();
  v41 = v20;
  v42 = 3221225472;
  v43 = __xpc_remote_channel_create_block_invoke_23;
  v44 = &unk_1E97845A8;
  v45 = v50;
  nw_connection_set_write_close_handler();
  v36 = v20;
  v37 = 3221225472;
  v38 = __xpc_remote_channel_create_block_invoke_24;
  v39 = &unk_1E97845A8;
  v22 = v45;
  v40 = v22;
  nw_connection_set_cancel_handler();
  if ((a4 & 1) != 0)
  {
    v31 = v20;
    v32 = 3221225472;
    v33 = __xpc_remote_channel_create_block_invoke_25;
    v34 = &unk_1E97845A8;
    v35 = v22;
    nw_connection_set_adaptive_write_handler();

  }
  if ((a4 & 2) != 0)
  {
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __xpc_remote_channel_create_block_invoke_26;
    v29[3] = &unk_1E9784B10;
    v30 = v22;
    nw_connection_set_viability_changed_handler(v11, v29);

  }
  nw_connection_start(v11);
  v23 = (void *)*((_QWORD *)v22 + 2);
  *((_QWORD *)v22 + 2) = v11;
  v24 = v11;

  *((_DWORD *)v22 + 10) = 1;
  _log_0();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    xpc_remote_channel_create_cold_1();

  v26 = v40;
  v27 = v22;

  return v27;
}

void __xpc_remote_channel_create_block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  CFErrorRef v7;
  int error_code;
  NSObject *v9;
  id v10;
  _QWORD *v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _BYTE *v16;
  unsigned int v17;
  uint64_t v18;
  _OWORD v19[5];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = nw_error_copy_cf_error(v5);
    if (nw_error_get_error_domain(v6) == nw_error_domain_posix)
    {
      error_code = nw_error_get_error_code(v6);
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0;
  }
  error_code = 0;
LABEL_6:
  switch(a2)
  {
    case 2:
    case 5:
      break;
    case 3:
      _log_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __xpc_remote_channel_create_block_invoke_cold_5();

      v10 = *(id *)(a1 + 32);
      v11 = v10;
      v12 = *((_DWORD *)v10 + 10);
      if (v12 <= 2)
      {
        if (v12 != 1)
          __xpc_remote_channel_create_block_invoke_cold_4(&v18, v19);
        *((_DWORD *)v10 + 10) = 2;
        _log_0();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          __xpc_remote_channel_create_block_invoke_cold_3();

        (*(void (**)(void))(v11[3] + 16))();
        xpc_remote_channel_arm_read(v11);
      }

      break;
    case 4:
      _log_0();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __xpc_remote_channel_create_block_invoke_cold_2();

      v16 = *(_BYTE **)(a1 + 32);
      if (v16[72])
        v17 = 0;
      else
        v17 = error_code;
      xpc_remote_channel_cancel(v16, v17);
      break;
    default:
      _log_0();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __xpc_remote_channel_create_block_invoke_cold_1();

      break;
  }

}

void xpc_remote_channel_cancel(void *a1, unsigned int a2)
{
  dispatch_queue_t *v3;
  unsigned int v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  dispatch_queue_t v15;
  int v16;
  dispatch_queue_t *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  dispatch_assert_queue_V2(v3[1]);
  v4 = *((_DWORD *)v3 + 10);
  if (v4 != 4)
  {
    if (v4 <= 2)
    {
      _log_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = state2str_0[*((unsigned int *)v3 + 10)];
        v16 = 134218498;
        v17 = v3;
        v18 = 1024;
        v19 = a2;
        v20 = 2082;
        v21 = v6;
        _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] Canceling with error %d (from state %{public}s)", (uint8_t *)&v16, 0x1Cu);
      }

      *((_DWORD *)v3 + 10) = 3;
      *((_DWORD *)v3 + 11) = a2;
    }
    if (v3[2])
    {
      _log_0();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        xpc_remote_channel_cancel_cold_3();

      nw_connection_cancel(v3[2]);
    }
    else
    {
      v8 = v3[8];
      if (v8)
      {
        dispatch_io_close(v8, 0);
        v9 = v3[8];
        v3[8] = 0;

        _log_0();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          xpc_remote_channel_cancel_cold_2();

      }
      v11 = v3[7];
      _log_0();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          xpc_remote_channel_cancel_cold_1();

        dispatch_io_close(v3[7], 1uLL);
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v16 = 134217984;
          v17 = v3;
          _os_log_impl(&dword_1D4245000, v13, OS_LOG_TYPE_INFO, "[%p] Cancelation complete", (uint8_t *)&v16, 0xCu);
        }

        *((_DWORD *)v3 + 10) = 4;
        ((void (*)(void))v3[3][2].isa)();
        v14 = v3[3];
        v3[3] = 0;

        v15 = v3[4];
        v3[4] = 0;

      }
    }
  }

}

void __xpc_remote_channel_create_block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  _DWORD *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;

  _log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __xpc_remote_channel_create_block_invoke_21_cold_4();

  v3 = *(id *)(a1 + 32);
  v4 = v3[12];
  switch(v4)
  {
    case 2:
      _log_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __xpc_remote_channel_create_block_invoke_21_cold_3();
      goto LABEL_13;
    case 1:
      _log_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __xpc_remote_channel_create_block_invoke_21_cold_1();
LABEL_13:

      break;
    case 0:
      _log_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __xpc_remote_channel_create_block_invoke_21_cold_2();

      xpc_remote_channel_cancel(v3, 0);
      break;
  }

}

void __xpc_remote_channel_create_block_invoke_23()
{
  NSObject *v0;

  _log_0();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __xpc_remote_channel_create_block_invoke_23_cold_1();

}

void __xpc_remote_channel_create_block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __xpc_remote_channel_create_block_invoke_24_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  xpc_remote_channel_cancel(*(void **)(a1 + 32), 0x59u);
}

void __xpc_remote_channel_create_block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134218240;
    v5 = v3;
    v6 = 1024;
    v7 = 5;
    _os_log_impl(&dword_1D4245000, v2, OS_LOG_TYPE_INFO, "[%p] aborting connection after %d retransmits", (uint8_t *)&v4, 0x12u);
  }

  xpc_remote_channel_cancel(*(void **)(a1 + 32), 0x3Cu);
}

void __xpc_remote_channel_create_block_invoke_26(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = "not viable";
    v6 = *(_QWORD *)(a1 + 32);
    if (a2)
      v5 = "viable";
    *(_DWORD *)buf = 134218242;
    v11 = v6;
    v12 = 2080;
    v13 = v5;
    _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_INFO, "[%p] connection viability changed: %s", buf, 0x16u);
  }

  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __xpc_remote_channel_create_block_invoke_29;
    v8[3] = &unk_1E97848C0;
    v9 = v7;
    xpc_remote_channel_send(v9, 0, 2, MEMORY[0x1E0C80D00], v8);

  }
}

void __xpc_remote_channel_create_block_invoke_29(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __xpc_remote_channel_create_block_invoke_29_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent PING", (uint8_t *)&v7, 0xCu);
  }

}

void xpc_remote_channel_attach_stream(void *a1, int a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id *v15;
  id *v16;
  NSObject *v17;
  _QWORD *v18;
  dispatch_io_t v19;
  void *v20;
  int v21;
  _QWORD v22[4];
  _QWORD *v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  uint64_t v28;
  _OWORD v29[5];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  v9 = a4;
  v10 = *((_DWORD *)v7 + 10);
  if (v10 == 4)
    xpc_remote_channel_attach_stream_cold_1(&v28, v29);
  if (*((_DWORD *)v7 + 12))
    xpc_remote_channel_attach_stream_cold_7(&v28, v29);
  if (a2 == 3)
    xpc_remote_channel_attach_stream_cold_2(&v28, v29);
  v11 = v9;
  _log_0();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10 == 3)
  {
    if (v13)
      xpc_remote_channel_attach_stream_cold_3();

    dispatch_io_close(v8, 0);
    v14 = *((_QWORD *)v7 + 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __xpc_remote_channel_attach_stream_block_invoke;
    block[3] = &unk_1E9784BB0;
    v15 = &v27;
    v27 = v11;
    v16 = &v26;
    v26 = v7;
    dispatch_async(v14, block);
  }
  else
  {
    if (v13)
      xpc_remote_channel_attach_stream_cold_6();

    *((_DWORD *)v7 + 12) = a2;
    objc_storeStrong((id *)v7 + 8, a3);
    v17 = *((_QWORD *)v7 + 1);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __xpc_remote_channel_attach_stream_block_invoke_34;
    v22[3] = &unk_1E97849B0;
    v18 = v7;
    v23 = v18;
    v24 = v11;
    v19 = dispatch_io_create_with_io(0, v8, v17, v22);
    v20 = (void *)v18[7];
    v18[7] = v19;

    dispatch_io_set_low_water(v8, 1uLL);
    if (!v18[7])
      xpc_remote_channel_attach_stream_cold_4(&v28, v29);
    v15 = (id *)&v23;
    v16 = &v24;
    v21 = *((_DWORD *)v7 + 12);
    if (v21 == 2)
    {
      _xpc_remote_channel_enqueue_rx(v18);
    }
    else
    {
      if (v21 != 1)
        xpc_remote_channel_attach_stream_cold_5();
      _xpc_remote_channel_enqueue_tx(v18);
    }
  }

}

uint64_t __xpc_remote_channel_attach_stream_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 44));
}

uint64_t __xpc_remote_channel_attach_stream_block_invoke_34(uint64_t a1, unsigned int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;

  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __xpc_remote_channel_attach_stream_block_invoke_34_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = 0;

  xpc_remote_channel_cancel(*(void **)(a1 + 32), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void _xpc_remote_channel_enqueue_tx(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD io_handler[4];
  id v6;

  v1 = a1;
  if (*((_DWORD *)v1 + 10) <= 2u)
  {
    _log_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      _xpc_remote_channel_enqueue_tx_cold_1();

    v3 = *((_QWORD *)v1 + 7);
    v4 = *((_QWORD *)v1 + 1);
    io_handler[0] = MEMORY[0x1E0C809B0];
    io_handler[1] = 3221225472;
    io_handler[2] = ___xpc_remote_channel_enqueue_tx_block_invoke;
    io_handler[3] = &unk_1E9784C50;
    v6 = v1;
    dispatch_io_read(v3, 0, 0x20000uLL, v4, io_handler);

  }
}

void _xpc_remote_channel_enqueue_rx(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  _QWORD completion[4];
  id v5;

  v1 = a1;
  if (*((_DWORD *)v1 + 10) <= 2u)
  {
    _log_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      _xpc_remote_channel_enqueue_rx_cold_1((uint64_t)v1, v2);

    v3 = *((_QWORD *)v1 + 2);
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = ___xpc_remote_channel_enqueue_rx_block_invoke;
    completion[3] = &unk_1E9784B60;
    v5 = v1;
    nw_connection_receive(v3, 1u, 0x20000u, completion);

  }
}

void ___log_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.xpc.remote", "channel");
  v1 = (void *)_log_logger_0;
  _log_logger_0 = (uint64_t)v0;

}

void ___xpc_remote_channel_enqueue_tx_block_invoke(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  NSObject *v7;
  void **v8;
  uint64_t v9;
  unsigned int v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  size_t size;
  const char *v26;
  _QWORD v27[4];
  NSObject *v28;
  char v29;
  _QWORD completion[4];
  NSObject *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  size_t v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v8 = (void **)(a1 + 32);
  v10 = *(_DWORD *)(v9 + 40);
  _log_0();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10 < 3)
  {
    if (v12)
    {
      v24 = *v8;
      if (v7)
        size = dispatch_data_get_size(v7);
      else
        size = 0;
      v26 = "false";
      *(_DWORD *)buf = 134218754;
      v33 = v24;
      v34 = 2048;
      if (a2)
        v26 = "true";
      v35 = size;
      v36 = 1024;
      v37 = a4;
      v38 = 2080;
      v39 = v26;
      _os_log_debug_impl(&dword_1D4245000, v11, OS_LOG_TYPE_DEBUG, "[%p] IO read returned %zd bytes, error = %{errno}d, done = %s", buf, 0x26u);
    }

    v13 = MEMORY[0x1E0C80D00];
    _log_0();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v7 == v13 && !a4 && a2)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = *v8;
        *(_DWORD *)buf = 134217984;
        v33 = v16;
        _os_log_impl(&dword_1D4245000, v15, OS_LOG_TYPE_INFO, "[%p] IO read returned EOF, calling write_close", buf, 0xCu);
      }

      v17 = *v8;
      v18 = *((_QWORD *)*v8 + 2);
      v19 = *MEMORY[0x1E0CCECF8];
      completion[0] = MEMORY[0x1E0C809B0];
      completion[1] = 3221225472;
      completion[2] = ___xpc_remote_channel_enqueue_tx_block_invoke_45;
      completion[3] = &unk_1E9784C00;
      v31 = v17;
      nw_connection_send(v18, 0, v19, 1, completion);
      v11 = v31;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        ___xpc_remote_channel_enqueue_tx_block_invoke_cold_3();

      v20 = *v8;
      v21 = *((_QWORD *)*v8 + 2);
      v22 = *MEMORY[0x1E0CCECE8];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = ___xpc_remote_channel_enqueue_tx_block_invoke_46;
      v27[3] = &unk_1E9784C28;
      v28 = v20;
      v29 = a2;
      nw_connection_send(v21, v7, v22, 1, v27);
      if (a4)
      {
        _log_0();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          ___xpc_remote_channel_enqueue_tx_block_invoke_cold_2();

        xpc_remote_channel_cancel(*v8, a4);
      }
      v11 = v28;
    }
  }
  else if (v12)
  {
    ___xpc_remote_channel_enqueue_tx_block_invoke_cold_1();
  }

}

void ___xpc_remote_channel_enqueue_tx_block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___xpc_remote_channel_enqueue_tx_block_invoke_45_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134217984;
      v8 = v6;
      _os_log_impl(&dword_1D4245000, v5, OS_LOG_TYPE_INFO, "[%p] write-close succeeded, marking successful Tx", (uint8_t *)&v7, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  }

}

void ___xpc_remote_channel_enqueue_tx_block_invoke_46(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned int error_code;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _log_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v11 = 134218242;
      v12 = v5;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1D4245000, v4, OS_LOG_TYPE_INFO, "[%p] Connection write returned error %@", (uint8_t *)&v11, 0x16u);
    }

    v6 = *(void **)(a1 + 32);
    error_code = nw_error_get_error_code(v3);
    xpc_remote_channel_cancel(v6, error_code);
  }
  else
  {
    v8 = *(unsigned __int8 *)(a1 + 40);
    _log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
        ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_2();

      _xpc_remote_channel_enqueue_tx(*(_QWORD *)(a1 + 32));
    }
    else
    {
      if (v10)
        ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_1();

    }
  }

}

void ___xpc_remote_channel_enqueue_rx_block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  unsigned int error_code;
  NSObject *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD io_handler[4];
  _QWORD *v27;
  uint8_t buf[4];
  _QWORD *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v13 = *(_QWORD *)(a1 + 32);
  v12 = a1 + 32;
  if (*(_DWORD *)(v13 + 40) >= 3u)
  {
    _log_0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      ___xpc_remote_channel_enqueue_rx_block_invoke_cold_3(v12, v9, v14);

  }
  if (!v9 || v11)
  {
    if (v9 || !a4 || v11)
    {
      if (!v11)
        ___xpc_remote_channel_enqueue_rx_block_invoke_cold_2();
      _log_0();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = *(_QWORD **)v12;
        *(_DWORD *)buf = 134218242;
        v29 = v24;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_1D4245000, v23, OS_LOG_TYPE_INFO, "[%p] Connection read got error %@. Canceling remote channel.", buf, 0x16u);
      }

      v25 = *(_QWORD **)v12;
      error_code = nw_error_get_error_code(v11);
      v21 = v25;
    }
    else
    {
      _log_0();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = *(_QWORD **)v12;
        *(_DWORD *)buf = 134217984;
        v29 = v20;
        _os_log_impl(&dword_1D4245000, v19, OS_LOG_TYPE_INFO, "[%p] Connection read got EOF. Canceling remote channel.", buf, 0xCu);
      }

      v21 = *(_QWORD **)v12;
      error_code = 0;
    }
    xpc_remote_channel_cancel(v21, error_code);
  }
  else
  {
    _log_0();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      ___xpc_remote_channel_enqueue_rx_block_invoke_cold_1(v12, v9, v15);

    v16 = *(_QWORD **)v12;
    v17 = *(NSObject **)(*(_QWORD *)v12 + 56);
    v18 = v16[1];
    io_handler[0] = MEMORY[0x1E0C809B0];
    io_handler[1] = 3221225472;
    io_handler[2] = ___xpc_remote_channel_enqueue_rx_block_invoke_48;
    io_handler[3] = &unk_1E9784C50;
    v27 = v16;
    dispatch_io_write(v17, 0, v9, v18, io_handler);

  }
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_48(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  NSObject *v7;
  void **v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v8 = (void **)(a1 + 32);
  if (*(_DWORD *)(v9 + 40) <= 2u)
  {
    if (a4)
    {
      if ((a2 & 1) == 0)
        ___xpc_remote_channel_enqueue_rx_block_invoke_48_cold_2(&v13, buf);
      _log_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *v8;
        *(_DWORD *)buf = 134218240;
        v15 = v11;
        v16 = 1024;
        v17 = a4;
        _os_log_impl(&dword_1D4245000, v10, OS_LOG_TYPE_INFO, "[%p] IO write got error %d", buf, 0x12u);
      }

      xpc_remote_channel_cancel(*v8, a4);
LABEL_10:
      _xpc_remote_channel_enqueue_rx(*v8);
      goto LABEL_11;
    }
    _log_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      ___xpc_remote_channel_enqueue_rx_block_invoke_48_cold_1((int)v8, v7, v12);

    if (a2)
      goto LABEL_10;
  }
LABEL_11:

}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return _os_log_send_and_compose_impl();
}

void OUTLINED_FUNCTION_15_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_16_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

size_t OUTLINED_FUNCTION_20_0(int a1, dispatch_data_t data)
{
  return dispatch_data_get_size(data);
}

BOOL OUTLINED_FUNCTION_21_0()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

_QWORD *xpc_remote_listener_create_for_remote_service(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = a3;
  v10 = (_QWORD *)objc_opt_new();
  v11 = (void *)v10[1];
  v10[1] = v7;
  v12 = v7;

  v13 = MEMORY[0x1D825A744](v9);
  v14 = (void *)v10[3];
  v10[3] = v13;

  v15 = MEMORY[0x1D825A744](v8);
  v16 = (void *)v10[4];
  v10[4] = v15;

  if (_log_onceToken_1 != -1)
    dispatch_once(&_log_onceToken_1, &__block_literal_global_1);
  v17 = _log_logger_1;
  if (os_log_type_enabled((os_log_t)_log_logger_1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = a1;
    _os_log_impl(&dword_1D4245000, v17, OS_LOG_TYPE_DEFAULT, "Checking in for remote service: %s", buf, 0xCu);
  }
  v19 = v10;
  remote_service_listen_with_device();

  return v19;
}

uint64_t __xpc_remote_listener_create_for_remote_service_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
}

void xpc_remote_listener_cancel(void *a1)
{
  dispatch_queue_t *v1;

  v1 = a1;
  dispatch_assert_queue_V2(v1[1]);
  if (*((_DWORD *)v1 + 4) != 1)
  {
    *((_BYTE *)v1 + 40) = 1;
    _os_crash();
    __break(1u);
  }
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void ___log_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.xpc.remote", "listener");
  v1 = (void *)_log_logger_1;
  _log_logger_1 = (uint64_t)v0;

}

void xpc_remote_connection_get_remote_service_version_cold_1()
{
  _os_crash();
  __break(1u);
}

void __xpc_remote_connection_set_local_service_version_block_invoke_cold_1()
{
  _os_crash();
  __break(1u);
}

void xpc_remote_connection_create_with_remote_service_cold_1()
{
  _os_crash();
  __break(1u);
}

void xpc_remote_connection_create_with_remote_service_cold_2()
{
  _os_crash();
  __break(1u);
}

void xpc_remote_connection_create_with_remote_service_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_18(&dword_1D4245000, a1, a3, "Creating remote connection from service with invalid version flags, falling back", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_27();
}

void xpc_remote_connection_set_tls_cold_1()
{
  _os_crash();
  __break(1u);
}

void xpc_remote_connection_set_tls_cold_2()
{
  _os_crash();
  __break(1u);
}

void xpc_remote_connection_set_tls_cold_3()
{
  _os_crash();
  __break(1u);
}

void _xpc_remote_connection_parse_flags_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void xpc_remote_connection_create_remote_service_listener_cold_1()
{
  _os_crash();
  __break(1u);
}

void _xpc_remote_connection_parse_mode_flags_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] RemoteXPC in server mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_connection_setup_nw_parameters_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void __xpc_remote_connection_activate_block_invoke_cold_1()
{
  _os_crash();
  __break(1u);
}

void __xpc_remote_connection_activate_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void __xpc_remote_connection_activate_block_invoke_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _xpc_remote_connection_connect_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void xpc_remote_connection_send_message_cold_1()
{
  _os_crash();
  __break(1u);
}

void __xpc_remote_connection_send_message_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _xpc_remote_message_create_cold_2()
{
  _os_crash();
  __break(1u);
}

void _xpc_remote_connection_send_reply_message_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void __xpc_remote_connection_send_message_with_reply_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void xpc_remote_connection_send_message_with_reply_sync_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Semaphore signaled. Returning reply.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_connection_send_message_with_reply_sync_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Waiting on semaphore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_connection_send_message_with_reply_sync_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Doing synchronous message-send with reply...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_connection_send_message_with_reply_sync_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Received reply", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_connection_send_reply_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void __xpc_remote_connection_message_dispose_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___xpc_remote_connection_listen_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___xpc_remote_connection_listen_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___xpc_remote_connection_listen_block_invoke_cold_3()
{
  _os_crash();
  __break(1u);
}

void ___xpc_remote_connection_listen_block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_18(&dword_1D4245000, a1, a3, "Creating remote connection from device with invalid version flags, falling back", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_27();
}

void _xpc_remote_connection_connect_complete_cold_1()
{
  _os_crash();
  __break(1u);
}

void _xpc_remote_connection_connect_complete_cold_3()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const void *v3;
  const void *v4;

  OUTLINED_FUNCTION_14();
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_21(&dword_1D4245000, v1, v2, "[%p] root channel (%p) created", v3, v4);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_connect_complete_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4();
  __error();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void _xpc_remote_connection_connect_complete_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4();
  __error();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void _xpc_remote_connection_connect_complete_cold_6(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  __error();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_7();
  _os_crash_msg();
  __break(1u);
}

void _xpc_remote_connection_connect_complete_cold_7(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  _os_crash_msg();
  __break(1u);
}

uint64_t _xpc_remote_connection_connect_complete_cold_8()
{
  __error();
  return OUTLINED_FUNCTION_26();
}

void _xpc_remote_connection_connect_complete_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] connect completed after connection got cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_connect_complete_cold_10(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void _xpc_remote_connection_connect_complete_cold_11(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void _xpc_remote_connection_connect_complete_cold_12(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void _xpc_remote_connection_connect_failed_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _xpc_remote_connection_connect_failed_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void _xpc_remote_connection_connect_failed_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] connect failed after connection got cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_connect_failed_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _xpc_remote_connection_connect_failed_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _xpc_remote_connection_connect_doa_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _xpc_remote_connection_handle_read_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Received inconsistent msg_flags", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Invalid send-once notification received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Invalid message received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_15(&dword_1D4245000, v0, v1, "[%p] Received bogus reply message %llu", v2, v3);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _xpc_remote_connection_handle_read_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_15(&dword_1D4245000, v0, v1, "[%p] Received reply on a non-reply channel (%p) from a peer that should know better", v2, v3);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] connection_connected: still waiting on root channel HELO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] connection_connected: still waiting on reply channel HELO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_9(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void _xpc_remote_connection_handle_read_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] empty HELO message received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Root channel invalid HELO received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_12()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const char *v3;

  OUTLINED_FUNCTION_14();
  WORD2(v3) = 2080;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_21(&dword_1D4245000, v0, v1, "[%p] HELO message received: %s", v2, v3);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Root channel duplicate HELO received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Reply channel duplicate HELO received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Received HELO for unknown channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] listener got error %{errno}d");
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_connection_teardown_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] disconnect: already disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_connection_teardown_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void __xpc_remote_connection_teardown_continue_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void __xpc_remote_connection_teardown_continue_cold_2()
{
  _os_crash();
  __break(1u);
}

void __xpc_remote_connection_teardown_continue_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] disconnect_continue: at least one stream channel still present", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_connection_teardown_continue_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] disconnect_continue: root_listener still present", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_connection_teardown_continue_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] disconnect_continue: reply_channel still present", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_connection_teardown_continue_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] disconnect_continue: root_channel still present", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_connection_teardown_continue_cold_7(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void _xpc_remote_connection_flush_cold_1()
{
  _os_crash();
  __break(1u);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Got READY for incoming stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_cold_2(_QWORD *a1, _OWORD *a2, id *a3)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_8(MEMORY[0x1E0C81028]);
  objc_msgSend(*a3, "state");
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] Got HEADER with invalid msg_flags %hu", v2, v3);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Got HEADER with invalid msg_id 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] First message server reply channel not OPENS_REPLY_CHANNEL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_15(&dword_1D4245000, v0, v1, "[%p] Remote server attempted to open a reply channel (channel %p)", v2, v3);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_15(&dword_1D4245000, v0, v1, "[%p] Remote peer attempted to open multiple reply channels (channel %p)", v2, v3);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Unexpected non-HEADER message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_219_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] Got error %{errno}d on reply HELO send");
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_channel_send_stream_header_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _xpc_remote_channel_send_stream_header_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___xpc_remote_connection_ready_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] Got error %{errno}d on HELO send");
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_ready_block_invoke_223_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] Got CANCELED with error %{errno}d on reply channel");
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_connection_handle_read_block_invoke_cold_1()
{
  _os_crash();
  __break(1u);
}

void _xpc_remote_connection_wakeup_cold_1()
{
  _os_crash();
  __break(1u);
}

void _xpc_remote_connection_wakeup_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] wakeup while connecting, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_send_ool_message_content_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void _xpc_remote_connection_send_ool_message_content_cold_2()
{
  _os_crash();
  __break(1u);
}

void ___xpc_remote_connection_wakeup_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] Send failed with %{errno}d, not triggering wakeup");
  OUTLINED_FUNCTION_9();
}

void ___recv_file_transfer_block_invoke_2_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___recv_file_transfer_block_invoke_2_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___recv_file_transfer_block_invoke_5_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void ___xpc_remote_message_create_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_18(&dword_1D4245000, a1, a3, "Attempt to send a message with too many OOL objects", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_27();
}

void ___xpc_remote_message_create_block_invoke_cold_2()
{
  _os_crash();
  __break(1u);
}

void ___xpc_remote_connection_send_reply_message_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] Reply send failed with %{errno}d");
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_create_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Channel Starting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] Unexpected nw_connection state: %d", v2, v3);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_16_0(&dword_1D4245000, v1, (uint64_t)v1, "[%p] Got nw_connection failed with error %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Channel Ready", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void __xpc_remote_channel_create_block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Got nw_connection ready", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_cancel_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] channel_cancel: closing stream_io", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_cancel_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] channel_cancel: closing parent_io", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_cancel_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] channel_cancel: canceling nw_connection_t", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Tx stream got read closed, waiting for state_failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_21_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Got read closed, CANCELING", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_21_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Rx stream got read closed, reading until error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_21_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Got nw_connection read close", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Got nw_connection write close", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Got nw_connection cancel handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_29_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_1D4245000, v0, v1, "[%p] Got error %{errno}d on PING send");
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_arm_read_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void xpc_remote_channel_arm_read_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Not arming header read on connectionless channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_arm_read_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Arming read", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_arm_read_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Invalid message size received, disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_arm_read_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void __xpc_remote_channel_arm_read_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Not arming body read on connectionless channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_arm_read_block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_6_0(&dword_1D4245000, v0, v1, "[%p] Enqueueing body read of %u bytes", v2, v3);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_arm_read_block_invoke_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  v3 = 1040;
  v4 = 24;
  v5 = 2096;
  v6 = v0;
  _os_log_debug_impl(&dword_1D4245000, v1, OS_LOG_TYPE_DEBUG, "[%p] Header recieved. %{struct:remote_wire_header}.*P", v2, 0x1Cu);
}

void xpc_remote_channel_attach_stream_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void xpc_remote_channel_attach_stream_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void xpc_remote_channel_attach_stream_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] not attaching", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_attach_stream_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void xpc_remote_channel_attach_stream_cold_5()
{
  _os_crash();
  __break(1u);
}

void xpc_remote_channel_attach_stream_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_6_0(&dword_1D4245000, v0, v1, "[%p] attaching channel to stream (direction=%d)...", v2, v3);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_attach_stream_cold_7(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void __xpc_remote_channel_attach_stream_block_invoke_34_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1D4245000, v0, v1, "[%p] IO cleanup handler called with error = %{errno}d");
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_channel_enqueue_tx_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Enqueueing IO read", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_channel_enqueue_rx_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 134218496;
  v3 = a1;
  v4 = 1024;
  v5 = 1;
  v6 = 1024;
  v7 = 0x20000;
  _os_log_debug_impl(&dword_1D4245000, a2, OS_LOG_TYPE_DEBUG, "[%p] Enqueueing connection read for %d to %d bytes", (uint8_t *)&v2, 0x18u);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1D4245000, v0, v1, "[%p] Body read returned without data, disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Body received.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_15_0(&dword_1D4245000, v1, (uint64_t)v1, "[%p] Body read returned with error=%@, disconnecting", v2);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] IO read returned post-cancel, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1D4245000, v0, v1, "[%p] IO read got error %d", v2, v3);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Enqueueing conn write", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_45_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_15_0(&dword_1D4245000, v1, (uint64_t)v1, "[%p] write close failed with error %@", v2);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Connection write completed, more writes expected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6(&dword_1D4245000, v0, v1, "[%p] Connection write completed, reenqueueing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_1(int a1, NSObject *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_20_0(a1, a2);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(&dword_1D4245000, a3, v4, "[%p] Connection read succeeded for %zd bytes. Enqueueing IO write.", v5);
  OUTLINED_FUNCTION_14_0();
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_2()
{
  _os_crash();
  __break(1u);
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_3(int a1, NSObject *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a2)
    OUTLINED_FUNCTION_20_0(a1, a2);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15_0(&dword_1D4245000, a3, v4, "[%p] DROPPING %zu bytes on canceled stream", v5);
  OUTLINED_FUNCTION_14_0();
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_48_cold_1(int a1, NSObject *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a2)
    OUTLINED_FUNCTION_20_0(a1, a2);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(&dword_1D4245000, a3, v4, "[%p] IO write complete, %zd bytes remaining", v5);
  OUTLINED_FUNCTION_14_0();
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_48_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C80FF8]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

uint64_t _xpc_dictionary_extract_reply_msg_id()
{
  return MEMORY[0x1E0C81248]();
}

uint64_t _xpc_dictionary_get_reply_msg_id()
{
  return MEMORY[0x1E0C81250]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD0](data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x1E0C82D58](channel, flags);
}

dispatch_io_t dispatch_io_create_with_io(dispatch_io_type_t type, dispatch_io_t io, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D68](type, io, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82D80](channel, offset, length, queue, io_handler);
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
  MEMORY[0x1E0C82D98](channel, low_water);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82DA0](channel, offset, data, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x1E0CCEFE0]();
}

nw_parameters_t nw_connection_copy_parameters(nw_connection_t connection)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF018](connection);
}

uint64_t nw_connection_create_with_connected_socket_and_parameters()
{
  return MEMORY[0x1E0CCF058]();
}

uint64_t nw_connection_create_with_connection()
{
  return MEMORY[0x1E0CCF060]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF128](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

uint64_t nw_connection_set_adaptive_write_handler()
{
  return MEMORY[0x1E0CCF178]();
}

uint64_t nw_connection_set_cancel_handler()
{
  return MEMORY[0x1E0CCF188]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1E0CCF190]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x1E0CCF1B8]();
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
  MEMORY[0x1E0CCF1C8](connection, handler);
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x1E0CCF1D0]();
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1E0CCF340](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1E0CCF468](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1E0CCF470](error);
}

void nw_listener_cancel(nw_listener_t listener)
{
  MEMORY[0x1E0CCF7C8](listener);
}

nw_listener_t nw_listener_create_with_connection(nw_connection_t connection, nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1E0CCF7E0](connection, parameters);
}

uint64_t nw_listener_set_event_handler()
{
  return MEMORY[0x1E0CCF800]();
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x1E0CCF810](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF820](listener, queue);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x1E0CCF830](listener);
}

uint64_t nw_parameters_add_protocol_stack_member()
{
  return MEMORY[0x1E0CCF898]();
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF8B8](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF930]();
}

uint64_t nw_parameters_create_protocol_parameters()
{
  return MEMORY[0x1E0CCF958]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF980](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x1E0CCFA98]();
}

uint64_t nw_parameters_set_server_mode()
{
  return MEMORY[0x1E0CCFC20]();
}

uint64_t nw_protocol_http2_transport_identifier()
{
  return MEMORY[0x1E0CCFF40]();
}

uint64_t nw_protocol_http2_transport_parameters_set_connection_receive_window_size()
{
  return MEMORY[0x1E0CCFF48]();
}

uint64_t nw_protocol_http2_transport_parameters_set_stream_receive_window_size()
{
  return MEMORY[0x1E0CCFF50]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x1E0CD03C8](options);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t remote_device_copy_xpc_remote_connection_tls_identity()
{
  return MEMORY[0x1E0D87060]();
}

uint64_t remote_device_copy_xpc_remote_connection_tls_verify_block()
{
  return MEMORY[0x1E0D87068]();
}

uint64_t remote_device_get_xpc_remote_connection_mode_flags()
{
  return MEMORY[0x1E0D870A0]();
}

uint64_t remote_device_get_xpc_remote_connection_version_flags()
{
  return MEMORY[0x1E0D870A8]();
}

uint64_t remote_device_xpc_remote_connection_tls_enabled()
{
  return MEMORY[0x1E0D87100]();
}

uint64_t remote_service_connect_socket()
{
  return MEMORY[0x1E0D87108]();
}

uint64_t remote_service_copy_device()
{
  return MEMORY[0x1E0D87110]();
}

uint64_t remote_service_copy_xpc_remote_connection_tls_identity()
{
  return MEMORY[0x1E0D87118]();
}

uint64_t remote_service_copy_xpc_remote_connection_tls_verify_block()
{
  return MEMORY[0x1E0D87120]();
}

uint64_t remote_service_get_name()
{
  return MEMORY[0x1E0D87128]();
}

uint64_t remote_service_get_version()
{
  return MEMORY[0x1E0D87130]();
}

uint64_t remote_service_get_xpc_remote_connection_version_flags()
{
  return MEMORY[0x1E0D87138]();
}

uint64_t remote_service_listen_with_device()
{
  return MEMORY[0x1E0D87140]();
}

uint64_t remote_service_xpc_remote_connection_tls_enabled()
{
  return MEMORY[0x1E0D87148]();
}

uint64_t remote_socket_create_connected_ipv6_pair()
{
  return MEMORY[0x1E0D87150]();
}

void sec_protocol_options_append_tls_ciphersuite_group(sec_protocol_options_t options, tls_ciphersuite_group_t group)
{
  MEMORY[0x1E0CD7248](options, group);
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
  MEMORY[0x1E0CD72B8](options, identity);
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x1E0CD72C0](options, version);
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x1E0CD72C8](options, version);
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
  MEMORY[0x1E0CD72E8](options, peer_authentication_required);
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
  MEMORY[0x1E0CD7350](options, verify_block, verify_block_queue);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x1E0C85458](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

uint64_t xpc_create_from_serialization()
{
  return MEMORY[0x1E0C86168]();
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

uint64_t xpc_extension_type_init()
{
  return MEMORY[0x1E0C86490]();
}

uint64_t xpc_file_transfer_copy_io()
{
  return MEMORY[0x1E0C864B8]();
}

uint64_t xpc_file_transfer_get_transfer_id()
{
  return MEMORY[0x1E0C864D8]();
}

uint64_t xpc_file_transfer_send_finished()
{
  return MEMORY[0x1E0C864E0]();
}

uint64_t xpc_file_transfer_set_transport_writing_callbacks()
{
  return MEMORY[0x1E0C864E8]();
}

uint64_t xpc_file_transfer_write_finished()
{
  return MEMORY[0x1E0C864F0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_install_remote_hooks()
{
  return MEMORY[0x1E0C86558]();
}

uint64_t xpc_make_serialization()
{
  return MEMORY[0x1E0C86610]();
}

uint64_t xpc_make_serialization_with_ool()
{
  return MEMORY[0x1E0C86618]();
}

uint64_t xpc_receive_remote_msg()
{
  return MEMORY[0x1E0C86650]();
}

void xpc_transaction_begin(void)
{
  MEMORY[0x1E0C86768]();
}

