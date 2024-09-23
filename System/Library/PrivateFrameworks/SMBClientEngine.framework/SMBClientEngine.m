void piston_set_info(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  void *v13;
  void *v14;

  v9 = a1;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v9, "pd");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_set_info_cold_1();
      if (!v12)
        goto LABEL_8;
    }
    else if (!v12)
    {
      goto LABEL_8;
    }
    v12[2](v12, 57);
    goto LABEL_8;
  }
  if (smb2_smb_set_info(v9, a2, v10, v11, 0, v12)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    piston_set_info_cold_2();
  }
LABEL_8:

}

uint64_t smb2_smb_set_info(void *a1, uint64_t a2, void *a3, void *a4, _QWORD *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t uint16le;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  char *cstring_len;
  _DWORD *v25;
  uint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  __int16 v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void (**v42)(id, uint64_t);
  id v43;
  void *v44;
  NSObject *v45;
  id v46;
  _QWORD *v47;
  _DWORD *v49;
  _QWORD v50[4];
  id v51;
  void (**v52)(id, uint64_t);
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  id v56;
  unsigned int v57;
  _QWORD __src[3];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t buf[32];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  memset(__src, 0, 20);
  v57 = 0;
  v15 = objc_msgSend(v11, "treeID");
  v16 = objc_msgSend(v11, "onEncryptedShare");
  objc_msgSend(v11, "pd");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  uint16le = smb2_rq_alloc(17, v15, v16, 0, v17, &v56);
  v19 = v56;

  if (!(_DWORD)uint16le)
  {
    v20 = objc_msgSend(v19, "smb_rq_getrequest");
    mb_put_uint16le(v20, 33);
    mb_put_uint8(v20, *(_BYTE *)(a2 + 4));
    mb_put_uint8(v20, *(_BYTE *)(a2 + 5));
    v49 = (_DWORD *)mb_reserve(v20, 4uLL);
    mb_put_uint16le(v20, 96);
    mb_put_uint16le(v20, 0);
    mb_put_uint32le(v20, *(_DWORD *)(a2 + 8));
    if (a5)
    {
      v21 = -1;
      mb_put_uint64le(v20, -1);
    }
    else
    {
      mb_put_uint64le(v20, objc_msgSend(v11, "fid"));
      objc_msgSend(v11, "fid");
      v21 = v22;
    }
    mb_put_uint64le(v20, v21);
    v23 = *(unsigned __int8 *)(a2 + 5);
    if (v23 > 0x12)
    {
      if (v23 - 19 >= 2)
        goto LABEL_25;
      *v49 = 8;
      mb_put_uint64le(v20, *(_QWORD *)(a2 + 32));
    }
    else
    {
      if (v23 != 4)
      {
        if (v23 == 10)
        {
          cstring_len = (char *)smb_get_cstring_len(v13, &v57);
          mb_put_uint8(v20, *(_DWORD *)(a2 + 80) & 1);
          v25 = (_DWORD *)mb_reserve(v20, 7uLL);
          *(_DWORD *)((char *)v25 + 3) = 0;
          *v25 = 0;
          mb_put_uint64le(v20, 0);
          v26 = mb_reserve(v20, 4uLL);
          if (cstring_len)
          {
            v27 = (_DWORD *)v26;
            smb2_rq_bstart32(v19, v26);
            uint16le = smb2fs_fullpath(v20, cstring_len, v57, 0, 0, 32);
            if ((_DWORD)uint16le)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_set_info_cold_5();
              if (v19)
                objc_msgSend(v19, "smb_rq_done");
              if (v14)
                goto LABEL_5;
              goto LABEL_77;
            }
            smb_rq_bend32(v19);
            mb_put_mem(v20, 0, 4uLL, 3);
            *v49 = *v27 + 24;
            goto LABEL_37;
          }
          if (v19)
            objc_msgSend(v19, "smb_rq_done");
          if (v14)
            goto LABEL_31;
          goto LABEL_35;
        }
        if (v23 == 13)
        {
          *v49 = 1;
          mb_put_uint8(v20, *(_QWORD *)(a2 + 32) == 1);
LABEL_37:
          objc_msgSend(v19, "smb_rq_set_extflag:", 8);
          goto LABEL_38;
        }
LABEL_25:
        if (*(_BYTE *)(a2 + 4) == 3)
          goto LABEL_37;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_set_info_cold_4();
        if (v19)
          objc_msgSend(v19, "smb_rq_done");
        if (v14)
        {
LABEL_31:
          uint16le = 22;
          v14[2](v14, 22);
          goto LABEL_77;
        }
LABEL_35:
        uint16le = 22;
        goto LABEL_77;
      }
      *v49 = 40;
      mb_put_uint64le(v20, *(_QWORD *)(a2 + 40));
      mb_put_uint64le(v20, *(_QWORD *)(a2 + 48));
      mb_put_uint64le(v20, *(_QWORD *)(a2 + 56));
      mb_put_uint64le(v20, *(_QWORD *)(a2 + 64));
      mb_put_uint32le(v20, *(_DWORD *)(a2 + 72));
      mb_put_uint32le(v20, 0);
    }
LABEL_38:
    if (*(_BYTE *)(a2 + 4) == 3)
    {
      v28 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
      v29 = (_QWORD *)v28;
      memset((char *)__src + 1, 0, 19);
      LOBYTE(__src[0]) = 1;
      v30 = *(_WORD *)(v28 + 4);
      v31 = 20;
      v32 = *(_QWORD *)(v28 + 8);
      if (v32)
      {
        HIDWORD(__src[0]) = 20;
        v31 = 4 * *(unsigned __int8 *)(v32 + 1) + 28;
      }
      v33 = *(_QWORD *)(v28 + 16);
      if (v33)
      {
        LODWORD(__src[1]) = v31;
        v31 += 4 * *(unsigned __int8 *)(v33 + 1) + 8;
      }
      v34 = *(_QWORD *)(v28 + 24);
      if (v34)
      {
        v35 = v30 | 0x8A10;
        HIDWORD(__src[1]) = v31;
        v31 += *(unsigned __int16 *)(v34 + 2);
      }
      else
      {
        v35 = v30 | 0x8000;
      }
      v36 = *(_QWORD *)(v28 + 32);
      if (v36)
      {
        v35 |= 0x504u;
        LODWORD(__src[2]) = v31;
        v31 += *(unsigned __int16 *)(v36 + 2);
      }
      *v49 = v31;
      WORD1(__src[0]) = v35;
      mb_put_mem(v20, (char *)__src, 0x14uLL, 0);
      v37 = v29[1];
      if (v37)
        mb_put_mem(v20, (char *)v37, 4 * *(unsigned __int8 *)(v37 + 1) + 8, 0);
      v38 = v29[2];
      if (v38)
        mb_put_mem(v20, (char *)v38, 4 * *(unsigned __int8 *)(v38 + 1) + 8, 0);
      v39 = v29[3];
      if (v39)
        mb_put_mem(v20, (char *)v39, *(unsigned __int16 *)(v39 + 2), 0);
      v40 = v29[4];
      if (v40)
        mb_put_mem(v20, (char *)v40, *(unsigned __int16 *)(v40 + 2), 0);
    }
    if (a5)
    {
      smb2_rq_align8(v19);
      objc_msgSend(v19, "smb_rq_set_srflags:", 256);
      uint16le = 0;
      *a5 = objc_retainAutorelease(v19);
    }
    else if (v14)
    {
      objc_msgSend(v11, "pd");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __smb2_smb_set_info_block_invoke;
      v50[3] = &unk_24FE01348;
      v42 = v14;
      v52 = v42;
      v55 = a2;
      v43 = v19;
      v51 = v43;
      v53 = &v63;
      v54 = &v59;
      uint16le = smb_rq_simple_block(v41, v43, v50);

      if ((_DWORD)uint16le)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_set_info_cold_3();
        if (v43)
          objc_msgSend(v43, "smb_rq_done");
        v42[2](v42, uint16le);
      }

    }
    else
    {
      objc_msgSend(v11, "pd");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      uint16le = smb_rq_simple(v44, v19);

      *(_DWORD *)(a2 + 84) = objc_msgSend(v19, "sr_ntstatus");
      if ((_DWORD)uint16le)
      {
        v45 = MEMORY[0x24BDACB70];
        v46 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          smb2_smb_set_info_cold_2(buf, uint16le, objc_msgSend(v19, "sr_ntstatus"));

      }
      else
      {
        v47 = (_QWORD *)objc_msgSend(v19, "smb_rq_getreply");
        v64[3] = (uint64_t)v47;
        uint16le = md_get_uint16le(v47, (_WORD *)v60 + 12);
        if (!(_DWORD)uint16le)
        {
          if (*((_WORD *)v60 + 12) == 2)
          {
            uint16le = 0;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              smb2_smb_set_info_cold_1();
            uint16le = 72;
          }
        }
      }
      objc_msgSend(v19, "smb_rq_done");
    }
    goto LABEL_77;
  }
  if (v19)
    objc_msgSend(v19, "smb_rq_done");
  if (v14)
LABEL_5:
    v14[2](v14, uint16le);
LABEL_77:
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return uint16le;
}

void sub_23029086C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void __smb2_smb_set_info_block_invoke(uint64_t a1, uint64_t uint16le)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 40));
  v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(_QWORD *)(a1 + 64) + 84) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)uint16le)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_set_info_block_invoke_cold_2((id *)(a1 + 32));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    v6 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v8 = *(_QWORD *)(a1 + 56);
    v7 = a1 + 56;
    uint16le = md_get_uint16le(v6, (_WORD *)(*(_QWORD *)(v8 + 8) + 24));
    if (!(_DWORD)uint16le)
    {
      if (*(_WORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24) == 2)
      {
        uint16le = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __smb2_smb_set_info_block_invoke_cold_1();
        uint16le = 72;
      }
    }
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, uint16le);

}

uint64_t smb2fs_smb_set_delete(void *a1)
{
  uint64_t v1;
  _OWORD v3[5];
  uint64_t v4;

  v4 = 0;
  memset(&v3[3], 0, 32);
  memset(v3, 0, 32);
  WORD2(v3[0]) = 3329;
  v3[2] = 1uLL;
  v1 = smb2_smb_set_info(a1, (uint64_t)v3, 0, 0, 0, 0);
  if ((_DWORD)v1 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    smb2fs_smb_set_delete_cold_1();
  return v1;
}

uint64_t smb2fs_smb_set_eof(void *a1, unint64_t a2)
{
  uint64_t v2;
  _OWORD v4[5];
  uint64_t v5;

  v5 = 0;
  memset(&v4[3], 0, 32);
  memset(v4, 0, 32);
  WORD2(v4[0]) = 5121;
  v4[2] = a2;
  v2 = smb2_smb_set_info(a1, (uint64_t)v4, 0, 0, 0, 0);
  if ((_DWORD)v2 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    smb2fs_smb_set_eof_cold_1();
  return v2;
}

uint64_t smb2fs_smb_setfattrNT(void *a1, unsigned int a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v9 = a1;
  objc_msgSend(v9, "pd", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getShare:", objc_msgSend(v9, "shareID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v28 = 0;
    if (a3)
    {
      smb_time_local2NT(a3, (uint64_t *)&v28, objc_msgSend(v11, "fstype") == 1);
      a3 = v28;
    }
    v28 = 0;
    if (a5)
    {
      smb_time_local2NT(a5, (uint64_t *)&v28, objc_msgSend(v11, "fstype") == 1);
      a5 = v28;
    }
    v28 = 0;
    if (a4)
    {
      smb_time_local2NT(a4, (uint64_t *)&v28, objc_msgSend(v11, "fstype") == 1);
      a4 = v28;
    }

    WORD2(v22) = 1025;
    *((_QWORD *)&v23 + 1) = a3;
    v24 = a5;
    v25 = a4;
    v26 = 0;
    v27 = a2;
    v12 = smb2_smb_set_info(v9, (uint64_t)&v22, 0, 0, 0, 0);
    if ((_DWORD)v12 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2fs_smb_setfattrNT_cold_3();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2fs_smb_setfattrNT_cold_2(v9);

    if (piston_log_level)
    {
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v13)
        smb2fs_smb_setfattrNT_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    v12 = 22;
  }

  return v12;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void piston_read(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a1;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v8, "pd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
    {
      piston_read_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
      if (!v10)
        goto LABEL_8;
    }
    else if (!v10)
    {
      goto LABEL_8;
    }
    v10[2](v10, 57);
    goto LABEL_8;
  }
  if (smb2_smb_read_one(v8, a2, v9, 0, v10)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    piston_read_cold_2();
  }
LABEL_8:

}

uint64_t smb2_smb_read_one(void *a1, uint64_t a2, void *a3, _QWORD *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  unsigned int v38;

  v9 = a1;
  v10 = a3;
  v11 = a5;
  v12 = *(_DWORD *)(a2 + 16);
  objc_msgSend(v9, "pd");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_DWORD *)(objc_msgSend(v13, "getSessionPtr") + 84);

  if (v14 >= v12)
    v15 = v12;
  else
    v15 = v14;
  v38 = v15;
  v16 = objc_msgSend(v9, "treeID");
  v17 = objc_msgSend(v9, "onEncryptedShare");
  objc_msgSend(v9, "pd");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v19 = smb2_rq_alloc(8, v16, v17, &v38, v18, &v37);
  v20 = v37;

  if (!(_DWORD)v19)
  {
    if (v12 >= v38)
      v21 = v12 - v38;
    else
      v21 = 0;
    v22 = objc_msgSend(v20, "smb_rq_getrequest");
    mb_put_uint16le(v22, 49);
    mb_put_uint16le(v22, 0);
    mb_put_uint32le(v22, v38);
    mb_put_uint64le(v22, *(_QWORD *)a2);
    if (a4)
    {
      v23 = -1;
      mb_put_uint64le(v22, -1);
    }
    else
    {
      mb_put_uint64le(v22, objc_msgSend(v9, "fid"));
      objc_msgSend(v9, "fid");
      v23 = v24;
    }
    mb_put_uint64le(v22, v23);
    mb_put_uint32le(v22, 1);
    mb_put_uint32le(v22, 0);
    mb_put_uint32le(v22, v21);
    mb_put_uint32le(v22, 0);
    mb_put_uint8(v22, 0);
    if (a4)
    {
      smb2_rq_align8(v20);
      objc_msgSend(v20, "smb_rq_set_srflags:", 256);
      v19 = 0;
      *a4 = objc_retainAutorelease(v20);
      goto LABEL_24;
    }
    objc_msgSend(v9, "pd");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __smb2_smb_read_one_block_invoke;
    v32 = &unk_24FE01370;
    v26 = v11;
    v35 = v26;
    v36 = a2;
    v27 = v20;
    v33 = v27;
    v34 = v10;
    v19 = smb_rq_simple_block(v25, v27, &v29);

    if (!(_DWORD)v19)
    {
LABEL_23:

      goto LABEL_24;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      smb2_smb_read_one_cold_1();
      if (!v27)
      {
LABEL_21:
        if (v26)
          (*((void (**)(id, uint64_t))v26 + 2))(v26, v19);
        goto LABEL_23;
      }
    }
    else if (!v27)
    {
      goto LABEL_21;
    }
    objc_msgSend(v27, "smb_rq_done", v29, v30, v31, v32, v33);
    goto LABEL_21;
  }
  if (v20)
    objc_msgSend(v20, "smb_rq_done");
  if (v11)
    (*((void (**)(id, uint64_t))v11 + 2))(v11, v19);
LABEL_24:

  return v19;
}

void piston_write(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a1;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "pd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
    {
      piston_write_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
      if (!v10)
        goto LABEL_8;
    }
    else if (!v10)
    {
      goto LABEL_8;
    }
    v10[2](v10, 57);
    goto LABEL_8;
  }
  if (smb2_smb_write_one(v8, a2, v9, 0, v10)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    piston_write_cold_2();
  }
LABEL_8:

}

uint64_t smb2_smb_write_one(void *a1, uint64_t a2, void *a3, _QWORD *a4, void *a5)
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  unsigned int v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void *v29;
  void (**v30)(id, uint64_t);
  id v31;
  _QWORD v32[4];
  id v33;
  void (**v34)(id, uint64_t);
  uint64_t v35;
  id v36;
  unsigned int v37;

  v9 = a1;
  v10 = a3;
  v11 = a5;
  v12 = *(_DWORD *)(a2 + 16);
  objc_msgSend(v9, "pd");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "getSessionPtr");

  v15 = *(_DWORD *)(v14 + 88);
  if (v15 >= v12)
    v15 = v12;
  v37 = v15;
  v16 = objc_msgSend(v9, "treeID");
  v17 = objc_msgSend(v9, "onEncryptedShare");
  objc_msgSend(v9, "pd");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v19 = smb2_rq_alloc(9, v16, v17, &v37, v18, &v36);
  v20 = v36;

  if ((_DWORD)v19)
    goto LABEL_4;
  if (v12 >= v37)
    v21 = v12 - v37;
  else
    v21 = 0;
  v22 = objc_msgSend(v10, "length");
  if (v22 >= v37)
  {
    v24 = objc_msgSend(v20, "smb_rq_getrequest");
    mb_put_uint16le(v24, 49);
    mb_put_uint16le(v24, 112);
    mb_put_uint32le(v24, v37);
    mb_put_uint64le(v24, *(_QWORD *)a2);
    if (a4)
    {
      v25 = -1;
      mb_put_uint64le(v24, -1);
    }
    else
    {
      mb_put_uint64le(v24, objc_msgSend(v9, "fid"));
      objc_msgSend(v9, "fid");
      v25 = v26;
    }
    mb_put_uint64le(v24, v25);
    mb_put_uint32le(v24, 0);
    mb_put_uint32le(v24, v21);
    mb_put_uint32le(v24, 0);
    mb_put_uint32le(v24, *(_DWORD *)(a2 + 20));
    if (objc_msgSend(v20, "onEncryptedShare"))
    {
      v27 = (char *)objc_msgSend(objc_retainAutorelease(v10), "bytes");
      v28 = mb_put_mem(v24, v27, v37, 0);
      if ((_DWORD)v28)
      {
        v19 = v28;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_write_one_cold_3();
LABEL_4:
        if (v20)
          objc_msgSend(v20, "smb_rq_done");
        if (v11)
          v11[2](v11, v19);
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v20, "setWriteData:", v10);
      objc_msgSend(v20, "setWriteLen:", v37);
    }
    if (a4)
    {
      smb2_rq_align8(v20);
      objc_msgSend(v20, "smb_rq_set_srflags:", 256);
      v19 = 0;
      *a4 = objc_retainAutorelease(v20);
      goto LABEL_17;
    }
    objc_msgSend(v9, "pd");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __smb2_smb_write_one_block_invoke;
    v32[3] = &unk_24FE01398;
    v30 = v11;
    v34 = v30;
    v35 = a2;
    v31 = v20;
    v33 = v31;
    v19 = smb_rq_simple_block(v29, v31, v32);

    if (!(_DWORD)v19)
    {
LABEL_35:

      goto LABEL_17;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      smb2_smb_write_one_cold_2();
      if (!v31)
      {
LABEL_33:
        if (v30)
          v30[2](v30, v19);
        goto LABEL_35;
      }
    }
    else if (!v31)
    {
      goto LABEL_33;
    }
    objc_msgSend(v31, "smb_rq_done");
    goto LABEL_33;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    if (!v20)
      goto LABEL_15;
    goto LABEL_14;
  }
  smb2_smb_write_one_cold_1(v10);
  if (v20)
LABEL_14:
    objc_msgSend(v20, "smb_rq_done");
LABEL_15:
  v19 = 22;
  if (v11)
    v11[2](v11, 22);
LABEL_17:

  return v19;
}

uint64_t smb2_smb_parse_read_one(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  __int16 v9;
  __int16 v10;

  v10 = 0;
  v9 = 0;
  v7 = 0;
  v8 = 0;
  result = md_get_uint16le(a1, &v10);
  if (!(_DWORD)result)
  {
    if (v10 == 17)
    {
      result = md_get_uint8(a1, (char *)&v9 + 1);
      if (!(_DWORD)result)
      {
        result = md_get_uint8(a1, (char *)&v9);
        if (!(_DWORD)result)
        {
          result = md_get_uint32le(a1, &v7);
          if (!(_DWORD)result)
          {
            result = md_get_uint32le(a1, &v8);
            if (!(_DWORD)result)
            {
              result = md_get_uint32le(a1, &v8);
              if (!(_DWORD)result)
              {
                if (!HIBYTE(v9) || (HIBYTE(v9) -= 80, result = md_get_mem(a1, 0, HIBYTE(v9), 0), !(_DWORD)result))
                {
                  if (v7)
                  {
                    v5 = *(_DWORD *)(a2 + 16);
                    if (v7 >= v5)
                      v6 = v5;
                    else
                      v6 = v7;
                    result = md_get_mem(a1, *(char **)(a2 + 8), v6, 0);
                    if ((_DWORD)result)
                    {
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        smb2_smb_parse_read_one_cold_1();
                      result = 12;
                    }
                    *(_DWORD *)(a2 + 28) = v6;
                  }
                  else
                  {
                    result = 0;
                    *(_DWORD *)(a2 + 28) = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_read_one_cold_2();
      return 72;
    }
  }
  return result;
}

uint64_t smb2_smb_parse_write_one(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  int v6;
  int v7;

  v6 = 0;
  v7 = 0;
  v5 = 0;
  result = md_get_uint16le(a1, (_WORD *)&v7 + 1);
  if (!(_DWORD)result)
  {
    if (HIWORD(v7) == 17)
    {
      result = md_get_uint16le(a1, &v7);
      if (!(_DWORD)result)
      {
        result = md_get_uint32le(a1, &v5);
        if (!(_DWORD)result)
        {
          *(_DWORD *)(a2 + 28) = v5;
          result = md_get_uint32le(a1, &v6);
          if (!(_DWORD)result)
            return md_get_uint32le(a1, &v6);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_write_one_cold_1();
      return 72;
    }
  }
  return result;
}

void __smb2_smb_read_one_block_invoke(uint64_t a1, uint64_t one)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 48));
  v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(_QWORD *)(a1 + 56) + 24) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)one)
  {
    if ((_DWORD)one != 96 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_read_one_block_invoke_cold_1((id *)(a1 + 32));
  }
  else
  {
    one = smb2_smb_parse_read_one((_QWORD *)objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply"), *(_QWORD *)(a1 + 56));
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, one);

}

void __smb2_smb_write_one_block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 40));
  v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(_QWORD *)(a1 + 48) + 24) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_write_one_block_invoke_cold_1((id *)(a1 + 32));
  }
  else
  {
    a2 = smb2_smb_parse_write_one((_QWORD *)objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply"), *(_QWORD *)(a1 + 48));
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, a2);

}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7(id *a1)
{
  return objc_msgSend(*a1, "sr_ntstatus");
}

void piston_query_dir(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v9 = a1;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v9, "pd");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
    {
      piston_query_dir_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v12)
        goto LABEL_8;
    }
    else if (!v12)
    {
      goto LABEL_8;
    }
    v12[2](v12, 57);
    goto LABEL_8;
  }
  if (smb2_smb_query_dir(v9, a2, v10, v11, 0, 0, v12)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    piston_query_dir_cold_2();
  }
LABEL_8:

}

unint64_t smb2_smb_query_dir(void *a1, uint64_t a2, void *a3, void *a4, _QWORD *a5, _QWORD *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t dir;
  id v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _WORD *v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void (**v43)(id, uint64_t);
  void *v45;
  NSObject *v46;
  id v47;
  _QWORD *v48;
  uint64_t v49;
  char *cstring_len;
  _QWORD v51[4];
  id v52;
  id v53;
  void (**v54)(id, uint64_t);
  uint64_t *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  char v63[32];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v58 = 0;
  if (!v15)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      smb2_smb_query_dir_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    if (v16)
    {
      dir = 22;
      v16[2](v16, 22);
      v21 = 0;
      goto LABEL_37;
    }
    v21 = 0;
    goto LABEL_14;
  }
  HIDWORD(v58) = objc_msgSend(v15, "length");
  cstring_len = (char *)smb_get_cstring_len(v14, &v58);
  v17 = objc_msgSend(v13, "treeID");
  v18 = objc_msgSend(v13, "onEncryptedShare");
  objc_msgSend(v13, "pd");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  dir = smb2_rq_alloc(14, v17, v18, (unsigned int *)&v58 + 1, v19, &v57);
  v21 = v57;

  if (!(_DWORD)dir)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v21);
    v30 = objc_msgSend(v21, "smb_rq_getrequest");
    mb_put_uint16le(v30, 33);
    mb_put_uint8(v30, *(_BYTE *)a2);
    mb_put_uint8(v30, *(_BYTE *)(a2 + 1));
    mb_put_uint32le(v30, *(_DWORD *)(a2 + 4));
    if (a6)
    {
      v31 = -1;
      mb_put_uint64le(v30, -1);
    }
    else
    {
      mb_put_uint64le(v30, objc_msgSend(v13, "fid"));
      objc_msgSend(v13, "fid");
      v31 = v32;
    }
    mb_put_uint64le(v30, v31);
    mb_put_uint16le(v30, 96);
    v33 = (_WORD *)mb_reserve(v30, 2uLL);
    mb_put_uint32le(v30, SHIDWORD(v58));
    if (!(_DWORD)v58)
    {
      *v33 = 0;
      mb_put_uint16le(v30, 0);
      goto LABEL_29;
    }
    smb2_rq_bstart(v21, (uint64_t)v33);
    if (cstring_len)
    {
      dir = smb2fs_fullpath(v30, cstring_len, v58, 0, 0, *(_DWORD *)(a2 + 8));
      if ((_DWORD)dir)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_query_dir_cold_5();
        if (v16)
          goto LABEL_4;
        goto LABEL_37;
      }
      smb_rq_bend(v21);
LABEL_29:
      if (a6)
      {
        smb2_rq_align8(v21);
        objc_msgSend(v21, "smb_rq_set_srflags:", 256);
        v21 = objc_retainAutorelease(v21);
        dir = 0;
        *a6 = v21;
      }
      else if (v16)
      {
        objc_msgSend(v13, "pd");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __smb2_smb_query_dir_block_invoke;
        v51[3] = &unk_24FE013C0;
        v43 = v16;
        v54 = v43;
        v56 = a2;
        v21 = v21;
        v52 = v21;
        v55 = &v59;
        v53 = v15;
        dir = smb_rq_simple_block(v42, v21, v51);

        if ((_DWORD)dir)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_query_dir_cold_3();
          v43[2](v43, dir);
        }

      }
      else
      {
        objc_msgSend(v13, "pd");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        dir = smb_rq_simple(v45, v21);

        *(_DWORD *)(a2 + 12) = objc_msgSend(v21, "sr_ntstatus");
        if ((_DWORD)dir)
        {
          if ((_DWORD)dir != 2)
          {
            v46 = MEMORY[0x24BDACB70];
            v47 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              smb2_smb_query_dir_cold_2((uint64_t)v63, dir, objc_msgSend(v21, "sr_ntstatus"));

          }
        }
        else
        {
          v48 = (_QWORD *)objc_msgSend(v21, "smb_rq_getreply");
          v60[3] = (uint64_t)v48;
          dir = smb2_smb_parse_query_dir(v48, v49, v15, 0);
        }
      }
      goto LABEL_37;
    }
    v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v34)
      smb2_smb_query_dir_cold_4(v34, v35, v36, v37, v38, v39, v40, v41);
    if (v16)
    {
      dir = 22;
      v16[2](v16, 22);
      goto LABEL_37;
    }
LABEL_14:
    dir = 22;
    goto LABEL_37;
  }
  if (v16)
LABEL_4:
    v16[2](v16, dir);
LABEL_37:
  _Block_object_dispose(&v59, 8);

  return dir;
}

void sub_230291F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t smb2_smb_parse_query_dir(_QWORD *a1, uint64_t a2, void *a3, unsigned int *a4)
{
  id v6;
  uint64_t uint16le;
  unint64_t mem;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t uint32le;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  unsigned int v50;
  int v51;

  v6 = a3;
  v50 = 0;
  v51 = 0;
  uint16le = md_get_uint16le(a1, (_WORD *)&v51 + 1);
  if ((_DWORD)uint16le)
  {
    mem = uint16le;
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      smb2_smb_parse_query_dir_cold_6(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else if (HIWORD(v51) == 9)
  {
    v17 = md_get_uint16le(a1, &v51);
    if ((_DWORD)v17)
    {
      mem = v17;
      v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v18)
        smb2_smb_parse_query_dir_cold_4(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      uint32le = md_get_uint32le(a1, &v50);
      if ((_DWORD)uint32le)
      {
        mem = uint32le;
        v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v28)
          smb2_smb_parse_query_dir_cold_3(v28, v29, v30, v31, v32, v33, v34, v35);
      }
      else
      {
        if (a4)
          *a4 = v50;
        if ((_WORD)v51 && (LOWORD(v51) = v51 - 72, v36 = md_get_mem(a1, 0, (unsigned __int16)v51, 0), (_DWORD)v36))
        {
          mem = v36;
          v37 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v37)
            smb2_smb_parse_query_dir_cold_2(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        else
        {
          mem = v50;
          if (v50)
          {
            if (objc_msgSend(v6, "length") >= mem)
              v45 = v50;
            else
              v45 = objc_msgSend(v6, "length");
            v48 = objc_retainAutorelease(v6);
            v49 = v45;
            mem = md_get_mem(a1, (char *)objc_msgSend(v48, "bytes"), v45, 0);
            if ((_DWORD)mem)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_query_dir_cold_1();
              mem = 12;
            }
            v46 = v48;
            v47 = v49;
          }
          else
          {
            v46 = v6;
            v47 = 0;
          }
          objc_msgSend(v46, "setLength:", v47);
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_query_dir_cold_5();
    mem = 72;
  }

  return mem;
}

void __smb2_smb_query_dir_block_invoke(uint64_t a1, unint64_t dir)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;
  uint64_t v6;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 48));
  v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(_QWORD *)(a1 + 64) + 12) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)dir)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_query_dir_block_invoke_cold_1((id *)(a1 + 32));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    dir = smb2_smb_parse_query_dir(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v6, *(void **)(a1 + 40), 0);
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, dir);

}

void sub_2302924F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_230292B8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_230293238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x18u);
}

void piston_change_notify(void *a1, _DWORD *a2, __int16 a3, int a4, void *a5, void *a6)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t);
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void (**v27)(id, uint64_t);
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD *v32;
  void *v34;
  id v35;
  id v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;
  void (**v45)(id, uint64_t);
  uint64_t *v46;
  _DWORD *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  v35 = a5;
  v11 = a6;
  objc_msgSend(v10, "pd");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v10;
    v15 = v35;
    v16 = (void (**)(id, uint64_t))v11;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v34 = v15;
    v17 = objc_msgSend(v15, "length");
    if (v17 >= 0xA0000)
      v18 = 655360;
    else
      v18 = v17;
    v37 = v18;
    v19 = objc_msgSend(v14, "treeID");
    v20 = objc_msgSend(v14, "onEncryptedShare");
    objc_msgSend(v14, "pd");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v22 = smb2_rq_alloc(15, v19, v20, (unsigned int *)&v37, v21, &v36);
    v23 = v36;

    if ((_DWORD)v22)
    {
      if (v23)
        objc_msgSend(v23, "smb_rq_done");
      if (v16)
        v16[2](v16, v22);
    }
    else
    {
      v24 = objc_msgSend(v23, "smb_rq_getrequest");
      mb_put_uint16le(v24, 32);
      mb_put_uint16le(v24, a3);
      mb_put_uint32le(v24, v37);
      mb_put_uint64le(v24, objc_msgSend(v14, "fid"));
      objc_msgSend(v14, "fid");
      mb_put_uint64le(v24, v25);
      mb_put_uint32le(v24, a4);
      mb_put_uint32le(v24, 0);
      objc_msgSend(v23, "smb_rq_set_srflags:", 2);
      if (v16)
      {
        objc_msgSend(v14, "pd");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __smb2_smb_change_notify_block_invoke;
        v42[3] = &unk_24FE013C0;
        v27 = v16;
        v45 = v27;
        v47 = a2;
        v28 = v23;
        v43 = v28;
        v46 = &v38;
        v44 = v34;
        v22 = smb_rq_simple_block(v26, v28, v42);

        if ((_DWORD)v22)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            piston_change_notify_cold_4();
          if (v28)
            objc_msgSend(v28, "smb_rq_done");
          v27[2](v27, v22);
        }

      }
      else
      {
        objc_msgSend(v14, "pd");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = smb_rq_simple(v29, v23);

        *a2 = objc_msgSend(v23, "sr_ntstatus");
        if ((_DWORD)v22)
        {
          v30 = MEMORY[0x24BDACB70];
          v31 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            piston_change_notify_cold_3((uint64_t)v42, v22, objc_msgSend(v23, "sr_ntstatus"));

        }
        else
        {
          v32 = (_QWORD *)objc_msgSend(v23, "smb_rq_getreply");
          v39[3] = (uint64_t)v32;
          LODWORD(v22) = smb2_smb_parse_change_notify(v32, v34);
        }
        objc_msgSend(v23, "smb_rq_done");
      }
    }
    _Block_object_dispose(&v38, 8);

    if ((_DWORD)v22 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      piston_change_notify_cold_2();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      piston_change_notify_cold_1();
    if (v11)
      (*((void (**)(id, uint64_t))v11 + 2))(v11, 57);
  }

}

void sub_2302941C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t smb2_smb_parse_change_notify(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t uint16le;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unsigned int v18;
  int v19;

  v3 = a2;
  v18 = 0;
  v19 = 0;
  uint16le = md_get_uint16le(a1, (_WORD *)&v19 + 1);
  if (!(_DWORD)uint16le)
  {
    if (HIWORD(v19) == 9)
    {
      uint16le = md_get_uint16le(a1, &v19);
      if (!(_DWORD)uint16le)
      {
        uint16le = md_get_uint32le(a1, &v18);
        if (!(_DWORD)uint16le)
        {
          if (!(_WORD)v19
            || (LOWORD(v19) = v19 - 72, uint16le = md_get_mem(a1, 0, (unsigned __int16)v19, 0), !(_DWORD)uint16le))
          {
            uint16le = v18;
            if (v18)
            {
              if (objc_msgSend(v3, "length") >= uint16le)
                v5 = v18;
              else
                v5 = objc_msgSend(v3, "length");
              v16 = objc_retainAutorelease(v3);
              v17 = v5;
              if (md_get_mem(a1, (char *)objc_msgSend(v16, "bytes"), v5, 0))
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  smb2_smb_parse_change_notify_cold_1();
                uint16le = 12;
              }
              else
              {
                uint16le = 0;
              }
              v14 = v16;
              v15 = v17;
            }
            else
            {
              v14 = v3;
              v15 = 0;
            }
            objc_msgSend(v14, "setLength:", v15);
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_change_notify_cold_2((uint64_t)&v19 + 2, v6, v7, v8, v9, v10, v11, v12);
      uint16le = 72;
    }
  }

  return uint16le;
}

void __smb2_smb_change_notify_block_invoke(uint64_t a1, unint64_t a2)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 48));
  v5 = (id *)(a1 + 32);
  **(_DWORD **)(a1 + 64) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_change_notify_block_invoke_cold_1((id *)(a1 + 32), a2);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    a2 = smb2_smb_parse_change_notify(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(void **)(a1 + 40));
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, a2);

}

void piston_query_info(void *a1, unsigned __int8 *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  if (smb2_smb_query_info(a1, a2, a3, a4, a5, a6, 0, a7))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      piston_query_info_cold_1();
  }
}

uint64_t smb2_smb_query_info(void *a1, unsigned __int8 *a2, void *a3, void *a4, void *a5, void *a6, _QWORD *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, uint64_t);
  void *v19;
  void *v20;
  unsigned int v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t info;
  int v32;
  unsigned int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void (**v43)(id, uint64_t);
  void *v44;
  NSObject *v45;
  id v46;
  _QWORD *v47;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void (**v57)(id, uint64_t);
  uint64_t *v58;
  unsigned __int8 *v59;
  id v60;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  char v66[32];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v15 = a1;
  v49 = a3;
  v50 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v61 = 0;
  objc_msgSend(v15, "pd");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = v20 == 0;

  if ((_DWORD)a6)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      smb2_smb_query_info_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    if (v18)
      v18[2](v18, 57);
    v30 = 0;
    info = 100;
  }
  else
  {
    if (v17)
      v61 = objc_msgSend(v17, "length", v49, v50);
    if (v16)
      v21 = objc_msgSend(v16, "length");
    else
      v21 = 0;
    v32 = *a2;
    if (v32 == 3)
    {
      if (a2[1])
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_query_info_cold_7();
        goto LABEL_39;
      }
    }
    else
    {
      if (v32 == 2)
      {
        v34 = a2[1];
        if (v34 != 5 && v34 != 3)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_query_info_cold_6();
          goto LABEL_39;
        }
      }
      else
      {
        if (v32 != 1)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_query_info_cold_2();
          goto LABEL_39;
        }
        v33 = a2[1];
        if (v33 > 0x3B || ((1 << v33) & 0x801000010444040) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_query_info_cold_3();
LABEL_39:
          if (v18)
          {
            info = 22;
            v18[2](v18, 22);
            v30 = 0;
          }
          else
          {
            v30 = 0;
            info = 22;
          }
          goto LABEL_61;
        }
      }
      v61 = 0x10000;
    }
    v35 = objc_msgSend(v15, "treeID", v49);
    v36 = objc_msgSend(v15, "onEncryptedShare");
    objc_msgSend(v15, "pd");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    info = smb2_rq_alloc(16, v35, v36, (unsigned int *)&v61, v37, &v60);
    v30 = v60;

    if ((_DWORD)info)
    {
      if (v30)
        objc_msgSend(v30, "smb_rq_done");
      if (v18)
        v18[2](v18, info);
    }
    else
    {
      v38 = objc_msgSend(v30, "smb_rq_getrequest");
      mb_put_uint16le(v38, 41);
      mb_put_uint8(v38, *a2);
      mb_put_uint8(v38, a2[1]);
      mb_put_uint32le(v38, v61);
      if (v21)
        v39 = 104;
      else
        v39 = 0;
      mb_put_uint16le(v38, v39);
      mb_put_uint16le(v38, 0);
      mb_put_uint32le(v38, v21);
      mb_put_uint32le(v38, *((_DWORD *)a2 + 1));
      mb_put_uint32le(v38, *((_DWORD *)a2 + 2));
      if (a7)
      {
        v40 = -1;
        mb_put_uint64le(v38, -1);
      }
      else
      {
        mb_put_uint64le(v38, objc_msgSend(v15, "fid"));
        objc_msgSend(v15, "fid");
        v40 = v41;
      }
      mb_put_uint64le(v38, v40);
      if (v21)
        mb_put_mem(v38, (char *)objc_msgSend(objc_retainAutorelease(v16), "bytes"), v21, 0);
      if (a7)
      {
        smb2_rq_align8(v30);
        objc_msgSend(v30, "smb_rq_set_srflags:", 256);
        v30 = objc_retainAutorelease(v30);
        info = 0;
        *a7 = v30;
      }
      else if (v18)
      {
        objc_msgSend(v15, "pd");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __smb2_smb_query_info_block_invoke;
        v51[3] = &unk_24FE01488;
        v43 = v18;
        v57 = v43;
        v59 = a2;
        v30 = v30;
        v52 = v30;
        v58 = &v62;
        v53 = v15;
        v54 = v49;
        v55 = v50;
        v56 = v17;
        info = smb_rq_simple_block(v42, v30, v51);

        if ((_DWORD)info)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_query_info_cold_5();
          if (v30)
            objc_msgSend(v30, "smb_rq_done");
          v43[2](v43, info);
        }

      }
      else
      {
        objc_msgSend(v15, "pd");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        info = smb_rq_simple(v44, v30);

        *((_DWORD *)a2 + 3) = objc_msgSend(v30, "sr_ntstatus");
        if ((_DWORD)info)
        {
          v45 = MEMORY[0x24BDACB70];
          v46 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            smb2_smb_query_info_cold_4((uint64_t)v66, info, objc_msgSend(v30, "sr_ntstatus"));

        }
        else
        {
          v47 = (_QWORD *)objc_msgSend(v30, "smb_rq_getreply");
          v63[3] = (uint64_t)v47;
          info = smb2_smb_parse_query_info(v15, v47, a2, v49, v50, v17);
        }
        objc_msgSend(v30, "smb_rq_done");
      }
    }
  }
LABEL_61:
  _Block_object_dispose(&v62, 8);

  return info;
}

void sub_230294A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void piston_query_share_info(void *a1, int a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  void (**v30)(id, uint64_t);
  uint64_t v31;
  int v32;

  v11 = a1;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "sock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
    {
      piston_query_share_info_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
      if (!v14)
        goto LABEL_6;
    }
    else if (!v14)
    {
      goto LABEL_6;
    }
    v14[2](v14, 57);
    goto LABEL_6;
  }
  objc_msgSend(v11, "sock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "signing_queue");
  v17 = objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __piston_query_share_info_block_invoke;
  v26[3] = &unk_24FE01460;
  v27 = v11;
  v32 = a2;
  v28 = v12;
  v31 = a3;
  v29 = v13;
  v30 = v14;
  dispatch_async(v17, v26);

LABEL_6:
}

void __piston_query_share_info_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t fid;
  uint64_t info;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38[1136];
  unsigned __int8 v39[1136];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  bzero(v39, 0x470uLL);
  bzero(v38, 0x470uLL);
  objc_msgSend(*(id *)(a1 + 32), "getShare:", *(unsigned int *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[SMBNode init:]([SMBNode alloc], "init:", *(_QWORD *)(a1 + 32));
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, "commonInit:onShareID:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72));
      if ((_DWORD)v5)
      {
        v6 = v5;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __piston_query_share_info_block_invoke_cold_7();
LABEL_6:
        v7 = 0;
        goto LABEL_13;
      }
      v17 = *(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 560);
      v18 = objc_msgSend(v2, "fstype");
      v20 = (*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 560) & 0x800) == 0 && v18 == 0;
      if ((v17 & 0xC0) != 0)
        v21 = 1;
      else
        v21 = 17;
      fid = smb2_smb_create_fid(v4, 0, 0, 1048705, 2, 7, 1, v21, 0, 0, 0);
      if ((_DWORD)fid)
      {
        v6 = fid;
        if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __piston_query_share_info_block_invoke_cold_6();
        goto LABEL_6;
      }
      *(_WORD *)v38 = 770;
      info = smb2_smb_query_info(v4, v38, 0, 0, 0, 0, 0, 0);
      if ((_DWORD)info)
      {
        v6 = info;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __piston_query_share_info_block_invoke_cold_5();
LABEL_32:
        v7 = 0;
LABEL_45:
        if (smb2_smb_close_fid(v4, 0, 0)
          && piston_log_level
          && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          __piston_query_share_info_block_invoke_cold_3();
        }
        goto LABEL_13;
      }
      if (!v18)
      {
        *(_WORD *)v39 = 1282;
        v37 = smb2_smb_query_info(v4, v39, 0, 0, 0, 0, 0, 0);
        if ((_DWORD)v37)
        {
          v6 = v37;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __piston_query_share_info_block_invoke_cold_4();
          goto LABEL_32;
        }
        if (v20)
          smb2fs_smb_check_copyfile(v4);
      }
      if ((*(_BYTE *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 560) & 0x40) != 0)
      {
        if ((*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 584) & 1) != 0)
          v25 = 5;
        else
          v25 = 1;
        v26 = v25 & 0xFFFFFFFFFFFFFDFFLL | ((((unint64_t)*(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr")+ 584) >> 4) & 1) << 9);
        v27 = v26 & 0xFFFFFFFFFFFFFFF7 | (8
                                          * (((unint64_t)*(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr")+ 584) >> 1) & 1));
        v28 = v27 & 0xFFFFFFFFFFFFFFEFLL | (16
                                          * (((unint64_t)*(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr")+ 584) >> 2) & 1));
        v29 = v28 & 0xFFFFFFFFFFFFFFDFLL | (32
                                          * (((unint64_t)*(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr")+ 584) >> 3) & 1));
        v30 = v29 & 0xFFFFFFFFFFFFFFBFLL | ((*(_DWORD *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 592) & 1) << 6);
        v31 = v30 & 0xFFFFFFFFFFFFFF7FLL | ((((unint64_t)*(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr")+ 592) >> 1) & 1) << 7);
        v24 = v31 | (*(_DWORD *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 592) << 6) & 0x100;
        if (*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 600))
        {
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", *(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 600), 4);
          objc_msgSend(*(id *)(a1 + 40), "setString:", v7);
LABEL_42:
          v32 = (*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 560) >> 10) & 2 | v24;
          *(_DWORD *)(*(_QWORD *)(a1 + 64) + 16) = objc_msgSend(v2, "fstype");
          objc_msgSend(v2, "file_system_name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            v34 = *(void **)(a1 + 48);
            objc_msgSend(v2, "file_system_name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setString:", v35);

          }
          *(_DWORD *)(*(_QWORD *)(a1 + 64) + 20) = objc_msgSend(v2, "file_system_attrs");
          *(_DWORD *)(*(_QWORD *)(a1 + 64) + 24) = objc_msgSend(v2, "max_component_name_len");
          objc_msgSend(v2, "statfs_lock");
          *(_DWORD *)(*(_QWORD *)(a1 + 64) + 28) = objc_msgSend(v2, "fs_block_size");
          *(_QWORD *)(*(_QWORD *)(a1 + 64) + 32) = objc_msgSend(v2, "fs_iosize");
          *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40) = objc_msgSend(v2, "fs_blocks");
          *(_QWORD *)(*(_QWORD *)(a1 + 64) + 48) = objc_msgSend(v2, "fs_blocks_free");
          *(_QWORD *)(*(_QWORD *)(a1 + 64) + 56) = objc_msgSend(v2, "fs_blocks_avail");
          *(_QWORD *)(*(_QWORD *)(a1 + 64) + 64) = objc_msgSend(v2, "fs_files");
          *(_QWORD *)(*(_QWORD *)(a1 + 64) + 72) = objc_msgSend(v2, "fs_files_free");
          objc_msgSend(v2, "statfs_unlock");
          v6 = 0;
          v36 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)v36 = 0;
          *(_QWORD *)(v36 + 8) = v32;
          goto LABEL_45;
        }
      }
      else
      {
        v24 = 0;
      }
      v7 = 0;
      goto LABEL_42;
    }
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      __piston_query_share_info_block_invoke_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
    v4 = 0;
    v7 = 0;
    v6 = 12;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __piston_query_share_info_block_invoke_cold_1();
    v4 = 0;
    v7 = 0;
    v6 = 22;
  }
LABEL_13:
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, v6);

}

uint64_t smb2_smb_parse_query_info(void *a1, _QWORD *a2, unsigned __int8 *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t uint16le;
  int v18;
  uint64_t v19;
  unsigned int v21;
  uint64_t *v22;
  void *v23;
  uint64_t v24;
  int v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  UInt8 *v62;
  UInt8 *v63;
  _BOOL8 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BOOL8 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  size_t size;
  int v94;
  uint64_t v95;
  _QWORD v96[3];

  v96[2] = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "pd");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "getSessionPtr");

  v94 = 0;
  size = 0;
  v92 = 0;
  v89 = 0;
  v90 = 0;
  v95 = 0;
  v96[0] = 0;
  v96[1] = 0;
  v88 = 0;
  uint16le = md_get_uint16le(a2, (_WORD *)&v94 + 1);
  if ((_DWORD)uint16le)
    goto LABEL_13;
  if (HIWORD(v94) != 9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_query_info_cold_9();
    uint16le = 72;
    goto LABEL_13;
  }
  uint16le = md_get_uint16le(a2, &v94);
  if ((_DWORD)uint16le)
    goto LABEL_13;
  uint16le = md_get_uint32le(a2, (_DWORD *)&size + 1);
  if ((_DWORD)uint16le)
    goto LABEL_13;
  if ((_WORD)v94)
  {
    LOWORD(v94) = v94 - 72;
    uint16le = md_get_mem(a2, 0, (unsigned __int16)v94, 0);
    if ((_DWORD)uint16le)
      goto LABEL_13;
  }
  v18 = *a3;
  if (v18 == 1 && a3[1] == 22)
  {
    v19 = smb2_smb_parse_file_stream_info(v11, a2, (uint64_t)a3, v12, v14, SHIDWORD(size));
LABEL_39:
    uint16le = v19;
    goto LABEL_13;
  }
  if (!HIDWORD(size))
  {
LABEL_64:
    uint16le = 0;
    goto LABEL_13;
  }
  if (v18 == 3)
  {
    v19 = smb2_smb_parse_security(a2, v14, HIDWORD(size));
    goto LABEL_39;
  }
  if (v18 == 2)
  {
    v25 = a3[1];
    if (v25 == 3)
    {
      v19 = smb2_smb_parse_fs_size(v11, a2, (uint64_t)a3);
      goto LABEL_39;
    }
    if (v25 == 5)
    {
      v19 = smb2_smb_parse_fs_attr(v11, a2, (uint64_t)a3);
      goto LABEL_39;
    }
    goto LABEL_64;
  }
  if (v18 != 1)
    goto LABEL_64;
  uint16le = 0;
  v21 = a3[1];
  if (v21 <= 0x15)
  {
    switch(v21)
    {
      case 6u:
        uint16le = md_get_uint64le(a2, &v92);
        if (!(_DWORD)uint16le)
          *((_QWORD *)a3 + 141) = v92;
        break;
      case 0xEu:
        uint16le = md_get_uint64le(a2, &v88);
        if ((_DWORD)uint16le)
          goto LABEL_13;
        if (v14)
        {
          v22 = &v88;
          v23 = v14;
          v24 = 8;
          goto LABEL_53;
        }
        v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v35)
          smb2_smb_parse_query_info_cold_1(v35, v36, v37, v38, v39, v40, v41, v42);
        goto LABEL_70;
      case 0x12u:
        v19 = smb2_smb_parse_file_all_info(v16, a2, v13);
        goto LABEL_39;
    }
    goto LABEL_13;
  }
  if (a3[1] <= 0x2Fu)
  {
    if (v21 == 22)
    {
      v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v26)
        smb2_smb_parse_query_info_cold_8(v26, v27, v28, v29, v30, v31, v32, v33);
      goto LABEL_64;
    }
    if (v21 == 28)
    {
      uint16le = md_get_uint64le(a2, &v89);
      if (!(_DWORD)uint16le)
      {
        uint16le = md_get_uint16le(a2, &v90);
        if (!(_DWORD)uint16le)
        {
          uint16le = md_get_uint8(a2, (char *)&v90 + 2);
          if (!(_DWORD)uint16le)
          {
            uint16le = md_get_uint8(a2, (char *)&v90 + 3);
            if (!(_DWORD)uint16le)
            {
              uint16le = md_get_uint8(a2, (char *)&v90 + 4);
              if (!(_DWORD)uint16le)
              {
                uint16le = md_get_mem(a2, (char *)&v90 + 5, 3, 0);
                if (!(_DWORD)uint16le)
                {
                  if (v14)
                  {
                    v22 = &v89;
                    v23 = v14;
                    v24 = 16;
LABEL_53:
                    objc_msgSend(v23, "appendBytes:length:", v22, v24);
                    goto LABEL_64;
                  }
                  v80 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                  if (v80)
                    smb2_smb_parse_query_info_cold_1(v80, v81, v82, v83, v84, v85, v86, v87);
                  goto LABEL_70;
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_13;
  }
  if (v21 == 48)
  {
    uint16le = md_get_uint32le(a2, &size);
    if ((_DWORD)uint16le)
      goto LABEL_13;
    v34 = size;
    if (!(_DWORD)size)
    {
      if (piston_log_level)
      {
        v43 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v43)
          smb2_smb_parse_query_info_cold_3(v43, v44, v45, v46, v47, v48, v49, v50);
      }
      goto LABEL_64;
    }
    if (size >> 4 >= 0xFFF)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_query_info_cold_4();
      goto LABEL_70;
    }
    v91 = size;
    v51 = (char *)malloc_type_malloc(size, 0x36D362C8uLL);
    if (!v51)
    {
      uint16le = 12;
      goto LABEL_13;
    }
    v52 = v51;
    bzero(v51, v34);
    uint16le = md_get_mem(a2, v52, v34, 0);
    if (!(_DWORD)uint16le)
    {
      v62 = smbfs_ntwrkname_tolocal((const UInt8 *)v52, &v91, 1);
      if (v62)
      {
        v63 = v62;
        if (v14)
        {
          objc_msgSend(v14, "appendBytes:length:", v62, v91);
          uint16le = 0;
        }
        else
        {
          v72 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v72)
            smb2_smb_parse_query_info_cold_1(v72, v73, v74, v75, v76, v77, v78, v79);
          uint16le = 22;
        }
        free(v52);
        v53 = (char *)v63;
        goto LABEL_82;
      }
      v64 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v64)
        smb2_smb_parse_query_info_cold_5(v64, v65, v66, v67, v68, v69, v70, v71);
      uint16le = 22;
    }
    v53 = v52;
LABEL_82:
    free(v53);
    goto LABEL_13;
  }
  if (v21 == 59)
  {
    uint16le = md_get_uint64le(a2, &v95);
    if (!(_DWORD)uint16le)
    {
      uint16le = md_get_mem(a2, (char *)v96, 16, 0);
      if (!(_DWORD)uint16le)
      {
        if (v14)
        {
          v22 = &v95;
          v23 = v14;
          v24 = 24;
          goto LABEL_53;
        }
        v54 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v54)
          smb2_smb_parse_query_info_cold_1(v54, v55, v56, v57, v58, v59, v60, v61);
LABEL_70:
        uint16le = 22;
      }
    }
  }
LABEL_13:

  return uint16le;
}

uint64_t smb2_smb_parse_file_stream_info(void *a1, _QWORD *a2, uint64_t a3, void *a4, void *a5, int a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  _BOOL4 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;
  uint64_t v27;
  const char *v28;
  unsigned int uint32le;
  char *v30;
  char *v31;
  unsigned int mem;
  int v33;
  unsigned int v34;
  char *v35;
  char *v36;
  int v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  char v45;
  int v46;
  unsigned int v47;
  int v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v53;
  unint64_t v55;
  const char *v56;
  unint64_t v57;
  _BOOL4 v58;
  _BOOL4 v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _BOOL4 v65;
  int v66;
  int v67;
  int v68;
  void *v69;
  unint64_t v70;
  unint64_t alloc_size;
  unint64_t v72;
  uint64_t v73;

  v11 = a1;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v11, "pd");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "getSessionPtr");

  if (v12)
    v16 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "cStringUsingEncoding:", 4);
  else
    v16 = 0;
  v17 = v16 == 0;
  v18 = *(_QWORD *)(a3 + 1080);
  v19 = *(_QWORD *)(a3 + 1088);
  v20 = *(_QWORD *)(a3 + 1096);
  v21 = *(_DWORD *)(a3 + 1104);
  v22 = *(_QWORD *)(a3 + 1112);
  v23 = *(_QWORD *)(a3 + 1120);
  v69 = v13;
  v68 = v21;
  if (!a6)
  {
    v45 = 0;
    v46 = 0;
    v24 = 0;
    v47 = 93;
    v38 = 32;
    goto LABEL_93;
  }
  v65 = v16 == 0;
  v66 = 0;
  v62 = *(_QWORD *)(a3 + 1112);
  v63 = *(_QWORD *)(a3 + 1120);
  v60 = *(_QWORD *)(a3 + 1096);
  v61 = *(_QWORD *)(a3 + 1088);
  v64 = *(_QWORD *)(a3 + 1080);
  v67 = 0;
  v24 = 0;
  if (v13)
    v25 = 0;
  else
    v25 = v12 != 0;
  if (v16)
    v26 = v13 == 0;
  else
    v26 = 0;
  v58 = v26;
  v59 = v25;
  v27 = 23;
  if ((v21 & 0x10) != 0)
    v27 = 13;
  v57 = v27;
  v28 = "com.apple.ResourceFork";
  if ((v21 & 0x10) != 0)
    v28 = "AFP_Resource";
  v56 = v28;
  while (1)
  {
    v72 = 0;
    v73 = 0;
    v70 = 0;
    alloc_size = 0;
    uint32le = md_get_uint32le(a2, (_DWORD *)&v73 + 1);
    if (uint32le
      || (uint32le = md_get_uint32le(a2, &v73)) != 0
      || (uint32le = md_get_uint64le(a2, &v72)) != 0
      || (uint32le = md_get_uint64le(a2, &alloc_size)) != 0)
    {
      v47 = uint32le;
LABEL_86:
      v38 = 0;
      goto LABEL_92;
    }
    if ((*(_BYTE *)(v15 + 560) & 0x40) != 0 && (*(_BYTE *)(v15 + 584) & 1) != 0)
      alloc_size = smb2_smb_get_alloc_size(v11, v72);
    if (v73 > *(_DWORD *)(v15 + 80))
    {
      v38 = 0;
      goto LABEL_91;
    }
    v30 = (char *)malloc_type_malloc(v73, 0x5EFBB865uLL);
    if (!v30)
    {
      v38 = 0;
      v47 = 12;
      goto LABEL_92;
    }
    v31 = v30;
    bzero(v30, v73);
    mem = md_get_mem(a2, v31, v73, 0);
    if (mem)
    {
      v47 = mem;
      free(v31);
      goto LABEL_86;
    }
    v33 = v73;
    if (v73 < 2 || v31[(v73 - 1)])
    {
      v34 = v73;
    }
    else
    {
      v34 = v73;
      if (!v31[(v73 - 2)])
      {
        LODWORD(v73) = v73 - 2;
        v34 = v33 - 2;
      }
    }
    v70 = v34;
    v35 = (char *)smbfs_ntwrkname_tolocal((const UInt8 *)v31, &v70, 1);
    free(v31);
    if (v35)
    {
      if (v70 < 7 || *v35 != 58)
        goto LABEL_42;
      v36 = &v35[v70 - 6];
      if (*(_DWORD *)v36 != 1094984762 || *(_WORD *)&v35[v70 - 2] != 16724)
        goto LABEL_42;
      if (v70 == 7)
      {
        v67 = 1;
LABEL_42:
        free(v35);
        goto LABEL_43;
      }
      if (v70 - 6 > 0x80)
        goto LABEL_42;
      v70 -= 6;
      *v36 = 0;
      v40 = v35 + 1;
      v55 = v70;
      if (v70 < 0x11)
      {
        if (v70 < 0xD)
        {
          if (v70 != 12)
            goto LABEL_70;
          goto LABEL_56;
        }
      }
      else if (!strncmp(v35 + 1, "com.apple.system.", 0x11uLL))
      {
        goto LABEL_42;
      }
      if (!strncasecmp(v35 + 1, "AFP_Resource", 0xDuLL))
      {
        v66 |= 1u;
        v63 = alloc_size;
        if (v59)
        {
          v62 = v72;
          v70 = 13;
          v40 = "AFP_Resource";
          v41 = 13;
        }
        else
        {
          v70 = v57;
          if (v69 && !v72)
          {
            v62 = 0;
            goto LABEL_42;
          }
          v62 = v72;
          v40 = v56;
          v41 = v57;
        }
        v55 = v41;
        goto LABEL_68;
      }
LABEL_56:
      if (!strncasecmp(v35 + 1, "AFP_AfpInfo", 0xCuLL))
      {
        if (v58 || (v68 & 0x10) != 0)
        {
          v70 = 12;
          v55 = 12;
          v40 = "AFP_AfpInfo";
        }
        else
        {
          v70 = 21;
          v55 = 21;
          v40 = "com.apple.FinderInfo";
        }
        v66 |= 2u;
        if (!v72)
          goto LABEL_42;
      }
LABEL_68:
      if (!strncasecmp(v40, "AFP_DeskTop", 0xCuLL) || !strncasecmp(v40, "AFP_IdIndex", 0xCuLL))
      {
        if (v16)
        {
          v42 = strncasecmp("AFP_DeskTop", v16, 0xCuLL);
          v43 = v65;
          if (!v42)
            v43 = 1;
          v65 = v43;
        }
        goto LABEL_42;
      }
LABEL_70:
      if (v69)
      {
        objc_msgSend(v69, "appendBytes:length:", v40, v55);
      }
      else if (!v65 && v16)
      {
        v44 = strnlen(v16, 0x100uLL);
        if (v55 >= v44 && !strncasecmp(v40, v16, v44))
        {
          v65 = 1;
          v60 = alloc_size;
          v61 = v72;
        }
        else
        {
          v65 = 0;
        }
        goto LABEL_42;
      }
      if (!v16)
        v64 += v70;
      goto LABEL_42;
    }
LABEL_43:
    v38 = HIDWORD(v73);
    v39 = (HIDWORD(v73) - (v33 + 24));
    if (HIDWORD(v73) > v33 + 24)
      break;
LABEL_46:
    ++v24;
    if (!v38)
    {
      v47 = 0;
      goto LABEL_92;
    }
  }
  HIDWORD(v73) -= v33 + 24;
  if (v39 <= *(_DWORD *)(v15 + 80))
  {
    md_get_mem(a2, 0, v39, 0);
    v38 = HIDWORD(v73);
    goto LABEL_46;
  }
  v38 = 0;
  ++v24;
LABEL_91:
  v47 = 72;
LABEL_92:
  v23 = v63;
  v18 = v64;
  v20 = v60;
  v19 = v61;
  v22 = v62;
  v45 = v66;
  v46 = v67;
  v17 = v65;
LABEL_93:
  if (v46 == 1 && v24 == 1)
    v38 = 32;
  v49 = (v45 & 3 | v38) ^ 3;
  *(_QWORD *)(a3 + 1080) = v18;
  if ((v45 & 1) != 0)
    v50 = v22;
  else
    v50 = 0;
  if ((v45 & 1) != 0)
    v51 = v23;
  else
    v51 = 0;
  *(_QWORD *)(a3 + 1088) = v19;
  *(_QWORD *)(a3 + 1096) = v20;
  *(_DWORD *)(a3 + 1104) = v68;
  *(_DWORD *)(a3 + 1108) = v49;
  *(_QWORD *)(a3 + 1112) = v50;
  *(_QWORD *)(a3 + 1120) = v51;
  if (!v17 || v47 == 2)
    v53 = 93;
  else
    v53 = v47;

  return v53;
}

uint64_t smb2_smb_parse_file_all_info(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  uint64_t uint64le;
  int v7;
  uint64_t v8;
  void *v9;
  size_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  UInt8 *v20;
  char *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t mem;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  UInt8 *v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  size_t v48;
  int v49;
  size_t size;
  unint64_t v51;
  _OWORD v52[15];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  size = 0;
  v51 = 0;
  v49 = 0;
  v48 = 0;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  uint64le = md_get_uint64le(a2, &v51);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  if (v51)
    smb_time_NT2local(v51, &v58);
  uint64le = md_get_uint64le(a2, &v51);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  if (v51)
    smb_time_NT2local(v51, &v55);
  uint64le = md_get_uint64le(a2, &v51);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  if (v51)
    smb_time_NT2local(v51, &v57);
  uint64le = md_get_uint64le(a2, &v51);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  if (v51)
    smb_time_NT2local(v51, &v56);
  uint64le = md_get_uint32le(a2, (_DWORD *)&v53 + 2);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  if ((BYTE8(v53) & 0x10) != 0)
  {
    *(_QWORD *)&v53 = v53 | 1;
    v7 = 2;
  }
  else
  {
    v7 = 1;
  }
  DWORD2(v60) = v7;
  uint64le = md_get_uint32le(a2, 0);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  uint64le = md_get_uint64le(a2, (_QWORD *)&v54 + 1);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  uint64le = md_get_uint64le(a2, &v54);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  uint64le = md_get_uint32le(a2, 0);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  uint64le = md_get_uint8(a2, 0);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  v47 = a2;
  uint64le = md_get_uint8(a2, 0);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  uint64le = md_get_uint16(a2, 0);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  uint64le = md_get_uint64le(a2, &v59);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  smb2fs_smb_file_id_check(a1, v59, 0, 0);
  uint64le = md_get_uint32le(a2, &size);
  if ((_DWORD)uint64le)
    goto LABEL_35;
  if ((BYTE9(v53) & 4) != 0)
  {
    DWORD2(v63) = size;
    if ((_DWORD)size == -1610612724)
    {
      *(_QWORD *)&v53 = v53 | 1;
      DWORD2(v60) = 5;
    }
  }
  else
  {
    DWORD2(v63) = 0;
  }
  uint64le = md_get_uint32le(a2, &v49);
  if ((_DWORD)uint64le
    || (uint64le = md_get_uint64le(a2, 0), (_DWORD)uint64le)
    || (uint64le = md_get_uint32le(a2, 0), (_DWORD)uint64le)
    || (uint64le = md_get_uint32le(a2, 0), (_DWORD)uint64le)
    || (uint64le = md_get_uint32le(a2, (_DWORD *)&size + 1), (_DWORD)uint64le))
  {
LABEL_35:
    v8 = uint64le;
    v9 = 0;
    goto LABEL_36;
  }
  v11 = HIDWORD(size);
  if (HIDWORD(size))
  {
    if (HIDWORD(size) >> 4 >= 0xFFF)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_file_all_info_cold_4();
      v9 = 0;
      v8 = 22;
      goto LABEL_36;
    }
    v48 = HIDWORD(size);
    v26 = (char *)malloc_type_malloc(HIDWORD(size), 0x90248D1AuLL);
    if (!v26)
    {
      v9 = 0;
      v8 = 12;
      goto LABEL_36;
    }
    v21 = v26;
    bzero(v26, v11);
    mem = md_get_mem(v47, v21, v11, 0);
    if ((_DWORD)mem)
    {
      v25 = mem;
      v9 = 0;
      v20 = 0;
LABEL_64:
      free(v21);
      goto LABEL_65;
    }
    if ((_DWORD)v11 == 2)
    {
      if (*v21 == 92 && !v21[1])
      {
LABEL_88:
        v20 = 0;
        goto LABEL_46;
      }
    }
    else if (v11 < 2)
    {
LABEL_76:
      v36 = v11 - 2;
      if (v11 <= 1)
        v36 = 0;
      v37 = &v21[v36];
      if (v36 >= 1)
      {
        do
        {
          if (*v37 == 92 && !v37[1])
            break;
          v37 -= 2;
        }
        while (v37 > v21);
      }
      if (*v37 == 92)
        v37 += 2 * (v37[1] == 0);
      v48 = &v21[v11] - v37;
      v38 = smbfs_ntwrkname_tolocal((const UInt8 *)v37, &v48, 1);
      if (v38)
      {
        v20 = v38;
        goto LABEL_46;
      }
      v39 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v39)
        smb2_smb_parse_file_all_info_cold_5(v39, v40, v41, v42, v43, v44, v45, v46);
      goto LABEL_88;
    }
    if (!v21[v11 - 1] && !v21[v11 - 2])
    {
      v48 = v11 - 2;
      v11 -= 2;
    }
    goto LABEL_76;
  }
  if (piston_log_level)
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      smb2_smb_parse_file_all_info_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  v20 = 0;
  v21 = 0;
LABEL_46:
  if (v5)
  {
    v52[12] = v65;
    v52[13] = v66;
    v52[14] = v67;
    v52[8] = v61;
    v52[9] = v62;
    v52[10] = v63;
    v52[11] = v64;
    v52[4] = v57;
    v52[5] = v58;
    v52[6] = v59;
    v52[7] = v60;
    v52[0] = v53;
    v52[1] = v54;
    v52[2] = v55;
    v52[3] = v56;
    objc_msgSend(v5, "setAttributes:", v52);
    if (v20)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v20, 4);
      v9 = v22;
      if (v22)
      {
        v23 = objc_msgSend(v22, "length");
        if (v23 >= 0x100)
        {
          v24 = v23;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_parse_file_all_info_cold_2((uint64_t)v20, v24);

          v9 = 0;
          v25 = 22;
          goto LABEL_62;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    v25 = 0;
LABEL_62:
    objc_msgSend(v5, "setName:", v9);
    goto LABEL_63;
  }
  v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v28)
    smb2_smb_parse_file_all_info_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
  v9 = 0;
  v25 = 12;
LABEL_63:
  if (v21)
    goto LABEL_64;
LABEL_65:
  if (v20)
    free(v20);
  v8 = v25;
LABEL_36:

  return v8;
}

uint64_t smb2_smb_parse_fs_attr(void *a1, _QWORD *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t uint32le;
  char *v9;
  char *v10;
  uint64_t mem;
  void *v12;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  UInt8 *v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  size_t v36;
  size_t __src[131];

  __src[130] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  bzero(__src, 0x410uLL);
  objc_msgSend(v5, "pd", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getShare:", objc_msgSend(v5, "shareID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    uint32le = md_get_uint32le(a2, __src);
    if (!(_DWORD)uint32le)
    {
      uint32le = md_get_uint32le(a2, (_DWORD *)__src + 1);
      if (!(_DWORD)uint32le)
      {
        if (HIDWORD(__src[0]) >= 0x1FF)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_parse_fs_attr_cold_5();
          HIDWORD(__src[0]) = 510;
        }
        uint32le = md_get_uint32le(a2, &__src[1]);
        if (!(_DWORD)uint32le)
        {
          objc_msgSend(v7, "setFstype:", 1);
          objc_msgSend(v7, "setFile_system_attrs:", 0);
          objc_msgSend(v7, "setMax_component_name_len:", 255);
          objc_msgSend(v7, "setFile_system_attrs:", LODWORD(__src[0]));
          objc_msgSend(v7, "setMax_component_name_len:", HIDWORD(__src[0]));
          if ((LODWORD(__src[1]) - 1) >= 0x3FF)
          {
            memcpy((void *)(a3 + 16), __src, 0x410uLL);
            uint32le = 0;
          }
          else
          {
            v9 = (char *)malloc_type_malloc(LODWORD(__src[1]), 0x2D332C02uLL);
            if (v9)
            {
              v10 = v9;
              bzero(v9, LODWORD(__src[1]));
              mem = md_get_mem(a2, v10, LODWORD(__src[1]), 0);
              if ((_DWORD)mem)
              {
                uint32le = mem;
                v12 = 0;
LABEL_49:
                free(v10);

                goto LABEL_16;
              }
              v36 = LODWORD(__src[1]);
              v22 = smbfs_ntwrkname_tolocal((const UInt8 *)v10, &v36, 1);
              if (v22)
              {
                strncpy((char *)&__src[2], (const char *)v22, 0x400uLL);
                v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v22, 4);
                objc_msgSend(v7, "setFile_system_name:", v12);
                uint32le = 0;
              }
              else
              {
                v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v23)
                  smb2_smb_parse_fs_attr_cold_4(v23, v24, v25, v26, v27, v28, v29, v30);
                v12 = 0;
                uint32le = 72;
              }
              objc_msgSend(v5, "pd");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = *(_QWORD *)(objc_msgSend(v31, "getSessionPtr") + 560);

              if ((v32 & 0x40) != 0)
              {
                v35 = 7;
LABEL_39:
                objc_msgSend(v7, "setFstype:", v35);
LABEL_44:
                if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  smb2_smb_parse_fs_attr_cold_3(v7, (uint64_t)v22);
                memcpy((void *)(a3 + 16), __src, 0x410uLL);
                if (v22)
                  free(v22);
                goto LABEL_49;
              }
              if (!v22)
                goto LABEL_44;
              v33 = v36 + 1;
              v36 = v33;
              if (!strncmp((const char *)v22, "FAT", v33)
                || !strncmp((const char *)v22, "FAT12", v33)
                || !strncmp((const char *)v22, "FAT16", v33)
                || !strncmp((const char *)v22, "FAT32", v33))
              {
                v34 = 1;
              }
              else if (!strncmp((const char *)v22, "CDFS", v33))
              {
                v34 = 2;
              }
              else if (!strncmp((const char *)v22, "UDF", v33))
              {
                v34 = 3;
              }
              else
              {
                if (strncmp((const char *)v22, "NTFS", v33)
                  && strncmp((const char *)v22, "ReFS", v33)
                  && strncmp((const char *)v22, "MAFS", v33))
                {
                  goto LABEL_42;
                }
                v34 = 4;
              }
              objc_msgSend(v7, "setFstype:", v34);
LABEL_42:
              if (objc_msgSend(v7, "fstype") != 4
                || (objc_msgSend(v7, "file_system_attrs") & 0x40000) == 0)
              {
                goto LABEL_44;
              }
              v35 = 5;
              goto LABEL_39;
            }
            v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v14)
              smb2_smb_parse_fs_attr_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
            uint32le = 12;
          }
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_fs_attr_cold_1(v5);
    uint32le = 22;
  }
LABEL_16:

  return uint32le;
}

uint64_t smb2_smb_parse_fs_size(void *a1, _QWORD *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t uint64le;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v17;
  uint64_t v18;

  v5 = a1;
  objc_msgSend(v5, "pd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0uLL;
  v18 = 0;
  objc_msgSend(v6, "getShare:", objc_msgSend(v5, "shareID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64le = md_get_uint64le(a2, &v17);
    if (!(_DWORD)uint64le)
    {
      uint64le = md_get_uint64le(a2, (_QWORD *)&v17 + 1);
      if (!(_DWORD)uint64le)
      {
        uint64le = md_get_uint32le(a2, &v18);
        if (!(_DWORD)uint64le)
        {
          uint64le = md_get_uint32le(a2, (_DWORD *)&v18 + 1);
          if (!(_DWORD)uint64le)
          {
            objc_msgSend(v7, "setTotal_alloc_units:", (_QWORD)v17);
            objc_msgSend(v7, "setAvail_alloc_units:", *((_QWORD *)&v17 + 1));
            objc_msgSend(v7, "setSectors_per_alloc_unit:", v18);
            objc_msgSend(v7, "setBytes_per_sector:", HIDWORD(v18));
            v9 = objc_msgSend(v7, "total_alloc_units");
            v10 = objc_msgSend(v7, "avail_alloc_units");
            v11 = objc_msgSend(v7, "bytes_per_sector");
            v12 = objc_msgSend(v7, "sectors_per_alloc_unit") * v11;
            objc_msgSend(v7, "statfs_lock");
            objc_msgSend(v7, "setFs_block_size:", v12);
            objc_msgSend(v7, "setFs_blocks:", v9);
            objc_msgSend(v7, "setFs_blocks_free:", v10);
            objc_msgSend(v7, "setFs_blocks_avail:", v10);
            objc_msgSend(v7, "setFs_files:", v9 - 2);
            objc_msgSend(v7, "setFs_files_free:", v10);
            v13 = *(_DWORD *)(objc_msgSend(v6, "getSessionPtr") + 84);
            if (*(_DWORD *)(objc_msgSend(v6, "getSessionPtr") + 88) > v13)
              v13 = *(_DWORD *)(objc_msgSend(v6, "getSessionPtr") + 88);
            v14 = 0x1000 / (4096 - (v13 & 0xFFF)) * (unint64_t)v13;
            if (v14 <= 0x100000)
              v14 = 0x100000;
            if (v14 >= 0x4000000)
              v15 = 0x4000000;
            else
              v15 = v14;
            objc_msgSend(v7, "setFs_iosize:", v15);
            objc_msgSend(v7, "statfs_unlock");
            uint64le = 0;
            *(_OWORD *)(a3 + 1056) = v17;
            *(_QWORD *)(a3 + 1072) = v18;
          }
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_fs_size_cold_1(v5);
    uint64le = 22;
  }

  return uint64le;
}

uint64_t smb2_smb_parse_security(_QWORD *a1, void *a2, unsigned int a3)
{
  id v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t mem;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  if (v5)
  {
    if (a3 < 0x14)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_security_cold_3();
      mem = 72;
    }
    else
    {
      v6 = a3;
      v7 = (char *)malloc_type_malloc(a3, 0x1285D28CuLL);
      if (v7)
      {
        v8 = v7;
        mem = md_get_mem(a1, v7, v6, 0);
        if ((_DWORD)mem)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_parse_security_cold_2();
        }
        else
        {
          objc_msgSend(v5, "appendBytes:length:", v8, v6);
        }
        free(v8);
      }
      else
      {
        mem = 12;
      }
    }
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      smb2_smb_parse_security_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    mem = 22;
  }

  return mem;
}

void __smb2_smb_query_info_block_invoke(uint64_t a1, uint64_t info)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 72));
  v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(_QWORD *)(a1 + 88) + 12) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)info)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_query_info_block_invoke_cold_1((id *)(a1 + 32), info);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    info = smb2_smb_parse_query_info(*(void **)(a1 + 40), *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(unsigned __int8 **)(a1 + 88), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, info);

}

uint64_t smb2fs_smb_listxattrs(void *a1, _QWORD *a2, size_t *a3)
{
  id v5;
  id v6;
  uint64_t info;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v30[1080];
  size_t size;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  bzero(v30, 0x470uLL);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  if (!v6)
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      smb2fs_smb_listxattrs_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_17;
  }
  *(_WORD *)v30 = 5633;
  v32 = 16;
  info = smb2_smb_query_info(v5, v30, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)info)
  {
    v8 = info;
    if ((_DWORD)info != 93)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2fs_smb_listxattrs_cold_2();
      goto LABEL_18;
    }
  }
  v9 = size;
  if (!size)
  {
    v8 = 0;
LABEL_18:
    *a2 = 0;
    *a3 = 0;
    goto LABEL_19;
  }
  v10 = malloc_type_malloc(size, 0xE1DC7F6CuLL);
  if (!v10)
  {
    v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v21)
      smb2fs_smb_listxattrs_cold_3(v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_17:
    v8 = 12;
    goto LABEL_18;
  }
  v11 = v10;
  bzero(v30, 0x470uLL);
  *(_WORD *)v30 = 5633;
  v32 = 16;
  v12 = smb2_smb_query_info(v5, v30, 0, 0, 0, v6, 0, 0);
  if ((_DWORD)v12)
  {
    v8 = v12;
    if ((_DWORD)v12 != 93)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2fs_smb_listxattrs_cold_2();
      free(v11);
      goto LABEL_18;
    }
  }
  if (objc_msgSend(v6, "length") <= v9)
  {
    objc_msgSend(v6, "getBytes:length:", v11, objc_msgSend(v6, "length"));
    v9 = objc_msgSend(v6, "length");
  }
  else
  {
    objc_msgSend(v6, "getBytes:length:", v11, v9);
  }
  v8 = 0;
  *a3 = v9;
  *a2 = v11;
LABEL_19:

  return v8;
}

void OUTLINED_FUNCTION_7_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t mbuf_free(_QWORD *a1)
{
  uint64_t v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(_QWORD, _QWORD, _QWORD);

  if (!a1)
    return 0;
  v2 = a1[5];
  if (!*(_DWORD *)a1)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      mbuf_free_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  if ((*((_BYTE *)a1 + 4) & 1) != 0)
  {
    v12 = (void (*)(_QWORD, _QWORD, _QWORD))a1[6];
    if (v12)
      v12(a1[7], a1[1], a1[4]);
  }
  else
  {
    v11 = (void *)a1[4];
    if (v11)
      free(v11);
  }
  free(a1);
  return v2;
}

uint64_t smb_mbuf_get(int a1, int a2, _QWORD *a3, size_t a4)
{
  uint64_t result;
  char *v8;
  _QWORD *v9;
  void *v10;

  result = 22;
  if (!a1 && a2 == 1)
  {
    v8 = (char *)malloc_type_malloc(0x50uLL, 0x10B0040FDA39B43uLL);
    if (v8)
    {
      v9 = v8;
      *((_OWORD *)v8 + 4) = 0u;
      *(_OWORD *)(v8 + 52) = 0u;
      *(_OWORD *)(v8 + 36) = 0u;
      *(_OWORD *)(v8 + 20) = 0u;
      *(_OWORD *)(v8 + 4) = 0u;
      *(_DWORD *)v8 = 1;
      if (!a4)
      {
LABEL_7:
        result = 0;
        *a3 = v9;
        return result;
      }
      v10 = malloc_type_malloc(a4, 0xC2A01180uLL);
      v9[4] = v10;
      if (v10)
      {
        v9[1] = a4;
        goto LABEL_7;
      }
      mbuf_free(v9);
    }
    return 12;
  }
  return result;
}

_QWORD *mbuf_freem(_QWORD *result)
{
  for (; result; result = (_QWORD *)mbuf_free(result))
    ;
  return result;
}

uint64_t mbuf_gethdr(int a1, int a2, _QWORD *a3)
{
  int v6;
  uint64_t result;

  v6 = getpagesize();
  result = smb_mbuf_get(a1, a2, a3, v6);
  if (!(_DWORD)result)
    *(_DWORD *)(*a3 + 4) |= 6u;
  return result;
}

uint64_t mbuf_get(int a1, int a2, _QWORD *a3)
{
  size_t v6;

  v6 = getpagesize();
  return smb_mbuf_get(a1, a2, a3, v6);
}

uint64_t mbuf_get_chain_len(uint64_t a1)
{
  uint64_t i;

  for (i = 0; a1; a1 = *(_QWORD *)(a1 + 40))
    i += *(_QWORD *)(a1 + 16);
  return i;
}

uint64_t mbuf_len(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

uint64_t mbuf_next(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

uint64_t mbuf_getcluster(int a1, int a2, size_t a3, _QWORD *a4)
{
  _QWORD *v8;
  uint64_t result;

  v8 = (_QWORD *)*a4;
  if (*a4)
  {
    do
      v8 = (_QWORD *)mbuf_free(v8);
    while (v8);
    *a4 = 0;
  }
  result = smb_mbuf_get(a1, a2, a4, a3);
  if (!(_DWORD)result)
  {
    if (*a4)
      *(_DWORD *)(*a4 + 4) |= 6u;
  }
  return result;
}

uint64_t mbuf_attachcluster(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  _OWORD *v14;
  void *v15;
  _OWORD *v16;

  result = 22;
  if (a4 && a6)
  {
    v14 = *(_OWORD **)a3;
    if (*(_QWORD *)a3)
    {
      v15 = (void *)*((_QWORD *)v14 + 4);
      if (v15)
      {
        free(v15);
        *(_QWORD *)(*(_QWORD *)a3 + 32) = 0;
        v14 = *(_OWORD **)a3;
      }
LABEL_10:
      result = 0;
      *((_DWORD *)v14 + 1) = 7;
      *((_QWORD *)v14 + 1) = a6;
      *((_QWORD *)v14 + 4) = a4;
      *(_QWORD *)(*(_QWORD *)a3 + 48) = a5;
      *(_QWORD *)(*(_QWORD *)a3 + 56) = a7;
      return result;
    }
    result = 22;
    if (!a1 && a2 == 1)
    {
      v16 = malloc_type_malloc(0x50uLL, 0x10B0040FDA39B43uLL);
      if (!v16)
        return 12;
      v14 = v16;
      v16[4] = 0u;
      *(_OWORD *)((char *)v16 + 52) = 0u;
      *(_OWORD *)((char *)v16 + 36) = 0u;
      *(_OWORD *)((char *)v16 + 20) = 0u;
      *(_OWORD *)((char *)v16 + 4) = 0u;
      *(_DWORD *)v16 = 1;
      *(_QWORD *)a3 = v16;
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t mbuf_maxlen(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

uint64_t mbuf_setlen(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t mbuf_pkthdr_len(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t mbuf_pkthdr_setlen(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t mbuf_pkthdr_adjustlen(uint64_t result, int a2)
{
  *(_QWORD *)(result + 24) += a2;
  return result;
}

uint64_t mbuf_setnext(uint64_t a1, _DWORD *a2)
{
  int v2;
  uint64_t v3;

  if (!a2 || !*a2)
    return 22;
  v2 = *(_DWORD *)(a1 + 4);
  if ((v2 & 4) != 0)
  {
    *(_DWORD *)(a1 + 4) = v2 & 0xFFFFFFFB;
    a2[1] |= 4u;
  }
  v3 = 0;
  *(_QWORD *)(a1 + 40) = a2;
  return v3;
}

uint64_t mbuf_is_write(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v4;

  if ((*(_BYTE *)(a1 + 4) & 8) == 0)
    return 0;
  v4 = *(_QWORD *)(a1 + 72);
  *a2 = *(_QWORD *)(a1 + 64);
  *a3 = v4;
  return 1;
}

uint64_t mbuf_set_write(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 4) |= 8u;
  *(_QWORD *)(a1 + 64) = a2;
  *(_QWORD *)(a1 + 72) = a3;
  return 0;
}

uint64_t mbuf_data(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

uint64_t mbuf_trailingspace(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) - *(_QWORD *)(a1 + 16);
}

uint64_t mbuf_copydata(_QWORD *a1, unint64_t a2, size_t a3, char *__dst)
{
  size_t v5;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  size_t v10;

  v5 = a3;
  if (a2)
  {
    while (a1)
    {
      v7 = a1[2];
      v8 = a2 >= v7;
      v9 = a2 - v7;
      if (!v8)
        goto LABEL_7;
      a1 = (_QWORD *)a1[5];
      a2 = v9;
      if (!v9)
      {
        a2 = 0;
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    if (!a3)
      return 0;
    while (a1)
    {
      if (a1[2] - a2 >= v5)
        v10 = v5;
      else
        v10 = a1[2] - a2;
      memmove(__dst, (const void *)(a1[4] + a2), v10);
      a2 = 0;
      __dst += v10;
      a1 = (_QWORD *)a1[5];
      v5 -= v10;
      if (!v5)
        return 0;
    }
  }
  return 22;
}

uint64_t mbuf_split(_QWORD *a1, unint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v6;
  uint64_t *v7;
  size_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  int v20;
  int v21;
  void *v22;

  if (!a1)
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      mbuf_split_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    return 22;
  }
  v7 = a1 + 1;
  v6 = a1[1];
  v8 = v6 - a2;
  if (v6 < a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      mbuf_split_cold_2(v7, a2, v9);
    return 22;
  }
  v20 = smb_mbuf_get(0, 1, a4, v8);
  if (v20)
  {
    v21 = v20;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      mbuf_split_cold_3(v21);
    return 12;
  }
  else
  {
    if (*a4)
      v22 = *(void **)(*a4 + 32);
    else
      v22 = 0;
    memmove(v22, (const void *)(a1[4] + a2), v8);
    if (*a4)
    {
      result = 0;
      *(_QWORD *)(*a4 + 16) = v8;
    }
    else
    {
      result = 12;
    }
    a1[2] = a2;
  }
  return result;
}

uint64_t m_fixhdr(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 0;
  if (a1)
  {
    v2 = a1;
    do
    {
      v1 += *(_QWORD *)(v2 + 16);
      v2 = *(_QWORD *)(v2 + 40);
    }
    while (v2);
  }
  *(_QWORD *)(a1 + 24) = v1;
  return v1;
}

uint64_t mbuf_concatenate(uint64_t result, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (result)
  {
    v2 = result;
    do
    {
      v3 = v2;
      v2 = *(_QWORD *)(v2 + 40);
    }
    while (v2);
    if (a2 && *a2)
    {
      v4 = *(_DWORD *)(v3 + 4);
      if ((v4 & 4) != 0)
      {
        *(_DWORD *)(v3 + 4) = v4 & 0xFFFFFFFB;
        a2[1] |= 4u;
      }
      *(_QWORD *)(v3 + 40) = a2;
    }
  }
  return result;
}

uint64_t mb_pullup(_QWORD *a1)
{
  _QWORD *v1;
  size_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v10;
  uint64_t v11;

  v11 = 0;
  v1 = (_QWORD *)*a1;
  if (!*a1 || !v1[5])
    return 0;
  v3 = 0;
  v4 = (_QWORD *)*a1;
  do
  {
    v3 += v4[2];
    v4 = (_QWORD *)v4[5];
  }
  while (v4);
  v1[3] = v3;
  v5 = mbuf_getcluster(0, 1, v3, &v11);
  if (!(_DWORD)v5)
  {
    v6 = (_QWORD *)*a1;
    v7 = (_QWORD *)v11;
    if (v11)
    {
      v8 = mbuf_copydata(v6, 0, v3, *(char **)(v11 + 32));
      if ((_DWORD)v8)
      {
        v5 = v8;
        do
          v7 = (_QWORD *)mbuf_free(v7);
        while (v7);
        return v5;
      }
    }
    else
    {
      v5 = mbuf_copydata(v6, 0, v3, 0);
      if ((_DWORD)v5)
        return v5;
    }
    v7[2] = v3;
    v7[3] = v3;
    v10 = (_QWORD *)*a1;
    if (*a1)
    {
      do
        v10 = (_QWORD *)mbuf_free(v10);
      while (v10);
    }
    v5 = 0;
    *a1 = v7;
    a1[1] = v7;
  }
  return v5;
}

uint64_t mb_fixhdr(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  v1 = *a1;
  if (*a1)
  {
    result = 0;
    v3 = v1;
    do
    {
      result += *(_QWORD *)(v3 + 16);
      v3 = *(_QWORD *)(v3 + 40);
    }
    while (v3);
  }
  else
  {
    result = 0;
  }
  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t mb_getbuffer(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= a2)
  {
    v5 = *(_QWORD *)(a1 + 8);
    if (v5)
    {
LABEL_13:
      v9 = *(_QWORD *)(v5 + 32);
      v5 = *(_QWORD *)(v5 + 16);
    }
    else
    {
      v9 = 0;
    }
    return v9 + v5;
  }
  else
  {
    while (1)
    {
      v11 = 0;
      if (mbuf_getcluster(0, 1, v3 + a2, &v11))
        return 0;
      v5 = v11;
      if (v11)
      {
        *(_QWORD *)(v11 + 16) = 0;
        if (*(_DWORD *)v5)
        {
          v6 = *(_QWORD *)(a1 + 8);
          v7 = *(_DWORD *)(v6 + 4);
          if ((v7 & 4) != 0)
          {
            *(_DWORD *)(v6 + 4) = v7 & 0xFFFFFFFB;
            *(_DWORD *)(v5 + 4) |= 4u;
          }
          v8 = 0;
          *(_QWORD *)(v6 + 40) = v5;
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v8 = MEMORY[0x10];
      }
      v3 = *(_QWORD *)(v5 + 8) - v8 + *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v3;
      if (v3 >= a2)
        goto LABEL_13;
    }
  }
}

uint64_t mb_consume(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *(_QWORD *)(result + 16) -= a2;
  *(int64x2_t *)(result + 24) = vaddq_s64(*(int64x2_t *)(result + 24), vdupq_n_s64(a2));
  if (v2)
    *(_QWORD *)(v2 + 16) += a2;
  return result;
}

double mb_initm(uint64_t a1, uint64_t a2)
{
  double result;

  result = 0.0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 8) - *(_QWORD *)(a2 + 16);
  return result;
}

double mb_init(uint64_t a1)
{
  double result;
  uint64_t v3;
  uint64_t v4;

  v4 = 0;
  if (!mbuf_gethdr(0, 1, &v4))
  {
    v3 = v4;
    result = 0.0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_QWORD *)a1 = v3;
    *(_QWORD *)(a1 + 8) = v3;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(v3 + 8) - *(_QWORD *)(v3 + 16);
  }
  return result;
}

_QWORD *mb_done(_QWORD **a1)
{
  _QWORD *result;

  result = *a1;
  if (result)
  {
    do
      result = (_QWORD *)mbuf_free(result);
    while (result);
    *a1 = 0;
  }
  return result;
}

uint64_t mb_detach(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  *a1 = 0;
  return v1;
}

uint64_t mb_reserve(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  if (v4 >= a2)
  {
    v9 = *(_QWORD *)(a1 + 8);
    goto LABEL_9;
  }
  v13 = 0;
  v6 = getpagesize();
  v7 = smb_mbuf_get(0, 1, &v13, v6);
  result = 0;
  if (v7)
    return result;
  v9 = v13;
  if (v13)
  {
    v4 = *(_QWORD *)(v13 + 8);
    if (v4 < a2)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      v12 = *(_QWORD *)(v9 + 8);
      goto LABEL_21;
    }
    if (*(_DWORD *)v13)
    {
      v11 = *(_DWORD *)(v5 + 4);
      if ((v11 & 4) != 0)
      {
        *(_DWORD *)(v5 + 4) = v11 & 0xFFFFFFFB;
        *(_DWORD *)(v9 + 4) |= 4u;
      }
      *(_QWORD *)(v5 + 40) = v9;
    }
    *(_QWORD *)(a1 + 8) = v9;
    *(_QWORD *)(v9 + 16) = 0;
LABEL_9:
    *(_QWORD *)(a1 + 16) = v4 - a2;
    *(int64x2_t *)(a1 + 24) = vaddq_s64(*(int64x2_t *)(a1 + 24), vdupq_n_s64(a2));
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 16);
      result = *(_QWORD *)(v9 + 32) + v10;
      *(_QWORD *)(v9 + 16) = v10 + a2;
      return result;
    }
    return 0;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    return 0;
  v12 = 0;
LABEL_21:
  if ((mb_reserve_cold_1((uint64_t)v14, a2, v12, v9 == 0) & 1) != 0)
    return 0;
  do
  {
LABEL_6:
    result = mbuf_free((_QWORD *)v9);
    v9 = result;
  }
  while (result);
  return result;
}

uint64_t mb_put_padbyte(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char __src;

  __src = 0;
  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 32);
    v1 = *(_QWORD *)(v1 + 16);
  }
  else
  {
    LODWORD(v2) = 0;
  }
  if ((((_DWORD)v2 + (_DWORD)v1) & 1) != 0)
    return mb_put_mem(a1, &__src, 1uLL, 0);
  else
    return 0;
}

uint64_t mb_put_mem(uint64_t a1, char *__src, size_t a3, int a4)
{
  _QWORD *v5;
  size_t v6;
  size_t v8;
  _QWORD *v10;
  int v11;
  _QWORD *v12;
  _QWORD *v13;
  _DWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  _BYTE *v20;
  size_t v21;
  char *v22;
  char v23;
  uint64_t result;
  _DWORD *v25;

  v5 = *(_QWORD **)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  if (!a3)
    goto LABEL_34;
  v8 = a3;
  while (2)
  {
    if (v6)
      goto LABEL_19;
    do
    {
      if (v5)
      {
        v10 = (_QWORD *)v5[5];
        if (v10)
          goto LABEL_17;
        v25 = 0;
        v11 = mbuf_getcluster(0, 1, v8, &v25);
        v12 = v5;
        if (v11)
          return 55;
        do
        {
          v13 = v12;
          v12 = (_QWORD *)v12[5];
        }
        while (v12);
        v14 = v25;
        if (v25 && *v25)
        {
          v15 = *((_DWORD *)v13 + 1);
          if ((v15 & 4) != 0)
          {
            *((_DWORD *)v13 + 1) = v15 & 0xFFFFFFFB;
            v14[1] |= 4u;
          }
          v13[5] = v14;
        }
      }
      else
      {
        v25 = 0;
        if (mbuf_getcluster(0, 1, v8, &v25))
          return 55;
        v5 = v25;
      }
      if (!v5)
        return 55;
      v10 = (_QWORD *)v5[5];
LABEL_17:
      v16 = v10[1];
      v17 = v10[2];
      v5 = v10;
      v6 = v16 - v17;
    }
    while (v16 == v17);
    v5 = v10;
LABEL_19:
    if (v6 >= v8)
      v18 = v8;
    else
      v18 = v6;
    if (v5)
    {
      v19 = v5[4];
      if (v19)
      {
        v20 = (_BYTE *)(v19 + v5[2]);
        if (a4)
        {
          if (a4 == 3)
          {
            bzero(v20, v18);
          }
          else if (a4 == 2 && v18)
          {
            v21 = v18;
            v22 = __src;
            do
            {
              v23 = *v22++;
              *v20++ = v23;
              --v21;
            }
            while (v21);
          }
        }
        else
        {
          memmove(v20, __src, v18);
        }
        __src += v18;
        v5[2] += v18;
        v6 -= v18;
        *(int64x2_t *)(a1 + 24) = vaddq_s64(*(int64x2_t *)(a1 + 24), vdupq_n_s64(v18));
        v8 -= v18;
        if (!v8)
        {
LABEL_34:
          result = 0;
          *(_QWORD *)(a1 + 8) = v5;
          *(_QWORD *)(a1 + 16) = v6;
          return result;
        }
        continue;
      }
    }
    return 55;
  }
}

uint64_t mb_put_uint8(uint64_t a1, char a2)
{
  char __src;

  __src = a2;
  return mb_put_mem(a1, &__src, 1uLL, 0);
}

uint64_t mb_put_uint16be(uint64_t a1, unsigned int a2)
{
  __int16 __src;

  __src = __rev16(a2);
  return mb_put_mem(a1, (char *)&__src, 2uLL, 0);
}

uint64_t mb_put_uint16le(uint64_t a1, __int16 a2)
{
  __int16 __src;

  __src = a2;
  return mb_put_mem(a1, (char *)&__src, 2uLL, 0);
}

uint64_t mb_put_uint32be(uint64_t a1, unsigned int a2)
{
  unsigned int __src;

  __src = bswap32(a2);
  return mb_put_mem(a1, (char *)&__src, 4uLL, 0);
}

uint64_t mb_put_uint32le(uint64_t a1, int a2)
{
  int __src;

  __src = a2;
  return mb_put_mem(a1, (char *)&__src, 4uLL, 0);
}

uint64_t mb_put_uint64be(uint64_t a1, unint64_t a2)
{
  unint64_t __src;

  __src = bswap64(a2);
  return mb_put_mem(a1, (char *)&__src, 8uLL, 0);
}

uint64_t mb_put_uint64le(uint64_t a1, uint64_t a2)
{
  uint64_t __src;

  __src = a2;
  return mb_put_mem(a1, (char *)&__src, 8uLL, 0);
}

uint64_t mb_put_mbuf(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int64x2_t v4;
  uint64_t v5;
  const double *v6;
  int64x2_t v7;
  uint64_t v8;

  if (a2)
  {
    if (*(_DWORD *)a2)
    {
      v2 = *(_QWORD *)(a1 + 8);
      v3 = *(_DWORD *)(v2 + 4);
      if ((v3 & 4) != 0)
      {
        *(_DWORD *)(v2 + 4) = v3 & 0xFFFFFFFB;
        *(_DWORD *)(a2 + 4) |= 4u;
      }
      *(_QWORD *)(v2 + 40) = a2;
    }
    v4 = *(int64x2_t *)(a1 + 24);
    do
    {
      v5 = a2;
      v6 = (const double *)(a2 + 16);
      v7 = (int64x2_t)vld1q_dup_f64(v6);
      v4 = vaddq_s64(v4, v7);
      a2 = *(_QWORD *)(a2 + 40);
    }
    while (a2);
    *(int64x2_t *)(a1 + 24) = v4;
  }
  else
  {
    v5 = 0;
  }
  v8 = *(_QWORD *)(v5 + 8) - *(_QWORD *)(v5 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v8;
  return 0;
}

uint64_t md_initm(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a2;
  if (a2)
    v2 = *(_QWORD *)(a2 + 32);
  else
    v2 = 0;
  *(_QWORD *)(result + 16) = v2;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

uint64_t md_init(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v4 = 0;
  if (mbuf_gethdr(0, 1, &v4))
    return 55;
  v3 = v4;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v3;
  if (v3)
    v3 = *(_QWORD *)(v3 + 32);
  result = 0;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = 0;
  return result;
}

_QWORD *md_done(_QWORD **a1)
{
  _QWORD *result;

  result = *a1;
  if (result)
  {
    do
      result = (_QWORD *)mbuf_free(result);
    while (result);
    *a1 = 0;
  }
  return result;
}

uint64_t md_get_mem(_QWORD *a1, char *__dst, uint64_t a3, int a4)
{
  _QWORD *v8;
  unint64_t v9;
  char *i;
  unint64_t v11;
  size_t v12;
  size_t v13;
  char v14;
  uint64_t result;
  uint64_t v16;

  if (!a3)
  {
LABEL_20:
    result = 0;
    a1[3] += a3;
    return result;
  }
  v8 = (_QWORD *)a1[1];
  v9 = a3;
  while (v8)
  {
    for (i = (char *)a1[2]; ; a1[2] = i)
    {
      v11 = v8[2] + v8[4] - (_QWORD)i;
      if (v11)
        break;
      v8 = (_QWORD *)v8[5];
      a1[1] = v8;
      if (!v8)
        goto LABEL_21;
      i = (char *)v8[4];
    }
    if (v11 >= v9)
      v12 = v9;
    else
      v12 = v8[2] + v8[4] - (_QWORD)i;
    a1[2] = &i[v12];
    if (!__dst)
      goto LABEL_19;
    if (a4)
    {
      if (a4 == 2)
      {
        v13 = v12;
        do
        {
          v14 = *i++;
          *__dst++ = v14;
          --v13;
        }
        while (v13);
        goto LABEL_19;
      }
    }
    else
    {
      memmove(__dst, i, v12);
    }
    __dst += v12;
LABEL_19:
    v9 -= v12;
    if (!v9)
      goto LABEL_20;
  }
LABEL_21:
  if (piston_log_level)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      md_get_mem_cold_1(a3, v9, v16);
  }
  return 72;
}

uint64_t md_get_uint8(_QWORD *a1, char *a2)
{
  return md_get_mem(a1, a2, 1, 2);
}

uint64_t md_get_uint16(_QWORD *a1, char *a2)
{
  return md_get_mem(a1, a2, 2, 2);
}

uint64_t md_get_uint16le(_QWORD *a1, _WORD *a2)
{
  uint64_t result;
  __int16 __dst;

  __dst = 0;
  result = md_get_mem(a1, (char *)&__dst, 2, 2);
  if (a2)
  {
    if (!(_DWORD)result)
      *a2 = __dst;
  }
  return result;
}

uint64_t md_get_uint16be(_QWORD *a1, _WORD *a2)
{
  uint64_t result;
  unsigned __int16 __dst;

  __dst = 0;
  result = md_get_mem(a1, (char *)&__dst, 2, 2);
  if (a2)
  {
    if (!(_DWORD)result)
      *a2 = bswap32(__dst) >> 16;
  }
  return result;
}

uint64_t md_get_uint32(_QWORD *a1, char *a2)
{
  return md_get_mem(a1, a2, 4, 2);
}

uint64_t md_get_uint32be(_QWORD *a1, _DWORD *a2)
{
  uint64_t result;
  unsigned int __dst;

  __dst = 0;
  result = md_get_mem(a1, (char *)&__dst, 4, 2);
  if (a2)
  {
    if (!(_DWORD)result)
      *a2 = bswap32(__dst);
  }
  return result;
}

uint64_t md_get_uint32le(_QWORD *a1, _DWORD *a2)
{
  uint64_t result;
  int __dst;

  __dst = 0;
  result = md_get_mem(a1, (char *)&__dst, 4, 2);
  if (a2)
  {
    if (!(_DWORD)result)
      *a2 = __dst;
  }
  return result;
}

uint64_t md_get_uint64(_QWORD *a1, char *a2)
{
  return md_get_mem(a1, a2, 8, 2);
}

uint64_t md_get_uint64be(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;
  unint64_t __dst;

  __dst = 0;
  result = md_get_mem(a1, (char *)&__dst, 8, 2);
  if (a2)
  {
    if (!(_DWORD)result)
      *a2 = bswap64(__dst);
  }
  return result;
}

uint64_t md_get_uint64le(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t __dst;

  __dst = 0;
  result = md_get_mem(a1, (char *)&__dst, 8, 2);
  if (a2)
  {
    if (!(_DWORD)result)
      *a2 = __dst;
  }
  return result;
}

uint64_t md_get_size(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD **)(a1 + 8);
  if (!v1)
    return 0;
  result = 0;
  v4 = *(_QWORD *)(a1 + 16);
  do
  {
    if (v4)
      v5 = v1[4] - v4 + v1[2];
    else
      v5 = v1[2];
    v4 = 0;
    result += v5;
    v1 = (_QWORD *)v1[5];
  }
  while (v1);
  return result;
}

uint64_t md_get_utf16_strlen(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  _BYTE *v7;

  v1 = *(_QWORD **)(a1 + 8);
  if (!v1)
    return 0;
  result = 0;
  v4 = *(_BYTE **)(a1 + 16);
  while (1)
  {
    v5 = v1[4] - (_QWORD)v4 + v1[2];
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 0)
      break;
    v7 = v4;
LABEL_9:
    v1 = (_QWORD *)v1[5];
    if (!v1)
      return result;
    v4 = (_BYTE *)v1[4];
    if ((v5 & 1) != 0)
    {
      if (!*v7 && !*v4)
        return result;
      ++v4;
    }
  }
  v6 = 0;
  while (*(_WORD *)&v4[v6])
  {
    v6 += 2;
    if (v6 >= (v5 & 0xFFFFFFFFFFFFFFFELL))
    {
      v7 = &v4[v6];
      result += v6;
      goto LABEL_9;
    }
  }
  result += v6;
  return result;
}

__n128 md_shadow_copy(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void piston_tree_connect(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  const char *v12;
  size_t v13;
  int v14;
  id *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  const char *v27;
  size_t v28;
  uint64_t v29;
  int v30;
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 22;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  objc_msgSend(v7, "sock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v16)
    {
      piston_tree_connect_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
      if (!v9)
        goto LABEL_11;
    }
    else if (!v9)
    {
      goto LABEL_11;
    }
    v9[2](v9, 57);
    goto LABEL_11;
  }
  objc_msgSend(v7, "sock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const char *)objc_msgSend(v11, "getIPv4IPv6DotName");

  if (*v12)
  {
    v38[3] = (uint64_t)v12;
    v13 = strnlen(v12, 0x10uLL);
    v42[3] = v13;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __piston_tree_connect_block_invoke_3;
    v31[3] = &unk_24FE014B0;
    v32[1] = v12;
    v32[0] = v9;
    v14 = smb2_smb_tree_connect(v7, v8, v12, v13, a3, v31);
    v15 = (id *)v32;
    *((_DWORD *)v46 + 6) = v14;
  }
  else
  {
    objc_msgSend(v7, "sock");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "serverName");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = objc_msgSend(v25, "cStringUsingEncoding:", 4);
    v38[3] = v26;

    v27 = (const char *)v38[3];
    v28 = strnlen(v27, 0x100uLL);
    v29 = MEMORY[0x24BDAC760];
    v42[3] = v28;
    v33[0] = v29;
    v33[1] = 3221225472;
    v33[2] = __piston_tree_connect_block_invoke;
    v33[3] = &unk_24FE014D8;
    v36[0] = v9;
    v36[1] = &v37;
    v34 = v7;
    v36[2] = &v41;
    v36[3] = &v45;
    v36[4] = v12;
    v35 = v8;
    v36[5] = a3;
    v30 = smb2_smb_tree_connect(v34, v35, v27, v28, a3, v33);
    v15 = (id *)v36;
    *((_DWORD *)v46 + 6) = v30;

  }
  if (*((_DWORD *)v46 + 6) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    piston_tree_connect_cold_2();
LABEL_11:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

}

void sub_23029835C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t smb2_smb_tree_connect(void *a1, void *a2, const char *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  void *v14;
  void *v15;
  uint64_t v16;
  const char *cstring_len;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  void (**v67)(id, uint64_t);
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  void (**v73)(id, uint64_t);
  uint64_t v74;
  id v75;
  unsigned int v76;

  v11 = a1;
  v12 = a2;
  v13 = a6;
  v76 = 0;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"\\:"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v26)
      smb2_smb_tree_connect_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v15);

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v35)
    {
      smb2_smb_tree_connect_cold_8(v35, v36, v37, v38, v39, v40, v41, v42);
      if (!v13)
        goto LABEL_29;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v12, "rangeOfCharacterFromSet:", v14) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v44 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v44)
    {
      smb2_smb_tree_connect_cold_7(v44, v45, v46, v47, v48, v49, v50, v51);
      if (v13)
        goto LABEL_19;
      goto LABEL_29;
    }
LABEL_18:
    if (v13)
    {
LABEL_19:
      v34 = 22;
      v13[2](v13, 22);
      goto LABEL_20;
    }
LABEL_29:
    v43 = 0;
    v34 = 22;
    goto LABEL_30;
  }
  cstring_len = smb_get_cstring_len(v12, &v76);
  if (!cstring_len)
  {
    v52 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v52)
      smb2_smb_tree_connect_cold_2(v52, v53, v54, v55, v56, v57, v58, v59);
LABEL_11:
    if (v13)
    {
      v34 = 12;
      v13[2](v13, 12);
LABEL_20:
      v43 = 0;
      goto LABEL_30;
    }
    v43 = 0;
    v34 = 12;
    goto LABEL_30;
  }
  if (v76 >= 0x51)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
    {
      smb2_smb_tree_connect_cold_3(v18, v19, v20, v21, v22, v23, v24, v25);
      if (!v13)
        goto LABEL_29;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v60 = cstring_len;
  v75 = 0;
  v34 = smb2_rq_alloc(3, 0, 0, 0, v11, &v75);
  v61 = v75;
  v43 = v61;
  if ((_DWORD)v34)
    goto LABEL_37;
  v62 = objc_msgSend(v61, "smb_rq_getrequest");
  mb_put_uint16le(v62, 9);
  mb_put_uint16le(v62, 0);
  mb_put_uint16le(v62, 72);
  smb_rq_bstart(v43);
  smb_put_dmem(v62, "\\\\", 2, 0, 1, 0);
  v68 = v62;
  v63 = smb_put_dmem(v62, a3, a4, 0, 1, 0);
  if ((_DWORD)v63)
  {
    v34 = v63;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      smb2_smb_tree_connect_cold_6();
      if (!v43)
        goto LABEL_39;
LABEL_38:
      objc_msgSend(v43, "smb_rq_done", v68);
      goto LABEL_39;
    }
LABEL_37:
    if (!v43)
      goto LABEL_39;
    goto LABEL_38;
  }
  v65 = smb_put_dmem(v62, "\\", 1, 0, 1, 0);
  if ((_DWORD)v65)
  {
    v34 = v65;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    smb2_smb_tree_connect_cold_5();
    if (v43)
      goto LABEL_38;
    goto LABEL_39;
  }
  v66 = smb_put_dmem(v62, v60, v76, 0, 1, 0);
  if ((_DWORD)v66)
  {
    v34 = v66;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    smb2_smb_tree_connect_cold_4();
    if (v43)
      goto LABEL_38;
LABEL_39:
    if (v13)
      v13[2](v13, v34);
    goto LABEL_30;
  }
  smb_rq_bend(v43);
  if ((*(_BYTE *)(objc_msgSend(v11, "getSessionPtr") + 554) & 2) != 0)
    objc_msgSend(v43, "smb_rq_set_srflags:", 1024);
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __smb2_smb_tree_connect_block_invoke;
  v69[3] = &unk_24FE01500;
  v67 = v13;
  v73 = v67;
  v74 = a5;
  v43 = v43;
  v70 = v43;
  v71 = v12;
  v72 = v11;
  v34 = smb_rq_simple_block(v72, v43, v69);
  if ((_DWORD)v34)
  {
    if (v43)
      objc_msgSend(v43, "smb_rq_done");
    if (v67)
      v67[2](v67, v34);
  }

LABEL_30:
  return v34;
}

void __piston_tree_connect_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  char *v13;
  void *v14;
  socklen_t v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  _BYTE *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  if ((_DWORD)a2 == 57 || !(_DWORD)a2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
    return;
  }
  if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __piston_tree_connect_block_invoke_cold_2(a1, a2);
  objc_msgSend(*(id *)(a1 + 32), "sock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getServerAddress");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "sock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned __int8 *)(objc_msgSend(v7, "getServerAddress") + 1);

    objc_msgSend(*(id *)(a1 + 32), "sock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "getServerAddress");
    v11 = v10;
    if (v8 == 2)
    {

      v12 = (const void *)(v11 + 4);
      v13 = *(char **)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 32), "sock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "getIPv4IPv6DotNameMaxLength");
      v16 = 2;
    }
    else
    {
      v17 = *(unsigned __int8 *)(v10 + 1);

      if (v17 != 30)
        goto LABEL_14;
      objc_msgSend(*(id *)(a1 + 32), "sock");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "getServerAddress");

      v12 = (const void *)(v19 + 4);
      v13 = *(char **)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 32), "sock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "getIPv4IPv6DotNameMaxLength");
      v16 = 30;
    }
    inet_ntop(v16, v12, v13, v15);

  }
LABEL_14:
  v20 = *(_BYTE **)(a1 + 80);
  if (*v20)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v20;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = strnlen(*(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 56)+ 8)+ 24), 0x10uLL);
    v21 = *(void **)(a1 + 48);
    v22 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v28[0] = MEMORY[0x24BDAC760];
    v28[2] = __piston_tree_connect_block_invoke_1;
    v28[3] = &unk_24FE014B0;
    v24 = *(_QWORD *)(a1 + 88);
    v30 = *(_QWORD *)(a1 + 80);
    v25 = *(void **)(a1 + 32);
    v26 = *(void **)(a1 + 40);
    v28[1] = 3221225472;
    v29 = v21;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = smb2_smb_tree_connect(v25, v26, v22, v23, v24, v28);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      __piston_tree_connect_block_invoke_cold_1();
    }

  }
  else
  {
    v27 = *(_QWORD *)(a1 + 48);
    if (v27)
      (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v27, a2);
  }
}

uint64_t __piston_tree_connect_block_invoke_1(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    **(_BYTE **)(a1 + 40) = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __piston_tree_connect_block_invoke_3(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    **(_BYTE **)(a1 + 40) = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void piston_tree_disconnect(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(id, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void *v30;
  id v31;
  id v32;
  void (**v33)(id, uint64_t);
  uint64_t v34;
  int v35;
  id v36;

  v7 = a1;
  v8 = a4;
  objc_msgSend(v7, "sock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v17)
    {
      piston_tree_disconnect_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
      if (!v8)
        goto LABEL_29;
    }
    else if (!v8)
    {
      goto LABEL_29;
    }
    v8[2](v8, 57);
    goto LABEL_29;
  }
  v10 = v7;
  v11 = v8;
  objc_msgSend(v10, "getShare:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_tree_disconnect_cold_3();
      if (v11)
        goto LABEL_15;
    }
    else if (v11)
    {
      goto LABEL_15;
    }
LABEL_18:
    v16 = 0;
    LODWORD(v14) = 22;
    goto LABEL_26;
  }
  if (objc_msgSend(v12, "tree_id") != -1 && objc_msgSend(v13, "tree_id"))
  {
    v36 = 0;
    v14 = smb2_rq_alloc(4, objc_msgSend(v13, "tree_id"), objc_msgSend(v13, "isEncrypted"), 0, v10, &v36);
    v15 = v36;
    v16 = v15;
    if ((_DWORD)v14)
    {
      if (v15)
        objc_msgSend(v15, "smb_rq_done");
      if (v11)
        v11[2](v11, v14);
      goto LABEL_26;
    }
    v25 = objc_msgSend(v15, "smb_rq_getrequest");
    mb_put_uint16le(v25, 4);
    mb_put_uint16le(v25, 0);
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __smb2_smb_tree_disconnect_block_invoke;
    v30 = &unk_24FE01528;
    v26 = v11;
    v33 = v26;
    v35 = a2;
    v31 = v10;
    v34 = a3;
    v16 = v16;
    v32 = v16;
    v14 = smb_rq_simple_block(v31, v16, &v27);
    if (!(_DWORD)v14)
      goto LABEL_25;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_tree_disconnect_cold_5();
      if (!v16)
      {
LABEL_23:
        if (v26)
          v26[2](v26, v14);
LABEL_25:

        goto LABEL_26;
      }
    }
    else if (!v16)
    {
      goto LABEL_23;
    }
    objc_msgSend(v16, "smb_rq_done", v27, v28, v29, v30, v31);
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    piston_tree_disconnect_cold_4(v13);
    if (v11)
      goto LABEL_15;
    goto LABEL_18;
  }
  if (!v11)
    goto LABEL_18;
LABEL_15:
  LODWORD(v14) = 22;
  v11[2](v11, 22);
  v16 = 0;
LABEL_26:

  if ((_DWORD)v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    piston_tree_disconnect_cold_2();
LABEL_29:

}

void __smb2_smb_tree_connect_block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;
  void *v6;
  SMBShare *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t uint16le;
  void *v11;
  unsigned int v12;
  unsigned __int8 v13;
  __int16 v14;

  v14 = 0;
  v13 = 0;
  v12 = 0;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 56));
  v5 = (id *)(a1 + 32);
  **(_DWORD **)(a1 + 64) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_tree_connect_block_invoke_cold_2((id *)(a1 + 32));
    v6 = 0;
    v7 = 0;
    goto LABEL_7;
  }
  v8 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
  v7 = objc_alloc_init(SMBShare);
  -[SMBShare setSharename:](v7, "setSharename:", *(_QWORD *)(a1 + 40));
  v9 = objc_msgSend(*(id *)(a1 + 32), "sr_rsptreeid");
  -[SMBShare setTree_id:](v7, "setTree_id:", v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint16le = md_get_uint16le(v8, &v14);
  if ((_DWORD)uint16le)
  {
LABEL_6:
    a2 = uint16le;
    goto LABEL_7;
  }
  if (v14 == 16)
  {
    uint16le = md_get_uint8(v8, (char *)&v13);
    if ((_DWORD)uint16le)
      goto LABEL_6;
    -[SMBShare setShare_type:](v7, "setShare_type:", v13);
    uint16le = md_get_uint8(v8, (char *)&v13);
    if ((_DWORD)uint16le)
      goto LABEL_6;
    uint16le = md_get_uint32le(v8, &v12);
    if ((_DWORD)uint16le)
      goto LABEL_6;
    -[SMBShare setShare_flags:](v7, "setShare_flags:", v12);
    if ((-[SMBShare share_flags](v7, "share_flags") & 0x8000) != 0
      || (*(_DWORD *)(objc_msgSend(*v5, "sr_sessionp") + 552) & 0x28800) != 0
      && (*(_WORD *)(objc_msgSend(*v5, "sr_sessionp") + 68) & 4) != 0)
    {
      -[SMBShare setIsEncrypted:](v7, "setIsEncrypted:", 1);
    }
    uint16le = md_get_uint32le(v8, &v12);
    if ((_DWORD)uint16le)
      goto LABEL_6;
    -[SMBShare setShare_capabilities:](v7, "setShare_capabilities:", v12);
    uint16le = md_get_uint32le(v8, &v12);
    if ((_DWORD)uint16le)
      goto LABEL_6;
    -[SMBShare setShare_max_access:](v7, "setShare_max_access:", v12);
    if (*(_QWORD *)(a1 + 64))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 64) + 4) = -[SMBShare share_type](v7, "share_type");
      *(_DWORD *)(*(_QWORD *)(a1 + 64) + 8) = -[SMBShare share_flags](v7, "share_flags");
      *(_DWORD *)(*(_QWORD *)(a1 + 64) + 12) = -[SMBShare share_capabilities](v7, "share_capabilities");
      *(_DWORD *)(*(_QWORD *)(a1 + 64) + 16) = -[SMBShare share_max_access](v7, "share_max_access");
      *(_DWORD *)(*(_QWORD *)(a1 + 64) + 20) = -[SMBShare tree_id](v7, "tree_id");
    }
    objc_msgSend(*(id *)(a1 + 48), "share_list_lock");
    objc_msgSend(*(id *)(a1 + 48), "shareList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, v6);

    objc_msgSend(*(id *)(a1 + 48), "share_list_unlock");
    a2 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_tree_connect_block_invoke_cold_1();
    a2 = 72;
  }
LABEL_7:
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, a2);

}

void __smb2_smb_tree_disconnect_block_invoke(uint64_t a1, uint64_t uint16le)
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int16 v9;

  v9 = 0;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "share_list_lock");
  objc_msgSend(*(id *)(a1 + 32), "shareList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

  objc_msgSend(*(id *)(a1 + 32), "share_list_unlock");
  v8 = *(void **)(a1 + 40);
  v7 = a1 + 40;
  **(_DWORD **)(v7 + 16) = objc_msgSend(v8, "sr_ntstatus");
  if ((_DWORD)uint16le)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_tree_disconnect_block_invoke_cold_2((id *)v7);
  }
  else
  {
    uint16le = md_get_uint16le((_QWORD *)objc_msgSend(*(id *)v7, "smb_rq_getreply"), &v9);
    if (!(_DWORD)uint16le && v9 != 4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __smb2_smb_tree_disconnect_block_invoke_cold_1();
      uint16le = 72;
    }
  }
  if (*(_QWORD *)v7)
    objc_msgSend(*(id *)v7, "smb_rq_done");
  if (v4)
    v4[2](v4, uint16le);

}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void piston_logoff(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  uint64_t uint16le;
  id v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int16 v29;

  v5 = a1;
  v6 = a3;
  v7 = objc_msgSend(v5, "getSessionPtr");
  v29 = 0;
  objc_msgSend(v5, "sock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v28 = 0;
    uint16le = smb2_rq_alloc(2, 0, 0, 0, v5, &v28);
    v10 = v28;
    v11 = v10;
    if (!(_DWORD)uint16le)
    {
      v12 = objc_msgSend(v10, "smb_rq_getrequest");
      mb_put_uint16le(v12, 4);
      mb_put_uint16le(v12, 0);
      uint16le = smb_rq_simple(v5, v11);
      if (a2)
        *(_DWORD *)(a2 + 16) = objc_msgSend(v11, "sr_ntstatus");
      if ((_DWORD)uint16le)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          piston_logoff_cold_3(v11);
      }
      else
      {
        *(_QWORD *)(v7 + 568) = 0;
        uint16le = md_get_uint16le((_QWORD *)objc_msgSend(v11, "smb_rq_getreply"), &v29);
        if (!(_DWORD)uint16le && v29 != 4)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            piston_logoff_cold_2((uint64_t)&v29, v21, v22, v23, v24, v25, v26, v27);
          uint16le = 0;
        }
      }
    }
    if (v11)
      objc_msgSend(v11, "smb_rq_done");
    if (v6)
      goto LABEL_20;
  }
  else
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      piston_logoff_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    v11 = 0;
    if (v6)
    {
      uint16le = 57;
LABEL_20:
      v6[2](v6, uint16le);
    }
  }

}

void piston_session_setup(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t);
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  void (**v32)(id, uint64_t);
  uint64_t v33;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(v11, "sock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
    {
      piston_session_setup_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
      if (!v15)
        goto LABEL_6;
    }
    else if (!v15)
    {
      goto LABEL_6;
    }
    v15[2](v15, 57);
    goto LABEL_6;
  }
  objc_msgSend(v11, "sock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "signing_queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __piston_session_setup_block_invoke;
  v27[3] = &unk_24FE01578;
  v28 = v11;
  v33 = a5;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v32 = v15;
  dispatch_async(v18, v27);

LABEL_6:
}

uint64_t __piston_session_setup_block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  id v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  char *v26;
  uint64_t uint16le;
  id v28;
  uint64_t v29;
  char client_security_mode;
  unint64_t v31;
  size_t v32;
  int v33;
  size_t v34;
  void *v35;
  _QWORD *v36;
  int v37;
  void *v38;
  size_t v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  __int16 v44;
  _BOOL8 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BOOL8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t result;
  uint64_t v68;
  int v69;
  int v70;
  void *v71;
  int *v72;
  void *v73;
  int v74;
  _BOOL8 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  unint64_t v87;
  int v88;
  _BOOL8 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _BOOL8 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _BOOL8 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  __int128 v113;
  uint64_t v114;
  id *v115;
  int **v116;
  id v117;
  _WORD size[5];
  const char *v119;
  __int16 v120;
  int v121;
  __int16 v122;
  int v123;
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "getSessionPtr");
  v116 = (int **)(a1 + 72);
  v114 = a1;
  if ((**(_BYTE **)(a1 + 72) & 1) != 0)
  {
    objc_msgSend(*v2, "setUserName:", CFSTR("GUEST"));
    objc_msgSend(*v2, "setPassword:", &stru_24FE01EB8);
    *(_QWORD *)(v3 + 552) |= 0x400000uLL;
    objc_msgSend(*v2, "setRealm:", 0);
    if ((piston_log_level & 4) != 0)
    {
      v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v7)
        __piston_session_setup_block_invoke_cold_12(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_9;
  }
  if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setUserName:");
    objc_msgSend(*(id *)(a1 + 32), "setPassword:", *(_QWORD *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
    {
      v5 = *v2;
    }
    else
    {
      if ((piston_log_level & 4) != 0)
      {
        v75 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v75)
          __piston_session_setup_block_invoke_cold_11(v75, v76, v77, v78, v79, v80, v81, v82);
      }
      v5 = *v2;
      v4 = 0;
    }
    objc_msgSend(v5, "setRealm:", v4);
    objc_msgSend(*v2, "realm");
    v83 = objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      v84 = (void *)v83;
      objc_msgSend(*v2, "realm");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "length");

      if (v86)
      {
        if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __piston_session_setup_block_invoke_cold_10(v2);
      }
    }
    v87 = *(_QWORD *)(v3 + 560) & 0xFFFFFFFFFF8FFFFFLL;
    *(_QWORD *)(v3 + 560) = v87;
    v88 = **v116;
    if ((v88 & 8) != 0)
    {
      *(_QWORD *)(v3 + 560) = v87 | 0x200000;
      if ((piston_log_level & 4) != 0)
      {
        v97 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v97)
          __piston_session_setup_block_invoke_cold_9(v97, v98, v99, v100, v101, v102, v103, v104);
      }
    }
    else if ((v88 & 2) != 0)
    {
      *(_QWORD *)(v3 + 560) = v87 | 0x400000;
      if ((piston_log_level & 4) != 0)
      {
        v105 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v105)
          __piston_session_setup_block_invoke_cold_8(v105, v106, v107, v108, v109, v110, v111, v112);
      }
    }
    else if ((v88 & 4) != 0)
    {
      *(_QWORD *)(v3 + 560) = v87 | 0x100000;
      if ((piston_log_level & 4) != 0)
      {
        v89 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v89)
          __piston_session_setup_block_invoke_cold_7(v89, v90, v91, v92, v93, v94, v95, v96);
      }
    }
LABEL_9:
    v15 = *(_QWORD *)(v3 + 560);
    if ((v15 & 0x100) != 0)
    {
      v16 = *(_QWORD *)(v3 + 552);
      if ((v16 & 0xC00000) != 0)
      {
        *(_QWORD *)(v3 + 552) = v16 & 0xFFFFFFFFFFFFFFF7;
        *(_QWORD *)(v3 + 560) = v15 & 0xFFFFFFFFFFFFFEFFLL;
      }
    }
    v17 = *((_QWORD *)*v116 + 1);
    if (v17)
      *(_QWORD *)(v3 + 576) = v17;
    *(_QWORD *)(v3 + 568) = 0;
    *(_DWORD *)(v3 + 168) = -1073741802;
    *(_QWORD *)&v6 = 136315394;
    v113 = v6;
    v115 = v2;
    while (1)
    {
      v18 = piston_gss_transact(*v2);
      v19 = v18;
      if ((_DWORD)v18 && (_DWORD)v18 != 35)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __piston_session_setup_block_invoke_cold_3();
        if (*(_QWORD *)(v3 + 568))
          objc_msgSend(*v2, "logoff");
        goto LABEL_82;
      }
      if (*(_DWORD *)(v3 + 168) == -1073741802)
        break;
LABEL_62:
      if ((_DWORD)v19 != 35)
      {
        v43 = *(_QWORD *)(v3 + 552);
        v44 = *(_WORD *)(v3 + 68);
        if ((v43 & 0x8C00000) == 0 && (v44 & 1) != 0)
        {
          if (piston_log_level)
          {
            v45 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v45)
              __piston_session_setup_block_invoke_cold_5(v45, v46, v47, v48, v49, v50, v51, v52);
          }
          objc_msgSend(*v2, "logoff", v113);
          v19 = 80;
          goto LABEL_85;
        }
        if ((v44 & 1) != 0)
        {
          *(_QWORD *)(v3 + 552) = v43 & 0xFFFFFFFFFFFFFFF7;
          smb_reset_sig(v3);
          v71 = *(void **)(v3 + 272);
          if (!v71)
            goto LABEL_99;
          free(v71);
          v19 = 0;
          *(_QWORD *)(v3 + 272) = 0;
          *(_QWORD *)(v3 + 280) = 0;
        }
        else
        {
          if ((v43 & 0x28800) != 0)
            piston_smb3_derive_keys(*v2);
          v68 = *(_QWORD *)(v3 + 272);
          if (v68)
          {
            v69 = smb3_verify_session_setup(v3, v68, *(_QWORD *)(v3 + 280));
            free(*(void **)(v3 + 272));
            *(_QWORD *)(v3 + 272) = 0;
            *(_QWORD *)(v3 + 280) = 0;
            if (v69)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                __piston_session_setup_block_invoke_cold_4();
              objc_msgSend(*v2, "logoff", smb_reset_sig(v3));
              v70 = 0;
              v19 = 80;
              goto LABEL_101;
            }
          }
LABEL_99:
          v19 = 0;
        }
        v70 = 1;
LABEL_101:
        smb2_rq_credit_start(v3, 0);
        piston_gss_reset((gss_cred_id_t *)v3);
        if (v70)
        {
          v72 = *v116;
          if (*v116
            && (*((_WORD *)v72 + 10) = *(_WORD *)(v3 + 68),
                *((_QWORD *)v72 + 3) = *(_QWORD *)(v3 + 568),
                *((_QWORD *)v72 + 4) = 0,
                objc_msgSend(*v2, "sock"),
                v73 = (void *)objc_claimAutoreleasedReturnValue(),
                v74 = objc_msgSend(v73, "isPerAppVPN"),
                v73,
                v74 == 1))
          {
            v19 = 0;
            *((_QWORD *)*v116 + 4) |= 1uLL;
          }
          else
          {
            v19 = 0;
          }
        }
        goto LABEL_86;
      }
    }
    v20 = v3;
    v21 = *v116;
    v22 = *v2;
    v23 = objc_msgSend(v22, "getSessionPtr");
    v24 = 0;
    *(_DWORD *)&size[1] = 0;
    size[0] = 0;
    v25 = (*(_DWORD *)(v23 + 80) - 64);
    v26 = *(char **)(v23 + 160);
    do
    {
      if (v24)
        objc_msgSend(v24, "smb_rq_done");
      v117 = v24;
      uint16le = smb2_rq_alloc(1, 0, 0, 0, v22, &v117);
      v28 = v117;

      if ((_DWORD)uint16le)
        break;
      v29 = objc_msgSend(v28, "smb_rq_getrequest");
      mb_put_uint16le(v29, 25);
      mb_put_uint8(v29, 0);
      client_security_mode = smb2_smb_get_client_security_mode(v23);
      mb_put_uint8(v29, client_security_mode);
      mb_put_uint32le(v29, 1);
      mb_put_uint32le(v29, 0);
      mb_put_uint16le(v29, 88);
      v31 = *(_QWORD *)(v23 + 152);
      if (v31 <= v25)
        v32 = v31;
      else
        v32 = v25;
      mb_put_uint16le(v29, v32);
      mb_put_uint64le(v29, *(_QWORD *)(v23 + 576));
      mb_put_mem(v29, v26, v32, 0);
      uint16le = smb_rq_simple(v22, v28);
      v33 = objc_msgSend(v28, "sr_ntstatus");
      *(_DWORD *)(v23 + 168) = v33;
      v21[4] = v33;
      if ((_DWORD)uint16le && (objc_msgSend(v28, "sr_flags") & 0x10) != 0)
      {
        if (!*(_QWORD *)(v23 + 152))
          break;
      }
      else
      {
        if (!*(_QWORD *)(v23 + 568))
          *(_QWORD *)(v23 + 568) = objc_msgSend(v28, "sr_rspsessionid");
        v26 += v32;
        v34 = *(_QWORD *)(v23 + 152) - v32;
        *(_QWORD *)(v23 + 152) = v34;
        if (!v34)
          break;
      }
      v24 = v28;
    }
    while ((_DWORD)uint16le == 35);
    v35 = *(void **)(v23 + 160);
    if (v35)
    {
      free(v35);
      *(_QWORD *)(v23 + 160) = 0;
    }
    *(_QWORD *)(v23 + 152) = 0;
    v3 = v20;
    if ((_DWORD)uint16le && (_DWORD)uint16le != 35)
    {
      if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)&size[3] = v113;
        v119 = "smb2_smb_gss_session_setup";
        v120 = 1024;
        v121 = uint16le;
        _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Extended security authorization failed! %d\n", (uint8_t *)&size[3], 0x12u);
      }
    }
    else
    {
      v36 = (_QWORD *)objc_msgSend(v28, "smb_rq_getreply", v113);
      uint16le = md_get_uint16le(v36, &size[2]);
      if (!(_DWORD)uint16le)
      {
        v37 = size[2];
        if (size[2] == 9)
        {
          uint16le = md_get_uint16le(v36, (_WORD *)(v23 + 68));
          if (!(_DWORD)uint16le)
          {
            uint16le = md_get_uint16le(v36, &size[1]);
            if (!(_DWORD)uint16le)
            {
              uint16le = md_get_uint16le(v36, size);
              if (!(_DWORD)uint16le)
              {
                if (!size[1] || (size[1] -= 72, uint16le = md_get_mem(v36, 0, size[1], 0), !(_DWORD)uint16le))
                {
                  v38 = *(void **)(v23 + 144);
                  if (v38)
                  {
                    free(v38);
                    *(_QWORD *)(v23 + 144) = 0;
                  }
                  v39 = size[0];
                  *(_QWORD *)(v23 + 136) = size[0];
                  if (!v39)
                  {
                    objc_msgSend(v28, "smb_rq_done");
                    uint16le = 0;
                    goto LABEL_58;
                  }
                  v40 = (char *)malloc_type_malloc(v39, 0x2A2DC1F8uLL);
                  *(_QWORD *)(v23 + 144) = v40;
                  if (v40)
                  {
                    v41 = size[0];
                    *(_QWORD *)(v23 + 136) = size[0];
                    uint16le = md_get_mem(v36, v40, v41, 0);
                    objc_msgSend(v28, "smb_rq_done");
                    if (!(_DWORD)uint16le)
                      goto LABEL_58;
                    goto LABEL_57;
                  }
                  uint16le = 12;
                }
              }
            }
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)&size[3] = v113;
            v119 = "smb2_smb_gss_session_setup";
            v120 = 1024;
            v121 = v37;
            _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Bad struct size: %u\n", (uint8_t *)&size[3], 0x12u);
          }
          uint16le = 72;
        }
      }
    }
    objc_msgSend(v28, "smb_rq_done", v113);
LABEL_57:
    *(_QWORD *)(v23 + 568) = 0;
LABEL_58:

    if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v42 = (*v116)[4];
      *(_DWORD *)&size[3] = 136315650;
      v119 = "piston_session_setup_block_invoke";
      v120 = 1024;
      v121 = uint16le;
      v122 = 1024;
      v123 = v42;
      _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: smb2_smb_gss_session_setup <%d> NT Status<0x%x>\n", (uint8_t *)&size[3], 0x18u);
    }
    v2 = v115;
    if ((_DWORD)uint16le)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __piston_session_setup_block_invoke_cold_6((uint64_t)v116, uint16le, v61, v62, v63, v64, v65, v66);
      v19 = uint16le;
      goto LABEL_82;
    }
    goto LABEL_62;
  }
  v53 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v53)
    __piston_session_setup_block_invoke_cold_2(v53, v54, v55, v56, v57, v58, v59, v60);
  v19 = 22;
LABEL_82:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __piston_session_setup_block_invoke_cold_1();
  smb_reset_sig(v3);
LABEL_85:
  piston_gss_reset((gss_cred_id_t *)v3);
LABEL_86:
  result = *(_QWORD *)(v114 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v19);
  return result;
}

uint64_t piston_ntstatus_to_errno(unsigned int a1)
{
  int v1;
  uint64_t i;

  v1 = (a1 >> 30) ^ 2;
  if ((v1 - 2) < 2)
    return 0;
  if (v1)
  {
    for (i = 0; i != 306; i += 2)
    {
      if (nt2errno[i] == a1)
        return nt2errno[i + 1];
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      piston_ntstatus_to_errno_cold_1();
    return 5;
  }
  if (a1 == -2147483643)
    return 0;
  if (a1 != -2147483642)
  {
    if (a1 != -2147483603)
      printf("%s: Unable to map warning ntstatus to errno, ntstatus: 0x%x\n", "piston_ntstatus_warning_to_errno", a1);
    return 5;
  }
  return 2;
}

void piston_set_session_key(void *a1, const void *a2, int a3)
{
  size_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  LODWORD(v3) = a3;
  v5 = objc_msgSend(a1, "getSessionPtr");
  if (a2 && (_DWORD)v3)
  {
    v6 = v5;
    smb_reset_sig(v5);
    *(_DWORD *)(v6 + 240) = v3;
    v7 = malloc_type_malloc(v3, 0x70345BD7uLL);
    *(_QWORD *)(v6 + 232) = v7;
    if (v7)
    {
      memcpy(v7, a2, *(unsigned int *)(v6 + 240));
      if (v3 >= 0x10)
        v8 = 16;
      else
        v8 = v3;
      if ((*(_QWORD *)(v6 + 552) & 0x1000) != 0)
        v3 = v8;
      else
        v3 = v3;
      v9 = malloc_type_malloc(v3, 0x44F6225uLL);
      *(_QWORD *)(v6 + 216) = v9;
      if (v9)
      {
        memmove(v9, a2, v3);
        *(_DWORD *)(v6 + 224) = v3;
      }
      else
      {
        v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v18)
          piston_set_session_key_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v10)
        piston_set_session_key_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

uint64_t smb_convert_network_to_path(char *a1, size_t __n, UInt8 *a3, CFIndex *a4, int a5, char a6, int a7)
{
  CFIndex v8;
  size_t v9;
  BOOL v10;
  CFIndex v11;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  size_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  UInt8 *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  size_t v28;
  CFIndex v29;
  UInt8 *v30;
  char *__s1;

  v30 = a3;
  __s1 = a1;
  v8 = *a4;
  v29 = *a4;
  if (!a1)
  {
    v11 = v8;
LABEL_47:
    v26 = 0;
    *a4 = v8 - v11;
    return v26;
  }
  v9 = __n;
  if (v8)
    v10 = __n == 0;
  else
    v10 = 1;
  v11 = v8;
  if (v10)
    goto LABEL_47;
  v28 = 0;
  while (1)
  {
    if (a7)
    {
      if (v9 >= 2)
      {
        v17 = 0;
        v18 = v9 >> 1;
        while (1)
        {
          if (!*(_WORD *)&a1[v17])
          {
LABEL_19:
            v15 = 0;
            goto LABEL_23;
          }
          if (*(unsigned __int16 *)&a1[v17] == a5)
            break;
          v17 += 2;
          if (2 * (v9 >> 1) == v17)
            goto LABEL_19;
        }
        v15 = &a1[v17];
        *(_WORD *)&a1[v17] = 0;
        v18 = (v9 - 2) >> 1;
        v9 -= 2;
LABEL_23:
        if (v9 >= 2)
        {
          v24 = 2 * v18;
          v20 = a1;
          v25 = &a1[2 * v18];
          while (*(_WORD *)v20)
          {
            v20 += 2;
            v24 -= 2;
            if (!v24)
            {
              v20 = v25;
              goto LABEL_25;
            }
          }
          goto LABEL_25;
        }
      }
      else
      {
        v15 = 0;
        v9 = 1;
      }
      v20 = a1;
LABEL_25:
      v19 = v20 - a1;
      goto LABEL_26;
    }
    v16 = 0;
    while (1)
    {
      if (!a1[v16])
      {
LABEL_14:
        v15 = 0;
        goto LABEL_21;
      }
      if (a1[v16] == a5)
        break;
      if (v9 == ++v16)
        goto LABEL_14;
    }
    --v9;
    v15 = &a1[v16];
    a1[v16] = 0;
    a1 = __s1;
LABEL_21:
    v19 = strnlen(a1, v9);
LABEL_26:
    v28 = v19;
    v21 = smb_convert_from_network((const UInt8 **)&__s1, &v28, &v30, &v29, a6, a7);
    if ((_DWORD)v21)
      break;
    if (v15)
    {
      if (a7)
        *(_WORD *)v15++ = a5;
      else
        *v15 = a5;
      __s1 = v15 + 1;
      if (!v29)
        return 7;
      v22 = v28;
      v11 = v29 - 1;
      v23 = v30;
      --v29;
      ++v30;
      *v23 = 47;
      a1 = __s1;
    }
    else
    {
      a1 = 0;
      __s1 = 0;
      v22 = v28;
      v11 = v29;
    }
    if (a1)
    {
      if (v11)
      {
        v9 = v9 - v19 + v22;
        if (v9)
          continue;
      }
    }
    v8 = *a4;
    goto LABEL_47;
  }
  v26 = v21;
  if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    smb_convert_network_to_path_cold_1();
  return v26;
}

uint64_t smb_convert_from_network(const UInt8 **a1, unint64_t *a2, UInt8 **a3, CFIndex *a4, char a5, int a6)
{
  const UInt8 *v7;
  unint64_t v10;
  unint64_t v12;
  __int16 v13;
  CFIndex v14;
  UInt8 *v15;
  const __CFAllocator *v16;
  const __CFString *v17;
  const __CFString *v18;
  __CFString *MutableCopy;
  const __CFString *v20;
  CFIndex Length;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _BOOL8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  UInt8 *v80;
  UInt8 *v81;
  UInt8 *v82;
  _BOOL8 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  CFIndex v92;
  CFIndex maxBufLen;
  CFRange v94;
  CFRange v95;
  CFRange v96;

  if (!a1)
  {
    v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v31)
      smb_convert_from_network_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
    return 22;
  }
  v7 = *a1;
  if (!*a1)
  {
    v39 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v39)
      smb_convert_from_network_cold_2(v39, v40, v41, v42, v43, v44, v45, v46);
    return 22;
  }
  if (!a3)
  {
    v47 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v47)
      smb_convert_from_network_cold_3(v47, v48, v49, v50, v51, v52, v53, v54);
    return 22;
  }
  if (!a6)
  {
    v55 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v55)
      smb_convert_from_network_cold_4(v55, v56, v57, v58, v59, v60, v61, v62);
    return 22;
  }
  v10 = *a2;
  if (!*a2)
    return 0;
  if ((a5 & 0x20) != 0)
  {
    v12 = 0;
    do
    {
      v13 = *(_WORD *)&v7[v12];
      if ((v13 & 0xFFC0) == 0xF000 && (v13 & 0x3Fu) <= 0x29)
        v13 = sfm2mac[v13 & 0x3F];
      *(_WORD *)&v7[v12] = v13;
      v12 += 2;
    }
    while (v12 < v10);
  }
  v14 = *a4;
  maxBufLen = 0;
  v15 = *a3;
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v17 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, v10, 0x14000100u, 0);
  if (!v17)
  {
    v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v63)
      smb_convert_from_network_cold_5(v63, v64, v65, v66, v67, v68, v69, v70);
    return 22;
  }
  v18 = v17;
  MutableCopy = CFStringCreateMutableCopy(v16, 0, v17);
  if (!MutableCopy)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb_convert_from_network_cold_6();
    CFRelease(v18);
    return 22;
  }
  v20 = MutableCopy;
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  Length = CFStringGetLength(v20);
  v94.location = 0;
  v94.length = Length;
  v92 = v14;
  if (!CFStringGetBytes(v20, v94, 0x8000100u, 0, 0, 0, 0, &maxBufLen))
  {
    v72 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v72)
      smb_convert_from_network_cold_7(v72, v73, v74, v75, v76, v77, v78, v79);
    goto LABEL_38;
  }
  v14 = maxBufLen;
  if (!v15)
  {
    v80 = (UInt8 *)malloc_type_calloc(maxBufLen, 1uLL, 0x1130D56BuLL);
    if (!v80)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb_convert_from_network_cold_8();
      LODWORD(v15) = 0;
      v30 = 12;
      goto LABEL_52;
    }
    v95.location = 0;
    v95.length = Length;
    v81 = v80;
    if (CFStringGetBytes(v20, v95, 0x8000100u, 0, 0, v80, v14, &maxBufLen))
    {
      v82 = v81;
      v30 = 0;
      *a3 = v82;
LABEL_45:
      LODWORD(v15) = 1;
      goto LABEL_53;
    }
LABEL_46:
    v83 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    LODWORD(v14) = v92;
    if (v83)
    {
      smb_convert_from_network_cold_9(v83, v84, v85, v86, v87, v88, v89, v90);
      if (!v15)
        goto LABEL_48;
    }
    else if (!v15)
    {
LABEL_48:
      free(v81);
      goto LABEL_39;
    }
LABEL_38:
    LODWORD(v15) = 0;
LABEL_39:
    v30 = 22;
    goto LABEL_53;
  }
  if (maxBufLen <= v92)
  {
    v96.location = 0;
    v96.length = Length;
    v81 = *a3;
    if (CFStringGetBytes(v20, v96, 0x8000100u, 0, 0, *a3, maxBufLen, &maxBufLen))
    {
      v30 = 0;
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v22)
    smb_convert_from_network_cold_10(v22, v23, v24, v25, v26, v27, v28, v29);
  LODWORD(v15) = 0;
  v30 = 34;
LABEL_52:
  LODWORD(v14) = v92;
LABEL_53:
  CFRelease(v18);
  CFRelease(v20);
  if ((_DWORD)v15)
  {
    v30 = 0;
    *a1 += v10;
    v91 = v14 | v92 & 0xFFFFFFFF00000000;
    *a3 += v91;
    *a2 -= v10;
    *a4 -= v91;
  }
  return v30;
}

uint64_t smb_convert_path_to_network(char *__s1, size_t __n, UInt8 *a3, unint64_t *a4, __int16 a5, char a6, int a7)
{
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  BOOL v11;
  unint64_t v12;
  char *v16;
  uint64_t v17;
  char *v18;
  int v19;
  size_t v20;
  size_t v21;
  int v22;
  char v23;
  uint64_t result;
  const char *v25;
  uint64_t v26;
  UInt8 *v27;
  UInt8 *v28;
  unint64_t v29;
  size_t v30;
  UInt8 *v31;
  char *v32;

  v31 = a3;
  v32 = __s1;
  v8 = *a4;
  v29 = *a4;
  v30 = 0;
  if (a7)
    v9 = 2;
  else
    v9 = 1;
  if (__s1)
  {
    v10 = __n;
    if (v8)
      v11 = __n == 0;
    else
      v11 = 1;
    v12 = v8;
    if (!v11)
    {
      v16 = __s1;
      while (1)
      {
        v17 = 0;
        while (1)
        {
          if (!v16[v17])
          {
LABEL_14:
            v18 = 0;
            v19 = 1;
            goto LABEL_16;
          }
          if (v16[v17] == 47)
            break;
          if (v10 == ++v17)
            goto LABEL_14;
        }
        v19 = 0;
        --v10;
        v18 = &v16[v17];
        v16[v17] = 0;
        v16 = v32;
LABEL_16:
        v20 = strnlen(v16, v10);
        v21 = v20;
        v30 = v20;
        if (v20 == 2)
        {
          if (*v16 != 46)
            goto LABEL_23;
          v22 = v16[1];
        }
        else
        {
          if (v20 != 1)
            goto LABEL_23;
          v22 = *v16;
        }
        if (v22 == 46)
        {
          v23 = 0;
          goto LABEL_24;
        }
LABEL_23:
        v23 = a6;
LABEL_24:
        result = smb_convert_to_network((const char **)&v32, (uint64_t *)&v30, &v31, (uint64_t *)&v29, v23, a7);
        if ((_DWORD)result)
          return result;
        if (v19)
        {
          v32 = 0;
          v12 = v29;
LABEL_34:
          v8 = *a4;
          break;
        }
        *v18 = 47;
        v25 = v18 + 1;
        v32 = (char *)v25;
        v12 = v29 - v9;
        if (v29 < v9)
          return 7;
        v26 = v30;
        v27 = v31;
        v29 -= v9;
        if (a7)
        {
          *(_WORD *)v31 = a5;
          v28 = v27 + 2;
          v16 = (char *)v25;
        }
        else
        {
          *v31 = a5;
          v28 = v27 + 1;
          v16 = v32;
        }
        v31 = v28;
        if (v16)
        {
          if (v12)
          {
            v10 = v10 - v21 + v26;
            if (v10)
              continue;
          }
        }
        goto LABEL_34;
      }
    }
  }
  else
  {
    v12 = v8;
  }
  result = 0;
  *a4 = v8 - v12;
  return result;
}

uint64_t smb_convert_to_network(const char **a1, uint64_t *a2, UInt8 **a3, uint64_t *a4, char a5, int a6)
{
  const char *v7;
  uint64_t v10;
  uint64_t v13;
  const __CFAllocator *v14;
  const __CFString *v15;
  const __CFString *v16;
  __CFString *MutableCopy;
  const __CFString *v18;
  CFIndex Length;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v71;
  UInt8 *v72;
  unint64_t v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  uint64_t v77;
  CFIndex usedBufLen;
  CFRange v79;
  CFRange v80;

  if (!a1)
  {
    v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v30)
      smb_convert_to_network_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);
    return 22;
  }
  v7 = *a1;
  if (!*a1)
  {
    v38 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v38)
      smb_convert_to_network_cold_2(v38, v39, v40, v41, v42, v43, v44, v45);
    return 22;
  }
  if (!a3)
  {
    v46 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v46)
      smb_convert_to_network_cold_3(v46, v47, v48, v49, v50, v51, v52, v53);
    return 22;
  }
  if (!*a3)
  {
    v54 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v54)
      smb_convert_to_network_cold_4(v54, v55, v56, v57, v58, v59, v60, v61);
    return 22;
  }
  if (!a6)
  {
    v62 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v62)
      smb_convert_to_network_cold_5(v62, v63, v64, v65, v66, v67, v68, v69);
    return 22;
  }
  v10 = *a2;
  if (!*a2)
    return 0;
  v13 = *a4;
  usedBufLen = 0;
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, 0x8000100u);
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb_convert_to_network_cold_6();
    return 22;
  }
  v16 = v15;
  MutableCopy = CFStringCreateMutableCopy(v14, 0, v15);
  if (!MutableCopy)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb_convert_to_network_cold_7();
    CFRelease(v16);
    return 22;
  }
  v18 = MutableCopy;
  v77 = v13;
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormC);
  Length = CFStringGetLength(v18);
  v79.location = 0;
  v79.length = Length;
  if (CFStringGetBytes(v18, v79, 0x14000100u, 0, 0, 0, 0, &usedBufLen))
  {
    if (usedBufLen > v77)
    {
      v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v20)
        smb_convert_to_network_cold_9(v20, v21, v22, v23, v24, v25, v26, v27);
      v28 = 0;
      v29 = 34;
      goto LABEL_39;
    }
    v80.location = 0;
    v80.length = Length;
    if (CFStringGetBytes(v18, v80, 0x14000100u, 0, 0, *a3, usedBufLen, 0))
    {
      v29 = 0;
      v76 = usedBufLen;
      v28 = 1;
      goto LABEL_40;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb_convert_to_network_cold_10();
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    smb_convert_to_network_cold_8();
  }
  v28 = 0;
  v29 = 22;
LABEL_39:
  v76 = v77;
LABEL_40:
  CFRelease(v16);
  CFRelease(v18);
  if (v28)
  {
    v71 = v76 | v77 & 0xFFFFFFFF00000000;
    if ((a5 & 0x20) != 0 && v71)
    {
      v72 = *a3;
      v73 = v76 | v77 & 0xFFFFFFFF00000000;
      while (1)
      {
        v74 = *(unsigned __int16 *)v72;
        if (v74 <= 0x7F)
          break;
LABEL_55:
        v72 += 2;
        v73 -= 2;
        if (!v73)
          goto LABEL_56;
      }
      if (v73 == 2)
      {
        if (v74 == 32)
        {
          LOWORD(v74) = -4056;
          goto LABEL_54;
        }
        if (v74 == 46)
        {
          LOWORD(v74) = -4055;
LABEL_54:
          *(_WORD *)v72 = v74;
          goto LABEL_55;
        }
      }
      if (v74 > 0x1F)
      {
        v75 = mac2sfm[v74 - 32];
        if (v74 != v75)
          LOWORD(v74) = v75 | 0xF000;
      }
      else
      {
        LOWORD(v74) = v74 | 0xF000;
      }
      goto LABEL_54;
    }
LABEL_56:
    v29 = 0;
    *a1 += v10;
    *a3 += v71;
    *a2 -= v10;
    *a4 -= v71;
  }
  return v29;
}

const char *smb_get_cstring_len(void *a1, _DWORD *a2)
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;

  v3 = a1;
  v4 = v3;
  *a2 = 0;
  if (v3)
  {
    v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "cStringUsingEncoding:", 4);
    v6 = v5;
    if (v5)
      *a2 = strlen(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t smb_put_dmem(uint64_t a1, const char *a2, uint64_t a3, char a4, int a5, _QWORD *a6)
{
  unint64_t v10;
  UInt8 *v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  unint64_t v16;
  UInt8 *v17;
  uint64_t v18;
  const char *v19;
  _BYTE v20[512];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v19 = a2;
  if (!a3)
    return 0;
  v10 = 2 * a3 + 2;
  if (v10 < 0x201)
  {
    v11 = v20;
    v10 = 512;
  }
  else
  {
    v11 = (UInt8 *)malloc_type_malloc(2 * a3 + 2, 0x9B41D396uLL);
    if (!v11)
      return 12;
  }
  v16 = v10;
  v17 = v11;
  v12 = smb_convert_to_network(&v19, &v18, &v17, (uint64_t *)&v16, a4, a5);
  if (!(_DWORD)v12)
  {
    v13 = v10 - v16;
    if (a5)
      mb_put_padbyte(a1);
    v14 = mb_put_mem(a1, (char *)v11, v13, 0);
    v12 = v14;
    if (a6 && !(_DWORD)v14)
      *a6 += v13;
  }
  if (v11 != v20)
    free(v11);
  return v12;
}

_BYTE *smb_strndup(const char *a1, size_t a2)
{
  size_t v3;
  _BYTE *v4;
  _BYTE *v5;

  if (!a1)
    return 0;
  v3 = strnlen(a1, a2);
  v4 = malloc_type_malloc(v3 + 1, 0xC0F07796uLL);
  v5 = v4;
  if (v4)
  {
    memcpy(v4, a1, v3);
    v5[v3] = 0;
  }
  return v5;
}

unint64_t smb_time_NT2local(unint64_t result, _QWORD *a2)
{
  unint64_t v2;

  v2 = 100 * (result % HUNDRED_NSEC_PER_SEC);
  *a2 = result / HUNDRED_NSEC_PER_SEC - DIFF1970TO1601;
  a2[1] = v2;
  return result;
}

uint64_t *smb_time_local2NT(uint64_t *result, uint64_t *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *result;
  if (a3)
    v4 = ((v3 & 0xFFFFFFFFFFFFFFFELL) + DIFF1970TO1601) * HUNDRED_NSEC_PER_SEC;
  else
    v4 = result[1] / 100 + (DIFF1970TO1601 + v3) * HUNDRED_NSEC_PER_SEC;
  *a2 = v4;
  return result;
}

unint64_t smb2_smb_get_alloc_size(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a1;
  objc_msgSend(v3, "pd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getShare:", objc_msgSend(v3, "shareID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (a2)
    {
      objc_msgSend(v5, "statfs_lock");
      if (objc_msgSend(v5, "fs_block_size"))
      {
        v6 = a2 / objc_msgSend(v5, "fs_block_size");
        v7 = v6 * objc_msgSend(v5, "fs_block_size");
        a2 = v7 + objc_msgSend(v5, "fs_block_size");
      }
      else
      {
        v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v8)
          smb2_smb_get_alloc_size_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
        a2 = 0;
      }
      objc_msgSend(v5, "statfs_unlock");
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_get_alloc_size_cold_1(v3);
    a2 = 0;
  }

  return a2;
}

uint64_t smb2_smb_get_client_capabilities(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
    return (*(unsigned __int8 *)(a1 + 561) << 27 >> 31) & 0x77;
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    smb2_smb_get_client_capabilities_cold_1(result, v2, v3, v4, v5, v6, v7, v8);
    return 0;
  }
  return result;
}

uint64_t smb2_smb_get_client_dialects(uint64_t a1, int a2, __int16 *a3, __int16 *a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  __int16 v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (a5 <= 9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_get_client_dialects_cold_1();
    return 12;
  }
  if (a2)
  {
    *a3 = 1;
    v9 = *(_QWORD *)(a1 + 552);
    if ((v9 & 0x20000) != 0)
    {
      result = 0;
      v19 = 785;
    }
    else if ((v9 & 0x8000) != 0)
    {
      result = 0;
      v19 = 770;
    }
    else if ((v9 & 0x800) != 0)
    {
      result = 0;
      v19 = 768;
    }
    else if ((v9 & 0x4000) != 0)
    {
      result = 0;
      v19 = 528;
    }
    else
    {
      if ((v9 & 0x2000) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_get_client_dialects_cold_3(a1 + 552, v10, v11, v12, v13, v14, v15, v16);
        return 22;
      }
      result = 0;
      v19 = 514;
    }
    *a4 = v19;
    return result;
  }
  v17 = *(_QWORD *)(a1 + 560) & 0x1002;
  switch(v17)
  {
    case 2:
      result = 0;
      *a3 = 2;
      *(_DWORD *)a4 = 34603522;
      break;
    case 4096:
      result = 0;
      *a3 = 3;
      *(_DWORD *)a4 = 50463488;
      a4[2] = 785;
      break;
    case 4098:
      if ((*(_BYTE *)(a1 + 555) & 0x40) != 0)
      {
        if (piston_log_level)
        {
          v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v20)
            smb2_smb_get_client_dialects_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
        }
        v18 = 4;
      }
      else
      {
        v18 = 5;
      }
      result = 0;
      *a3 = v18;
      *(_QWORD *)a4 = 0x302030002100202;
      a4[4] = 785;
      break;
    default:
      return 0;
  }
  return result;
}

uint64_t smb2_smb_get_client_security_mode(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 561) & 1) != 0)
      return 2;
  }
  else
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      smb2_smb_get_client_security_mode_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return 1;
}

void smb2fs_smb_file_id_check(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  uint64_t v5;
  int v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
    return;
  v5 = *(_QWORD *)(a1 + 560);
  if ((v5 & 0x10) == 0)
    return;
  if (a3 && a4)
  {
    if (a4 == 4)
    {
      v6 = *a3 - 3014656;
LABEL_9:
      if (v6 == 46)
        return;
      goto LABEL_10;
    }
    if (a4 == 2)
    {
      v6 = *(unsigned __int16 *)a3;
      goto LABEL_9;
    }
  }
LABEL_10:
  if (piston_log_level)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      smb2fs_smb_file_id_check_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    v5 = *(_QWORD *)(a1 + 560);
  }
  *(_QWORD *)(a1 + 560) = v5 & 0xFFFFFFFFFFFFFFEFLL;
}

uint64_t piston_get_create_options(void *a1, uint64_t a2, void *a3, void *a4, void *a5, int a6, __int16 a7, int a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v32;
  unsigned int v33;

  v15 = a1;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6 == 2;
  if (a8)
  {
    objc_msgSend(v15, "getShare:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if (objc_msgSend(v20, "fstype"))
      {
        if ((objc_msgSend(v21, "file_system_attrs") & 0x80) == 0)
          goto LABEL_26;
      }
      else
      {
        v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v22)
          piston_get_create_options_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_get_create_options_cold_1();
    }
    v32 = (a7 & 0x1400) != 0x400 || v18 != 0 || v17 != 0 || v16 == 0;
    v33 = v19 | 0x200000;
    if (v32)
      v33 = a6 == 2;
    if (a6 == 5)
      v19 = 0x200000;
    else
      v19 = v33;
  }
  else
  {
    v21 = 0;
  }
LABEL_26:

  return v19;
}

uint64_t smb2fs_fullpath(uint64_t a1, char *a2, size_t a3, const char *a4, uint64_t a5, char a6)
{
  size_t v12;
  UInt8 *v13;
  UInt8 *v14;
  uint64_t v15;
  uint64_t v16;
  size_t v18;

  if (a2)
  {
    v12 = 2 * a3 + 2;
    v18 = v12;
    v13 = (UInt8 *)malloc_type_malloc(v12, 0xDE2F6702uLL);
    if (!v13)
      return 12;
    v14 = v13;
    bzero(v13, v12);
    v15 = smb_convert_path_to_network(a2, a3, v14, &v18, 92, a6, 1);
    if ((_DWORD)v15)
    {
      v16 = v15;
      free(v14);
      return v16;
    }
    v16 = mb_put_mem(a1, (char *)v14, v18, 0);
    free(v14);
    if ((_DWORD)v16)
      return v16;
  }
  if (!a4)
    return 0;
  v16 = mb_put_uint16le(a1, 58);
  if (!(_DWORD)v16)
  {
    v16 = smb_put_dmem(a1, a4, a5, a6, 1, 0);
    if (!(_DWORD)v16)
      return 0;
  }
  return v16;
}

UInt8 *smbfs_ntwrkname_tolocal(const UInt8 *a1, unint64_t *a2, int a3)
{
  uint64_t v5;
  CFIndex v6;
  UInt8 *v7;
  CFIndex v8;
  CFIndex v10;
  unint64_t v11;
  UInt8 *v12;
  const UInt8 *v13;

  v13 = a1;
  if (!a2 || !*a2)
    return 0;
  v5 = 9;
  if (!a3)
    v5 = 3;
  if (*a2 * v5 >= 0x1FFFF)
    v6 = 0x1FFFFLL;
  else
    v6 = *a2 * v5;
  v7 = (UInt8 *)malloc_type_malloc(v6 + 1, 0x2C168D1FuLL);
  v10 = v6;
  v11 = *a2;
  v12 = v7;
  smb_convert_from_network(&v13, &v11, &v12, &v10, 32, a3);
  v8 = v6 - v10;
  *a2 = v6 - v10;
  v7[v8] = 0;
  return v7;
}

uint64_t smbfs_ntwrkname_tolocal_buffer(const UInt8 *a1, unint64_t *a2, UInt8 *a3, unint64_t a4, int a5)
{
  unint64_t v6;
  unint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  UInt8 *v14;
  const UInt8 *v15;

  v15 = a1;
  if (!a2)
    return 22;
  v6 = *a2;
  if (!*a2)
    return 22;
  if (a5)
    v9 = 9 * v6;
  else
    v9 = 3 * v6;
  if (v9 >= 0x1FFFF)
    v9 = 0x1FFFFLL;
  if (v9 > a4)
    return 28;
  v13 = *a2;
  v14 = a3;
  v12 = a4;
  smb_convert_from_network(&v15, &v13, &v14, (CFIndex *)&v12, 32, a5);
  result = 0;
  v11 = a4 - v12;
  *a2 = a4 - v12;
  a3[v11] = 0;
  return result;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void piston_close_file(void *a1, char a2, _DWORD *a3, void *a4)
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;

  v7 = a1;
  v8 = a4;
  objc_msgSend(v7, "pd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
    {
      piston_close_file_cold_1(v11, v12, v13);
      if (!v8)
        goto LABEL_8;
    }
    else if (!v8)
    {
      goto LABEL_8;
    }
    v8[2](v8, 57);
    goto LABEL_8;
  }
  if (smb2_smb_close(v7, a2, a3, 0, v8) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    piston_close_file_cold_2();
LABEL_8:

}

uint64_t smb2_smb_close(void *a1, char a2, _DWORD *a3, _QWORD *a4, void *a5)
{
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  void *v23;
  void (**v24)(id, uint64_t);
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  void (**v34)(id, uint64_t);
  uint64_t *v35;
  _DWORD *v36;
  __int16 v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  int v43[6];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  if (!a4 && !objc_msgSend(v9, "fid"))
  {
    objc_msgSend(v9, "fid");
    if (!v11)
    {
      v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v12)
        smb2_smb_close_cold_3(v12, v13, v14);
    }
  }
  v15 = objc_msgSend(v9, "treeID");
  v16 = objc_msgSend(v9, "onEncryptedShare");
  objc_msgSend(v9, "pd");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v18 = smb2_rq_alloc(6, v15, v16, 0, v17, &v38);
  v19 = v38;

  if ((_DWORD)v18)
  {
    if (v19)
      objc_msgSend(v19, "smb_rq_done");
    if (v10)
      v10[2](v10, v18);
  }
  else
  {
    objc_msgSend(v19, "smb_rq_set_extflag:", 8);
    v20 = objc_msgSend(v19, "smb_rq_getrequest");
    mb_put_uint16le(v20, 24);
    v21 = a2 & 1;
    mb_put_uint16le(v20, v21);
    mb_put_uint32le(v20, 0);
    if (a4)
    {
      mb_put_uint64le(v20, -1);
      mb_put_uint64le(v20, -1);
      smb2_rq_align8(v19);
      objc_msgSend(v19, "smb_rq_set_srflags:", 256);
      v18 = 0;
      *a4 = objc_retainAutorelease(v19);
    }
    else
    {
      mb_put_uint64le(v20, objc_msgSend(v9, "fid"));
      objc_msgSend(v9, "fid");
      mb_put_uint64le(v20, v22);
      if (v10)
      {
        objc_msgSend(v9, "pd");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __smb2_smb_close_block_invoke;
        v31[3] = &unk_24FE015C8;
        v24 = v10;
        v34 = v24;
        v36 = a3;
        v25 = v19;
        v32 = v25;
        v35 = &v39;
        v37 = v21;
        v33 = v9;
        v18 = smb_rq_simple_block(v23, v25, v31);

        if ((_DWORD)v18)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_close_cold_2();
          if (v25)
            objc_msgSend(v25, "smb_rq_done");
          v24[2](v24, v18);
        }

      }
      else
      {
        objc_msgSend(v9, "pd");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = smb_rq_simple(v26, v19);

        *a3 = objc_msgSend(v19, "sr_ntstatus");
        if ((_DWORD)v18)
        {
          v27 = MEMORY[0x24BDACB70];
          v28 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            smb2_smb_close_cold_1(v43, v18, objc_msgSend(v19, "sr_ntstatus"));

        }
        else
        {
          v29 = (_QWORD *)objc_msgSend(v19, "smb_rq_getreply");
          v40[3] = (uint64_t)v29;
          v18 = smb2_smb_parse_close(v29, v21, (uint64_t)a3);
          if (!(_DWORD)v18)
            objc_msgSend(v9, "setIsOpen:", 0);
        }
        objc_msgSend(v19, "smb_rq_done");
      }
    }
  }
  _Block_object_dispose(&v39, 8);

  return v18;
}

void sub_23029E798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void piston_create_file(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "pd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
    {
      piston_create_file_cold_1(v9, v10, v11);
      if (!v6)
        goto LABEL_8;
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    v6[2](v6, 57);
    goto LABEL_8;
  }
  if (smb2_smb_create(v5, a2, 0, 0, v6)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    piston_create_file_cold_2();
  }
LABEL_8:

}

uint64_t smb2_smb_create(void *a1, uint64_t a2, void *a3, _QWORD *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  char *cstring_len;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _WORD *v20;
  _DWORD *v21;
  void *v22;
  void *v23;
  BOOL v24;
  int v25;
  _DWORD *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  _DWORD *v35;
  int v36;
  uint64_t v37;
  int v38;
  int v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  _BOOL8 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  NSObject *v60;
  id v61;
  __n128 *v62;
  _DWORD *v64;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _DWORD v80[8];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v66 = a3;
  v9 = a5;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v75 = 0;
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  cstring_len = (char *)smb_get_cstring_len(v10, (_DWORD *)&v75 + 1);

  objc_msgSend(v8, "streamName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = smb_get_cstring_len(v12, &v75);

  v14 = objc_msgSend(v8, "treeID");
  v15 = objc_msgSend(v8, "onEncryptedShare");
  objc_msgSend(v8, "pd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v17 = smb2_rq_alloc(5, v14, v15, 0, v16, &v74);
  v18 = v74;

  if (!(_DWORD)v17)
  {
    objc_msgSend(v18, "smb_rq_set_extflag:", 8);
    v19 = objc_msgSend(v18, "smb_rq_getrequest");
    mb_put_uint16le(v19, 57);
    mb_put_uint8(v19, 0);
    mb_put_uint8(v19, *(_BYTE *)(a2 + 8));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 12));
    mb_put_uint64le(v19, 0);
    mb_put_uint64le(v19, 0);
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 16));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 20));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 24));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 28));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 32));
    mb_put_uint16le(v19, 120);
    v20 = (_WORD *)mb_reserve(v19, 2uLL);
    v21 = (_DWORD *)mb_reserve(v19, 4uLL);
    v64 = (_DWORD *)mb_reserve(v19, 4uLL);
    objc_msgSend(v8, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

    }
    else
    {
      objc_msgSend(v8, "streamName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (v24)
      {
        *v20 = 0;
LABEL_24:
        mb_put_uint16le(v19, 0);
        v25 = (unsigned __int16)*v20;
LABEL_25:
        objc_msgSend(v8, "pd");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "getSessionPtr");

        v29 = *(_QWORD *)a2;
        if ((*(_QWORD *)a2 & 0x4F4) == 0)
        {
          *v64 = 0;
          *v21 = 0;
LABEL_85:
          if (a4)
          {
            smb2_rq_align8(v18);
            objc_msgSend(v18, "smb_rq_set_srflags:", 256);
            v17 = 0;
            *a4 = objc_retainAutorelease(v18);
          }
          else if (v9)
          {
            objc_msgSend(v8, "pd");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v67[0] = MEMORY[0x24BDAC760];
            v67[1] = 3221225472;
            v67[2] = __smb2_smb_create_block_invoke;
            v67[3] = &unk_24FE015F0;
            v57 = v9;
            v71 = v57;
            v73 = a2;
            v58 = v18;
            v68 = v58;
            v72 = &v76;
            v69 = v8;
            v70 = v66;
            v17 = smb_rq_simple_block(v56, v58, v67);

            if ((_DWORD)v17)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_create_cold_2();
              if (v58)
                objc_msgSend(v58, "smb_rq_done");
              (*((void (**)(id, uint64_t))v57 + 2))(v57, v17);
            }

          }
          else
          {
            objc_msgSend(v8, "pd");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = smb_rq_simple(v59, v18);

            *(_DWORD *)(a2 + 52) = objc_msgSend(v18, "sr_ntstatus");
            if ((_DWORD)v17)
            {
              v60 = MEMORY[0x24BDACB70];
              v61 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                smb2_smb_create_cold_1(v80, v17, objc_msgSend(v18, "sr_ntstatus"));

            }
            else
            {
              v62 = (__n128 *)objc_msgSend(v18, "smb_rq_getreply");
              v77[3] = (uint64_t)v62;
              v17 = smb2_smb_parse_create(v8, v62, a2, v66);
              if (!(_DWORD)v17)
              {
                objc_msgSend(v8, "setFid:", *(_QWORD *)(a2 + 120), *(_QWORD *)(a2 + 128));
                objc_msgSend(v8, "setIsOpen:", 1);
                v17 = 0;
              }
            }
            objc_msgSend(v18, "smb_rq_done");
          }
          goto LABEL_102;
        }
        if (v25)
          v30 = v25 + 120;
        else
          v30 = 122;
        v31 = v30 & 7;
        if ((v30 & 7) != 0)
        {
          v32 = 8 - v31;
          mb_put_mem(v19, 0, (8 - v31), 3);
          v30 += v32;
          v29 = *(_QWORD *)a2;
        }
        *v21 = v30;
        if ((v29 & 0x10) != 0)
        {
          v35 = (_DWORD *)mb_reserve(v19, 4uLL);
          *v35 = 0;
          mb_put_uint16le(v19, 16);
          mb_put_uint16le(v19, 4);
          mb_put_uint16le(v19, 0);
          mb_put_uint16le(v19, 24);
          mb_put_uint32le(v19, 24);
          mb_put_uint32be(v19, 0x4141504Cu);
          mb_put_uint32le(v19, 0);
          mb_put_uint32le(v19, 1);
          mb_put_uint32le(v19, 0);
          mb_put_uint64le(v19, 7);
          mb_put_uint64le(v19, 31);
          v37 = *(_QWORD *)a2;
          v33 = 48;
          if ((*(_QWORD *)a2 & 0x20) == 0)
          {
            v36 = 48;
            if ((v37 & 4) != 0)
            {
LABEL_45:
              *v35 = v36;
              goto LABEL_47;
            }
LABEL_40:
            if ((v37 & 0x40) != 0)
            {
LABEL_48:
              *v35 = v36;
LABEL_49:
              if ((*(_BYTE *)(a2 + 233) & 1) != 0)
              {
                v38 = *(_DWORD *)(a2 + 244);
                v35 = (_DWORD *)mb_reserve(v19, 4uLL);
                *v35 = 0;
                mb_put_uint16le(v19, 16);
                mb_put_uint16le(v19, 4);
                mb_put_uint16le(v19, 0);
                mb_put_uint16le(v19, 24);
                mb_put_uint32le(v19, 32);
                mb_put_uint32be(v19, 0x44483251u);
                mb_put_uint32le(v19, 0);
                mb_put_uint32le(v19, v38);
                if ((*(_BYTE *)(a2 + 232) & 0x20) != 0)
                {
                  v40 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                  if (v40)
                    smb2_smb_create_cold_5(v40, v41, v42);
                  v39 = 2;
                }
                else
                {
                  v39 = 0;
                }
                mb_put_uint32le(v19, v39);
                mb_put_uint64le(v19, 0);
                mb_put_mem(v19, (char *)(a2 + 200), 0x10uLL, 0);
                v33 += 56;
                *(_QWORD *)(a2 + 232) |= 0x100uLL;
                v36 = 56;
              }
              else
              {
                v35 = (_DWORD *)mb_reserve(v19, 4uLL);
                *v35 = 0;
                mb_put_uint16le(v19, 16);
                mb_put_uint16le(v19, 4);
                mb_put_uint16le(v19, 0);
                mb_put_uint16le(v19, 24);
                mb_put_uint32le(v19, 16);
                mb_put_uint32be(v19, 0x44486E51u);
                mb_put_uint32le(v19, 0);
                mb_put_uint64le(v19, 0);
                mb_put_uint64le(v19, 0);
                v33 += 40;
                v36 = 40;
              }
            }
LABEL_57:
            if ((*(_BYTE *)a2 & 0x80) == 0)
            {
              v34 = v28;
              goto LABEL_68;
            }
            *v35 = v36;
LABEL_60:
            v43 = *(_QWORD *)(a2 + 232);
            v35 = (_DWORD *)mb_reserve(v19, 4uLL);
            *v35 = 0;
            mb_put_uint16le(v19, 16);
            mb_put_uint16le(v19, 4);
            mb_put_uint16le(v19, 0);
            mb_put_uint16le(v19, 24);
            if ((v43 & 0x100) != 0)
            {
              mb_put_uint32le(v19, 36);
              mb_put_uint32be(v19, 0x44483243u);
              mb_put_uint32le(v19, 0);
              mb_put_uint64le(v19, *(_QWORD *)(a2 + 216));
              mb_put_uint64le(v19, *(_QWORD *)(a2 + 224));
              mb_put_mem(v19, (char *)(a2 + 200), 0x10uLL, 0);
              if ((*(_BYTE *)(a2 + 232) & 0x40) != 0)
              {
                v45 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v45)
                  smb2_smb_create_cold_4(v45, v46, v47);
                v44 = 2;
              }
              else
              {
                v44 = 0;
              }
              mb_put_uint32le(v19, v44);
              mb_put_uint32le(v19, 0);
              v34 = v28;
              v33 += 64;
              v36 = 64;
            }
            else
            {
              mb_put_uint32le(v19, 16);
              mb_put_uint32be(v19, 0x44486E43u);
              mb_put_uint32le(v19, 0);
              mb_put_uint64le(v19, *(_QWORD *)(a2 + 216));
              mb_put_uint64le(v19, *(_QWORD *)(a2 + 224));
              v34 = v28;
              v33 += 40;
              v36 = 40;
            }
            goto LABEL_68;
          }
          *(_DWORD *)(a2 + 144) = 2;
          *v35 = 48;
          v33 = 88;
        }
        else
        {
          if ((v29 & 0x20) == 0)
          {
            v33 = 0;
            if ((v29 & 4) == 0)
            {
              if ((v29 & 0x40) == 0)
              {
                if ((v29 & 0x80) == 0)
                {
                  v34 = v28;
                  v35 = 0;
                  v36 = 0;
LABEL_68:
                  v48 = *(_QWORD *)a2;
                  if ((*(_QWORD *)a2 & 0x4C0) != 0)
                  {
                    if ((*(_DWORD *)(v34 + 552) & 0x28800) != 0 && (*(_BYTE *)(a2 + 232) & 0x60) != 0)
                    {
                      v49 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                      if (v49)
                        smb2_smb_create_cold_3(v49, v50, v51);
                    }
                    else
                    {
                      v52 = 240;
                      if ((v48 & 0x80) == 0)
                        v52 = 168;
                      v53 = *(_DWORD *)(a2 + v52);
                      if (v35)
                        *v35 = v36;
                      v54 = *(_QWORD *)(a2 + 232);
                      *(_DWORD *)mb_reserve(v19, 4uLL) = 0;
                      mb_put_uint16le(v19, 16);
                      mb_put_uint16le(v19, 4);
                      mb_put_uint16le(v19, 0);
                      mb_put_uint16le(v19, 24);
                      if (v54 & 0x100 | v48 & 0x400)
                      {
                        mb_put_uint32le(v19, 52);
                        mb_put_uint32be(v19, 0x52714C73u);
                        mb_put_uint32le(v19, 0);
                        mb_put_uint64le(v19, *(_QWORD *)(a2 + 152));
                        mb_put_uint64le(v19, *(_QWORD *)(a2 + 160));
                        mb_put_uint32le(v19, v53);
                        if (*(_QWORD *)(a2 + 176) && *(_QWORD *)(a2 + 184))
                        {
                          mb_put_uint32le(v19, 4);
                          mb_put_uint64le(v19, 0);
                          mb_put_uint64le(v19, *(_QWORD *)(a2 + 176));
                          v55 = *(_QWORD *)(a2 + 184);
                        }
                        else
                        {
                          mb_put_uint32le(v19, 0);
                          mb_put_uint64le(v19, 0);
                          mb_put_uint64le(v19, 0);
                          v55 = 0;
                        }
                        mb_put_uint64le(v19, v55);
                        *(_WORD *)(a2 + 192) = 0;
                        mb_put_uint16le(v19, 0);
                        mb_put_uint16le(v19, 0);
                        mb_put_uint32le(v19, 0);
                        v33 += 80;
                        *(_QWORD *)(a2 + 232) |= 0x200uLL;
                      }
                      else
                      {
                        mb_put_uint32le(v19, 32);
                        mb_put_uint32be(v19, 0x52714C73u);
                        mb_put_uint32le(v19, 0);
                        mb_put_uint64le(v19, *(_QWORD *)(a2 + 152));
                        mb_put_uint64le(v19, *(_QWORD *)(a2 + 160));
                        mb_put_uint32le(v19, v53);
                        mb_put_uint32le(v19, 0);
                        mb_put_uint64le(v19, 0);
                        v33 += 56;
                      }
                    }
                  }
                  *v64 = v33;
                  goto LABEL_85;
                }
                goto LABEL_60;
              }
              goto LABEL_49;
            }
            v36 = 0;
LABEL_47:
            v35 = (_DWORD *)mb_reserve(v19, 4uLL);
            *v35 = 0;
            mb_put_uint16le(v19, 16);
            mb_put_uint16le(v19, 4);
            mb_put_uint16le(v19, 0);
            mb_put_uint16le(v19, 0);
            mb_put_uint32le(v19, 0);
            mb_put_uint32be(v19, 0x4D784163u);
            mb_put_uint32le(v19, 0);
            v33 += 24;
            if ((*(_QWORD *)a2 & 0x40) != 0)
              goto LABEL_48;
            goto LABEL_57;
          }
          *(_DWORD *)(a2 + 144) = 2;
          v33 = 40;
        }
        v35 = (_DWORD *)mb_reserve(v19, 4uLL);
        *v35 = 0;
        mb_put_uint16le(v19, 16);
        mb_put_uint16le(v19, 4);
        mb_put_uint16le(v19, 0);
        mb_put_uint16le(v19, 24);
        mb_put_uint32le(v19, 16);
        mb_put_uint32be(v19, 0x4141504Cu);
        mb_put_uint32le(v19, 0);
        mb_put_uint32le(v19, 2);
        mb_put_uint32le(v19, 0);
        mb_put_uint64le(v19, *(_QWORD *)(a2 + 136));
        v37 = *(_QWORD *)a2;
        v36 = 40;
        if ((*(_QWORD *)a2 & 4) != 0)
          goto LABEL_45;
        goto LABEL_40;
      }
    }
    if ((*(_BYTE *)a2 & 8) != 0)
    {
      mb_put_mem(v19, cstring_len, HIDWORD(v75), 0);
      v25 = WORD2(v75);
      *v20 = WORD2(v75);
      if ((*(_BYTE *)(a2 + 1) & 8) == 0)
        goto LABEL_21;
      v26 = (_DWORD *)objc_msgSend(v18, "sr_flagsp");
      *v26 |= 0x10000000u;
    }
    else
    {
      smb2_rq_bstart(v18, (uint64_t)v20);
      v17 = smb2fs_fullpath(v19, cstring_len, HIDWORD(v75), v13, v75, 32);
      if ((_DWORD)v17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_create_cold_6();
        if (v18)
          objc_msgSend(v18, "smb_rq_done");
        if (v9)
          goto LABEL_5;
        goto LABEL_102;
      }
      smb_rq_bend(v18);
    }
    v25 = (unsigned __int16)*v20;
LABEL_21:
    if (v25)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (v18)
    objc_msgSend(v18, "smb_rq_done");
  if (v9)
LABEL_5:
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v17);
LABEL_102:
  _Block_object_dispose(&v76, 8);

  return v17;
}

void sub_23029F590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void piston_resolveID(void *a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id v23;
  void (**v24)(id, uint64_t);
  uint64_t v25;
  int v26;

  v9 = a1;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "sock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v16)
    {
      piston_resolveID_cold_1(v16, v17, v18);
      if (!v11)
        goto LABEL_10;
    }
    else if (!v11)
    {
      goto LABEL_10;
    }
    v11[2](v11, 57);
    goto LABEL_10;
  }
  if ((*(_BYTE *)(objc_msgSend(v9, "getSessionPtr") + 592) & 1) != 0)
  {
    objc_msgSend(v9, "sock");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "signing_queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __piston_resolveID_block_invoke;
    block[3] = &unk_24FE015A0;
    v26 = a2;
    v22 = v9;
    v25 = a3;
    v23 = v10;
    v24 = v11;
    dispatch_async(v20, block);

    goto LABEL_10;
  }
  v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v13)
  {
    piston_resolveID_cold_2(v13, v14, v15);
    if (!v11)
      goto LABEL_10;
    goto LABEL_5;
  }
  if (v11)
LABEL_5:
    v11[2](v11, 45);
LABEL_10:

}

void __piston_resolveID_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t fid;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "getShare:", *(unsigned int *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[SMBNode init:]([SMBNode alloc], "init:", *(_QWORD *)(a1 + 32));
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, "commonInit:onShareID:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64));
      if ((_DWORD)v5)
      {
        fid = v5;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __piston_resolveID_block_invoke_cold_5();
      }
      else
      {
        fid = smb2_smb_create_fid(v4, 0, 0, 1048705, 2, 7, 1, 33, *(_OWORD **)(a1 + 56), *(void **)(a1 + 40), 0);
        if ((_DWORD)fid)
        {
          if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __piston_resolveID_block_invoke_cold_4();
        }
        else if (smb2_smb_close_fid(v4, 0, 0) && piston_log_level)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __piston_resolveID_block_invoke_cold_3();
          fid = 0;
        }
      }
    }
    else
    {
      v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v7)
        __piston_resolveID_block_invoke_cold_2(v7, v8, v9);
      v4 = 0;
      fid = 12;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __piston_resolveID_block_invoke_cold_1();
    v4 = 0;
    fid = 22;
  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, fid);

}

uint64_t smb2_smb_create_fid(void *a1, void *a2, void *a3, int a4, int a5, int a6, int a7, uint64_t a8, _OWORD *a9, void *a10, _QWORD *a11)
{
  id v16;
  id v17;
  id v18;
  _OWORD *v19;
  id v20;
  void *v21;
  int options;
  uint64_t v23;
  _OWORD *v25;
  int v26;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[15];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v17 = a3;
  v18 = a10;
  v36 = 0;
  memset(&v35[1], 0, 224);
  if (a9)
    v19 = a9;
  else
    v19 = v35;
  v35[0] = 0uLL;
  v20 = a2;
  objc_msgSend(v16, "pd");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  options = piston_get_create_options(v21, objc_msgSend(v16, "shareID"), v20, 0, 0, a5, 0, 0);

  *(_QWORD *)v19 = a8;
  *((_BYTE *)v19 + 8) = 0;
  *((_DWORD *)v19 + 3) = 2;
  *((_DWORD *)v19 + 4) = a4;
  *((_DWORD *)v19 + 5) = 128;
  *((_DWORD *)v19 + 6) = a6;
  *((_DWORD *)v19 + 7) = a7;
  *((_DWORD *)v19 + 8) = options;
  objc_msgSend(v16, "setName:", v20);

  if (v17)
    objc_msgSend(v16, "setStreamName:", v17);
  v23 = smb2_smb_create(v16, (uint64_t)v19, v18, a11, 0);
  if ((_DWORD)v23 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v25 = v35;
    if (a9)
      v25 = a9;
    v26 = *((_DWORD *)v25 + 13);
    *(_DWORD *)buf = 136315650;
    v30 = "smb2_smb_create_fid";
    v31 = 1024;
    v32 = v23;
    v33 = 1024;
    v34 = v26;
    _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: smb2_smb_create failed %d ntstatus 0x%x\n", buf, 0x18u);
  }

  return v23;
}

uint64_t smb2_smb_close_fid(void *a1, _DWORD *a2, _QWORD *a3)
{
  _DWORD *v3;
  uint64_t v4;
  BOOL v5;
  _OWORD v7[4];

  memset(v7, 0, sizeof(v7));
  if (a2)
    v3 = a2;
  else
    v3 = v7;
  v4 = smb2_smb_close(a1, 0, v3, a3, 0);
  if ((_DWORD)v4)
    v5 = piston_log_level == 0;
  else
    v5 = 1;
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    smb2_smb_close_fid_cold_1();
  return v4;
}

uint64_t smb2_smb_parse_close(_QWORD *a1, char a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;

  v11 = 0;
  v10 = 0;
  v9 = 0;
  v8 = 0;
  v7 = 0;
  result = md_get_uint16le(a1, &v9);
  if (!(_DWORD)result)
  {
    if (v9 == 60)
    {
      result = md_get_uint16le(a1, &v11);
      if (!(_DWORD)result)
      {
        if ((a2 & 1) != 0)
        {
          if ((v11 & 1) == 0)
          {
            result = 0;
            *(_DWORD *)(a3 + 56) = 0;
            *(_OWORD *)(a3 + 40) = 0u;
            *(_OWORD *)(a3 + 24) = 0u;
            *(_OWORD *)(a3 + 8) = 0u;
            return result;
          }
        }
        else if ((v11 & 1) == 0)
        {
          return 0;
        }
        result = md_get_uint32le(a1, &v10);
        if (!(_DWORD)result)
        {
          result = md_get_uint64le(a1, &v7);
          if (!(_DWORD)result)
          {
            *(_QWORD *)(a3 + 8) = v7;
            result = md_get_uint64le(a1, &v7);
            if (!(_DWORD)result)
            {
              *(_QWORD *)(a3 + 16) = v7;
              result = md_get_uint64le(a1, &v7);
              if (!(_DWORD)result)
              {
                *(_QWORD *)(a3 + 24) = v7;
                result = md_get_uint64le(a1, &v7);
                if (!(_DWORD)result)
                {
                  *(_QWORD *)(a3 + 32) = v7;
                  result = md_get_uint64le(a1, &v7);
                  if (!(_DWORD)result)
                  {
                    *(_QWORD *)(a3 + 40) = v7;
                    result = md_get_uint64le(a1, &v7);
                    if (!(_DWORD)result)
                    {
                      *(_QWORD *)(a3 + 48) = v7;
                      result = md_get_uint32le(a1, &v8);
                      if (!(_DWORD)result)
                        *(_DWORD *)(a3 + 56) = v8;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_close_cold_1();
      return 72;
    }
  }
  return result;
}

void __smb2_smb_close_block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 48));
  v5 = (id *)(a1 + 32);
  **(_DWORD **)(a1 + 64) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_close_block_invoke_cold_1((id *)(a1 + 32));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    a2 = smb2_smb_parse_close(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_WORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
    if (!(_DWORD)a2)
      objc_msgSend(*(id *)(a1 + 40), "setIsOpen:", 0);
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, a2);

}

uint64_t smb2_smb_parse_create(void *a1, __n128 *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t uint16le;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  __int16 v22;

  v7 = a1;
  v8 = a4;
  v22 = 0;
  v21 = 0;
  v20 = 0;
  v18 = 0;
  v19 = 0;
  v17 = 0uLL;
  objc_msgSend(v7, "pd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "getSessionPtr");

  uint16le = md_get_uint16le(a2, &v22);
  if (!(_DWORD)uint16le)
  {
    if (v22 == 89)
    {
      uint16le = md_get_uint8(a2, &v21);
      if (!(_DWORD)uint16le)
      {
        *(_BYTE *)(a3 + 56) = v21;
        uint16le = md_get_uint8(a2, &v21);
        if (!(_DWORD)uint16le)
        {
          if ((*(_DWORD *)(v10 + 552) & 0x28800) != 0)
            *(_BYTE *)(a3 + 57) = v21;
          uint16le = md_get_uint32le(a2, &v20);
          if (!(_DWORD)uint16le)
          {
            *(_DWORD *)(a3 + 60) = v20;
            uint16le = md_get_uint64le(a2, &v19);
            if (!(_DWORD)uint16le)
            {
              *(_QWORD *)(a3 + 64) = v19;
              uint16le = md_get_uint64le(a2, &v19);
              if (!(_DWORD)uint16le)
              {
                *(_QWORD *)(a3 + 72) = v19;
                uint16le = md_get_uint64le(a2, &v19);
                if (!(_DWORD)uint16le)
                {
                  *(_QWORD *)(a3 + 80) = v19;
                  uint16le = md_get_uint64le(a2, &v19);
                  if (!(_DWORD)uint16le)
                  {
                    *(_QWORD *)(a3 + 88) = v19;
                    uint16le = md_get_uint64le(a2, &v19);
                    if (!(_DWORD)uint16le)
                    {
                      *(_QWORD *)(a3 + 96) = v19;
                      uint16le = md_get_uint64le(a2, &v19);
                      if (!(_DWORD)uint16le)
                      {
                        *(_QWORD *)(a3 + 104) = v19;
                        uint16le = md_get_uint32le(a2, &v20);
                        if (!(_DWORD)uint16le)
                        {
                          *(_DWORD *)(a3 + 112) = v20;
                          uint16le = md_get_uint32le(a2, &v20);
                          if (!(_DWORD)uint16le)
                          {
                            uint16le = md_get_uint64le(a2, &v17);
                            if (!(_DWORD)uint16le)
                            {
                              uint16le = md_get_uint64le(a2, (_QWORD *)&v17 + 1);
                              if (!(_DWORD)uint16le)
                              {
                                uint16le = md_get_uint32le(a2, (_DWORD *)&v18 + 1);
                                if (!(_DWORD)uint16le)
                                {
                                  uint16le = md_get_uint32le(a2, &v18);
                                  if (!(_DWORD)uint16le)
                                  {
                                    if (!(_DWORD)v18
                                      || (uint16le = smb2_smb_parse_create_contexts(v7, a2, (_DWORD *)&v18 + 1, a3, v8),
                                          !(_DWORD)uint16le))
                                    {
                                      if ((*(_BYTE *)a3 & 0x10) != 0)
                                      {
                                        v12 = *(_QWORD *)(v10 + 560);
                                        if ((v12 & 0x40) == 0)
                                        {
                                          if (piston_log_level)
                                          {
                                            v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                                            if (v13)
                                              smb2_smb_parse_create_cold_1(v13, v14, v15);
                                            v12 = *(_QWORD *)(v10 + 560);
                                          }
                                          *(_QWORD *)(v10 + 560) = v12 | 0x80;
                                        }
                                      }
                                      uint16le = 0;
                                      *(_OWORD *)(a3 + 120) = v17;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_create_cold_2();
      uint16le = 72;
    }
  }

  return uint16le;
}

void __smb2_smb_create_block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 56));
  v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(_QWORD *)(a1 + 72) + 52) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_create_block_invoke_cold_1((id *)(a1 + 32));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    a2 = smb2_smb_parse_create(*(void **)(a1 + 40), *(__n128 **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 72), *(void **)(a1 + 48));
    if (!(_DWORD)a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "setFid:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 120), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 128));
      objc_msgSend(*(id *)(a1 + 40), "setIsOpen:", 1);
    }
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, a2);

}

uint64_t smb2_smb_parse_create_contexts(void *a1, __n128 *a2, _DWORD *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t mem;
  void *v16;
  uint64_t uint32le;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  unsigned int v25;
  char v26;
  void *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  __n128 v54[2];
  unsigned int v55;
  char *__s;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  __int16 v61;
  int v62;
  unsigned int v63;
  uint8_t v64[4];
  uint64_t v65;
  uint8_t v66[4];
  uint64_t v67;
  uint8_t v68[4];
  uint64_t v69;
  uint8_t v70[4];
  uint64_t v71;
  uint8_t v72[4];
  uint64_t v73;
  uint8_t v74[4];
  uint64_t v75;
  uint8_t v76[4];
  uint64_t v77;
  uint8_t v78[4];
  uint64_t v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  _BYTE v83[10];
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a5;
  v63 = 0;
  v62 = 0;
  v61 = 0;
  v60 = 0;
  v58 = 0;
  v59 = 0;
  __s = 0;
  v57 = 0;
  v55 = 0;
  memset(v54, 0, sizeof(v54));
  v52 = 0;
  v53 = 0;
  v51 = 0;
  v50 = 0;
  v49 = 0;
  objc_msgSend(v9, "pd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (_QWORD *)objc_msgSend(v11, "getSessionPtr");

  if (!*a3 || (v13 = (*a3 - 152), *a3 = v13, v14 = md_get_mem(a2, 0, v13, 0), !(_DWORD)v14))
  {
    v16 = 0;
    while (1)
    {
      md_shadow_copy(a2, v54);
      uint32le = md_get_uint32le(v54, &v63);
      if ((_DWORD)uint32le
        || (uint32le = md_get_uint16le(v54, (_WORD *)&v62 + 1), (_DWORD)uint32le)
        || (uint32le = md_get_uint16le(v54, &v62), (_DWORD)uint32le))
      {
LABEL_144:
        mem = uint32le;
        goto LABEL_145;
      }
      if ((unsigned __int16)v62 != 4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_parse_create_contexts_cold_20();
        goto LABEL_148;
      }
      uint32le = md_get_uint16le(v54, 0);
      if ((_DWORD)uint32le)
        goto LABEL_144;
      uint32le = md_get_uint16le(v54, &v61);
      if ((_DWORD)uint32le)
        goto LABEL_144;
      uint32le = md_get_uint32le(v54, &v60);
      if ((_DWORD)uint32le)
        goto LABEL_144;
      uint32le = md_get_uint32be(v54, (_DWORD *)&v59 + 1);
      if ((_DWORD)uint32le)
        goto LABEL_144;
      uint32le = md_get_uint32le(v54, 0);
      if ((_DWORD)uint32le)
        goto LABEL_144;
      if (SHIDWORD(v59) <= 1145597506)
      {
        switch(HIDWORD(v59))
        {
          case 0x4141504C:
            if (v60 <= 7)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_create_contexts_cold_13();
              goto LABEL_148;
            }
            uint32le = md_get_uint32le(v54, &v58);
            if ((_DWORD)uint32le)
              goto LABEL_144;
            uint32le = md_get_uint32le(v54, 0);
            if ((_DWORD)uint32le)
              goto LABEL_144;
            if ((_DWORD)v58 == 2)
            {
              if (!v10)
              {
                if (piston_log_level)
                {
                  v46 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                  if (v46)
                    smb2_smb_parse_create_contexts_cold_18(v46, v47, v48);
                }
                goto LABEL_148;
              }
              if (v60 <= 0xF)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  smb2_smb_parse_create_contexts_cold_19();
                goto LABEL_148;
              }
              uint32le = md_get_uint32le(v54, &v55);
              if ((_DWORD)uint32le)
                goto LABEL_144;
              *(_DWORD *)(a4 + 144) = piston_ntstatus_to_errno(v55);
              smb2_smb_parse_create_str(v54, 1, (UInt8 **)&__s);
              if (__s)
              {
                v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", __s, 4);

                objc_msgSend(v10, "setString:", v36);
                free(__s);
                __s = 0;
                v16 = (void *)v36;
              }
            }
            else
            {
              if ((_DWORD)v58 != 1)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  smb2_smb_parse_create_contexts_cold_14();
                goto LABEL_148;
              }
              if (v60 <= 0xF)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  smb2_smb_parse_create_contexts_cold_15();
                goto LABEL_148;
              }
              uint32le = md_get_uint64le(v54, &v57);
              if ((_DWORD)uint32le)
                goto LABEL_144;
              if ((v57 & 1) != 0)
                v25 = 24;
              else
                v25 = 16;
              if ((v57 & 2) != 0)
                v25 += 8;
              if ((v57 & 4) != 0)
                v25 += 8;
              if (v60 < v25)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  smb2_smb_parse_create_contexts_cold_16();
                goto LABEL_148;
              }
              if ((v57 & 1) != 0)
              {
                uint32le = md_get_uint64le(v54, v12 + 73);
                if ((_DWORD)uint32le)
                  goto LABEL_144;
              }
              if ((v12[73] & 2) != 0)
                v12[70] |= 0x800uLL;
              v26 = v57;
              if ((v57 & 2) != 0)
              {
                uint32le = md_get_uint64le(v54, v12 + 74);
                if ((_DWORD)uint32le)
                  goto LABEL_144;
                v26 = v57;
              }
              if ((v26 & 4) != 0)
              {
                uint32le = md_get_uint32le(v54, 0);
                if ((_DWORD)uint32le)
                  goto LABEL_144;
                smb2_smb_parse_create_str(v54, 0, (UInt8 **)&__s);
                v27 = (void *)v12[75];
                if (v27)
                  free(v27);
                v28 = __s;
                if (__s && strlen(__s) >= 0x1FE)
                  __s[509] = 0;
                v12[75] = v28;
              }
              if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_create_contexts_cold_17(v64, &v65, v29);
              v12[70] |= 0x40uLL;
            }
            break;
          case 0x44483243:
            break;
          case 0x44483251:
            if (v60 != 8)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_create_contexts_cold_12();
              goto LABEL_148;
            }
            uint32le = md_get_uint32le(v54, (_DWORD *)&v49 + 1);
            if ((_DWORD)uint32le)
              goto LABEL_144;
            v20 = *(_DWORD *)(a4 + 244);
            v21 = HIDWORD(v49);
            if (v20 && v20 != HIDWORD(v49))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                v42 = *(_DWORD *)(a4 + 244);
                *(_DWORD *)buf = 136315650;
                v81 = "smb2_smb_parse_create_contexts";
                v82 = 1024;
                *(_DWORD *)v83 = HIDWORD(v49);
                *(_WORD *)&v83[4] = 1024;
                *(_DWORD *)&v83[6] = v42;
                _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Granted Dur Handle V2 timeout %d does not match requested %d \n", buf, 0x18u);
              }
              v21 = HIDWORD(v49);
            }
            *(_DWORD *)(a4 + 244) = v21;
            uint32le = md_get_uint32le(v54, &v51);
            if ((_DWORD)uint32le)
              goto LABEL_144;
            v18 = *(_QWORD *)(a4 + 232);
            if ((v18 & 0x100) == 0)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_create_contexts_cold_11(v72, &v73, v22);
              v18 = *(_QWORD *)(a4 + 232) | 0x800;
              *(_QWORD *)(a4 + 232) = v18;
            }
            v23 = v51;
            if ((v18 & 0x20) != 0)
            {
              v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if ((v23 & 2) != 0)
              {
                if (v34)
                  smb2_smb_parse_create_contexts_cold_10(v70, &v71, v35);
                v24 = *(_QWORD *)(a4 + 232) & 0xFFFFFFFFFFFFFF5FLL | 0x80;
                goto LABEL_139;
              }
              if (v34)
                smb2_smb_parse_create_contexts_cold_9(v68, &v69, v35);
            }
            else
            {
              if ((v51 & 2) == 0)
                goto LABEL_41;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_create_contexts_cold_8(v66, &v67, v39);
            }
            break;
          default:
            goto LABEL_150;
        }
      }
      else
      {
        if (SHIDWORD(v59) <= 1299726690)
        {
          if (HIDWORD(v59) == 1145597507)
            goto LABEL_140;
          if (HIDWORD(v59) != 1145597521)
            goto LABEL_150;
          if (v60 != 8)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              smb2_smb_parse_create_contexts_cold_7();
LABEL_148:
            mem = 72;
            goto LABEL_145;
          }
          uint32le = md_get_uint64le(v54, 0);
          if ((_DWORD)uint32le)
            goto LABEL_144;
          v18 = *(_QWORD *)(a4 + 232);
          if ((v18 & 0x100) != 0)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              smb2_smb_parse_create_contexts_cold_6(v74, &v75, v19);
            v18 = *(_QWORD *)(a4 + 232) | 0x800;
          }
LABEL_41:
          v24 = v18 & 0xFFFFFFFFFFFFFFFALL | 4;
LABEL_139:
          *(_QWORD *)(a4 + 232) = v24;
          goto LABEL_140;
        }
        if (HIDWORD(v59) == 1383156851)
        {
          if (v60 != 32 && v60 != 52)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              smb2_smb_parse_create_contexts_cold_3();
            goto LABEL_148;
          }
          uint32le = md_get_uint64le(v54, &v53);
          if ((_DWORD)uint32le)
            goto LABEL_144;
          uint32le = md_get_uint64le(v54, &v52);
          if ((_DWORD)uint32le)
            goto LABEL_144;
          if (v53 != *(_QWORD *)(a4 + 152) || v52 != *(_QWORD *)(a4 + 160))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v40 = *(_QWORD *)(a4 + 152);
              v41 = *(_QWORD *)(a4 + 160);
              *(_DWORD *)buf = 136316162;
              v81 = "smb2_smb_parse_create_contexts";
              v82 = 2048;
              *(_QWORD *)v83 = v40;
              *(_WORD *)&v83[8] = 2048;
              v84 = v41;
              v85 = 2048;
              v86 = v53;
              v87 = 2048;
              v88 = v52;
              _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Lease key mismatch: 0x%llx:0x%llx != 0x%llx:0x%llx\n", buf, 0x34u);
            }
            v30 = v52;
            *(_QWORD *)(a4 + 152) = v53;
            *(_QWORD *)(a4 + 160) = v30;
          }
          uint32le = md_get_uint32le(v54, &v49);
          if ((_DWORD)uint32le)
            goto LABEL_144;
          uint32le = md_get_uint32le(v54, &v51);
          if ((_DWORD)uint32le)
            goto LABEL_144;
          if ((v51 & 4) != 0)
            *(_QWORD *)(a4 + 232) |= 0x10uLL;
          uint32le = md_get_uint64le(v54, 0);
          if ((_DWORD)uint32le)
            goto LABEL_144;
          if (v60 == 52)
          {
            uint32le = md_get_uint64le(v54, &v53);
            if ((_DWORD)uint32le)
              goto LABEL_144;
            uint32le = md_get_uint64le(v54, &v52);
            if ((_DWORD)uint32le)
              goto LABEL_144;
            if ((*(_BYTE *)(a4 + 232) & 0x10) != 0 && (v53 != *(_QWORD *)(a4 + 176) || v52 != *(_QWORD *)(a4 + 184)))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                v43 = *(_QWORD *)(a4 + 176);
                v44 = *(_QWORD *)(a4 + 184);
                *(_DWORD *)buf = 136316162;
                v81 = "smb2_smb_parse_create_contexts";
                v82 = 2048;
                *(_QWORD *)v83 = v43;
                *(_WORD *)&v83[8] = 2048;
                v84 = v44;
                v85 = 2048;
                v86 = v53;
                v87 = 2048;
                v88 = v52;
                _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Parent Lease key mismatch: 0x%llx:0x%llx != 0x%llx:0x%llx\n", buf, 0x34u);
              }
              v31 = v52;
              *(_QWORD *)(a4 + 176) = v53;
              *(_QWORD *)(a4 + 184) = v31;
            }
            uint32le = md_get_uint16le(v54, &v50);
            if ((_DWORD)uint32le)
              goto LABEL_144;
            *(_WORD *)(a4 + 192) = v50;
            *(_DWORD *)(a4 + 240) = v49;
            uint32le = md_get_uint16le(v54, 0);
            if ((_DWORD)uint32le)
              goto LABEL_144;
            v32 = *(_QWORD *)(a4 + 232);
            if ((v32 & 0x200) == 0)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_create_contexts_cold_4(v78, &v79, v33);
              v32 = *(_QWORD *)(a4 + 232) | 0x800;
            }
            if ((v32 & 0x40) != 0)
            {
              v32 = v32 & 0xFFFFFFFFFFFFFF3FLL | 0x80;
            }
            else if ((v32 & 2) != 0)
            {
              v32 = v32 & 0xFFFFFFFFFFFFFFF9 | 4;
            }
          }
          else
          {
            *(_DWORD *)(a4 + 240) = v49;
            v32 = *(_QWORD *)(a4 + 232);
            if ((v32 & 0x200) != 0)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_create_contexts_cold_5(v76, &v77, v37);
              v32 = *(_QWORD *)(a4 + 232) | 0x800;
            }
          }
          v24 = v32 | 8;
          goto LABEL_139;
        }
        if (HIDWORD(v59) != 1299726691)
        {
LABEL_150:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_parse_create_contexts_cold_1();
          goto LABEL_148;
        }
        if (v60 != 8)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_parse_create_contexts_cold_2();
          goto LABEL_148;
        }
        uint32le = md_get_uint32le(v54, &v59);
        if ((_DWORD)uint32le)
          goto LABEL_144;
        if ((_DWORD)v59)
        {
          if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v81 = "smb2_smb_parse_create_contexts";
            v82 = 1024;
            *(_DWORD *)v83 = v59;
            _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: MxAc Query Status failed: 0x%x\n", buf, 0x12u);
          }
        }
        else
        {
          uint32le = md_get_uint32le(v54, (_DWORD *)&v58 + 1);
          if ((_DWORD)uint32le)
            goto LABEL_144;
          v38 = HIDWORD(v58);
          if ((*(_BYTE *)(a4 + 1) & 1) != 0)
          {
            v38 = HIDWORD(v58) | 0x10000;
            HIDWORD(v58) |= 0x10000u;
          }
          *(_DWORD *)(a4 + 116) = v38;
        }
      }
LABEL_140:
      if (!v63)
      {
        mem = 0;
        goto LABEL_145;
      }
      mem = md_get_mem(a2, 0, v63, 0);
      if ((_DWORD)mem || !v63)
        goto LABEL_145;
    }
  }
  mem = v14;
  v16 = 0;
LABEL_145:

  return mem;
}

void smb2_smb_parse_create_str(_QWORD *a1, int a2, UInt8 **a3)
{
  unsigned int v6;
  char *v7;
  char *v8;
  size_t v9;
  UInt8 *v10;
  UInt8 *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  unint64_t v16;
  size_t size;

  LODWORD(size) = 0;
  if (md_get_uint32le(a1, &size))
    return;
  if (a2)
    v6 = 2048;
  else
    v6 = 510;
  if (!(_DWORD)size)
  {
    *a3 = 0;
    return;
  }
  if (size > v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_create_str_cold_1();
    return;
  }
  v7 = (char *)malloc_type_malloc(size, 0xF8B7D3F1uLL);
  if (v7)
  {
    v8 = v7;
    if (md_get_mem(a1, v7, size, 0))
    {
LABEL_26:
      free(v8);
      return;
    }
    v9 = size;
    v16 = size;
    if (a2)
    {
      v15 = 9 * size + 1;
      v10 = (UInt8 *)malloc_type_malloc(v15, 0x1C935430uLL);
      v11 = v10;
      if (!v10)
        goto LABEL_25;
      bzero(v10, 9 * v9 + 1);
      if (!smb_convert_network_to_path(v8, v9, v11, (CFIndex *)&v15, 92, 32, 1))
        goto LABEL_25;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_create_str_cold_4();
      free(v11);
    }
    else
    {
      v11 = smbfs_ntwrkname_tolocal((const UInt8 *)v8, &v16, 1);
      if (v11)
      {
LABEL_25:
        *a3 = v11;
        goto LABEL_26;
      }
      v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v12)
        smb2_smb_parse_create_str_cold_3(v12, v13, v14);
    }
    v11 = 0;
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    smb2_smb_parse_create_str_cold_2();
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7_1@<X0>(uint64_t result@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  *(_QWORD *)(result + 4) = a4;
  *(_WORD *)(result + 12) = 1024;
  *(_DWORD *)(result + 14) = a2;
  *(_WORD *)(result + 18) = 1024;
  *(_DWORD *)(result + 20) = a3;
  return result;
}

uint64_t piston_hexdump(const char *a1, const char *a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4;
  unsigned __int8 *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int v17;
  int v18;
  char __str[512];
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  result = printf("%s: %s %p length %ld \n", a1, a2, a3, a4);
  if (v5)
  {
    if (v4 >= 1)
    {
      v7 = 0;
      v8 = v4;
      v18 = v4;
      do
      {
        v9 = snprintf(__str, 0x200uLL, "%6.6x - ", v7);
        v10 = 0;
        v11 = &__str[v9];
        v12 = (char *)(512 - v9);
        do
        {
          if (v7 + v10 >= v8)
            v13 = snprintf(v11, (size_t)v12, "   ");
          else
            v13 = snprintf(v11, (size_t)v12, "%2.2x ");
          v11 += v13;
          v12 = (char *)(&__str[(_QWORD)v12] - v11);
          ++v10;
        }
        while (v10 != 16);
        v14 = 0;
        v15 = &v11[snprintf(v11, (size_t)v12, " \"")];
        v16 = (char *)(&__str[(_QWORD)v12] - v15);
        do
        {
          if (v7 + v14 < v8)
          {
            if (v5[v14] - 26 > 0x63)
              v17 = snprintf(v15, (size_t)v16, ".");
            else
              v17 = snprintf(v15, (size_t)v16, "%c");
            v15 += v17;
            v16 = (char *)(&__str[(_QWORD)v16] - v15);
          }
          ++v14;
        }
        while (v14 != 16);
        printf("%s \n", __str);
        v7 += 16;
        v5 += 16;
      }
      while ((int)v7 < v18);
    }
    return puts(" ");
  }
  return result;
}

void piston_lease_break_ack(void *a1, unsigned int *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "sock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      piston_lease_break_ack_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      if (!v6)
        goto LABEL_8;
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    v6[2](v6, 57);
    goto LABEL_8;
  }
  if (smb2_smb_lease_break_ack(v5, a2, v6) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    piston_lease_break_ack_cold_2();
LABEL_8:

}

uint64_t smb2_smb_lease_break_ack(void *a1, unsigned int *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void (**v13)(id, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  void (**v20)(id, uint64_t);
  unsigned int *v21;
  id v22;

  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "getShare:", *a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      smb2_smb_lease_break_ack_cold_1();
      if (v6)
        goto LABEL_9;
    }
    else if (v6)
    {
LABEL_9:
      v9 = 22;
      v6[2](v6, 22);
      v11 = 0;
      goto LABEL_19;
    }
    v11 = 0;
    v9 = 22;
    goto LABEL_19;
  }
  v22 = 0;
  v9 = smb2_rq_alloc(18, objc_msgSend(v7, "tree_id"), objc_msgSend(v7, "isEncrypted"), 0, v5, &v22);
  v10 = v22;
  v11 = v10;
  if (!(_DWORD)v9)
  {
    v12 = objc_msgSend(v10, "smb_rq_getrequest");
    mb_put_uint16le(v12, 36);
    mb_put_uint16le(v12, 0);
    mb_put_uint32le(v12, 0);
    mb_put_uint64le(v12, *((_QWORD *)a2 + 1));
    mb_put_uint64le(v12, *((_QWORD *)a2 + 2));
    mb_put_uint32le(v12, a2[6]);
    mb_put_uint64le(v12, 0);
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __smb2_smb_lease_break_ack_block_invoke;
    v18 = &unk_24FE01398;
    v13 = v6;
    v20 = v13;
    v21 = a2;
    v11 = v11;
    v19 = v11;
    v9 = smb_rq_simple_block(v5, v11, &v15);
    if (!(_DWORD)v9)
    {
LABEL_16:

      goto LABEL_19;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      smb2_smb_lease_break_ack_cold_2();
      if (!v11)
      {
LABEL_14:
        if (v13)
          v13[2](v13, v9);
        goto LABEL_16;
      }
    }
    else if (!v11)
    {
      goto LABEL_14;
    }
    objc_msgSend(v11, "smb_rq_done", v15, v16, v17, v18);
    goto LABEL_14;
  }
  if (v10)
    objc_msgSend(v10, "smb_rq_done");
  if (v6)
    v6[2](v6, v9);
LABEL_19:

  return v9;
}

void __smb2_smb_lease_break_ack_block_invoke(uint64_t a1, uint64_t uint16le)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  int v14;

  v13 = 0;
  v14 = 0;
  v12 = 0;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 40));
  v5 = (id *)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  v8 = *(_QWORD *)(a1 + 48);
  v7 = a1 + 48;
  *(_DWORD *)(v8 + 28) = v6;
  if ((_DWORD)uint16le)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_lease_break_ack_block_invoke_cold_3(v5, uint16le);
    goto LABEL_17;
  }
  v9 = (_QWORD *)objc_msgSend(*v5, "smb_rq_getreply");
  uint16le = md_get_uint16le(v9, (_WORD *)&v14 + 1);
  if ((_DWORD)uint16le)
    goto LABEL_17;
  if (HIWORD(v14) != 36)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_lease_break_ack_block_invoke_cold_2();
    goto LABEL_16;
  }
  uint16le = md_get_uint16le(v9, &v14);
  if ((_DWORD)uint16le)
    goto LABEL_17;
  uint16le = md_get_uint32le(v9, 0);
  if ((_DWORD)uint16le)
    goto LABEL_17;
  uint16le = md_get_uint64le(v9, &v12);
  if ((_DWORD)uint16le)
    goto LABEL_17;
  *(_QWORD *)(*(_QWORD *)v7 + 32) = v12;
  uint16le = md_get_uint64le(v9, &v12);
  if ((_DWORD)uint16le)
    goto LABEL_17;
  v10 = v12;
  v11 = *(_QWORD **)v7;
  v11[5] = v12;
  if (v11[1] != v11[4] || v11[2] != v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_lease_break_ack_block_invoke_cold_1(v7);
LABEL_16:
    uint16le = 72;
    goto LABEL_17;
  }
  uint16le = md_get_uint32le(v9, &v13);
  if (!(_DWORD)uint16le)
  {
    *(_DWORD *)(*(_QWORD *)v7 + 48) = v13;
    uint16le = md_get_uint64le(v9, 0);
  }
LABEL_17:
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, uint16le);

}

uint64_t smb2_smb_parse_lease_break(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  SMBPistonEvents *v6;
  SMBPistonEvents *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t uint16le;
  __int16 v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  void *v36;
  NSObject *v37;
  id v38;
  SMBPistonEvents *v39;
  _QWORD block[4];
  id v41;
  SMBPistonEvents *v42;
  id v43;
  _WORD v44[2];
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  id v50;
  uint64_t v51;
  int v52;
  int v53;
  __int128 *v54;

  v3 = a1;
  v54 = 0;
  v52 = 0;
  v53 = 0;
  v51 = 0;
  objc_msgSend(v3, "sock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      smb2_smb_parse_lease_break_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    mbuf_freem(a2);
LABEL_8:
    v8 = 0;
    goto LABEL_19;
  }
  v6 = objc_alloc_init(SMBPistonEvents);
  if (v6)
  {
    v7 = v6;
    v50 = 0;
    v8 = smb2_rq_alloc(18, 0, 0, 0, v3, &v50);
    v9 = v50;
    v10 = v9;
    if ((_DWORD)v8)
    {
      mbuf_freem(a2);
LABEL_18:

      goto LABEL_19;
    }
    v54 = (__int128 *)objc_msgSend(v9, "smb_rq_getreply");
    md_initm((uint64_t)v54, (uint64_t)a2);
    v27 = smb2_rq_parse_header(v10, &v54);
    if ((_DWORD)v27)
    {
      v8 = v27;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_lease_break_cold_4();
      goto LABEL_17;
    }
    uint16le = md_get_uint16le(v54, (_WORD *)&v53 + 1);
    if ((_DWORD)uint16le)
    {
LABEL_16:
      v8 = uint16le;
LABEL_17:
      objc_msgSend(v10, "smb_rq_done");
      goto LABEL_18;
    }
    if (HIWORD(v53) == 44)
    {
      uint16le = md_get_uint16le(v54, &v53);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      v30 = v53;
      uint16le = md_get_uint32le(v54, &v52);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      v31 = v52;
      uint16le = md_get_uint64le(v54, &v51);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      v32 = v51;
      uint16le = md_get_uint64le(v54, &v51);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      v33 = v51;
      uint16le = md_get_uint32le(v54, &v52);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      v34 = v52;
      uint16le = md_get_uint32le(v54, &v52);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      v35 = v52;
      uint16le = md_get_uint32le(v54, 0);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      uint16le = md_get_uint32le(v54, 0);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      uint16le = md_get_uint32le(v54, 0);
      if ((_DWORD)uint16le)
        goto LABEL_16;
      v44[0] = v30;
      v44[1] = 0;
      v45 = v31;
      v46 = v32;
      v47 = v33;
      v48 = v34;
      v49 = v35;
      -[SMBPistonEvents setLeaseBreak:](v7, "setLeaseBreak:", v44);
      objc_msgSend(v3, "sock");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "recv_queue");
      v37 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __smb2_smb_parse_lease_break_block_invoke;
      block[3] = &unk_24FE01618;
      v41 = v3;
      v42 = v7;
      v43 = v10;
      v38 = v10;
      v39 = v7;
      dispatch_async(v37, block);

      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_lease_break_cold_3();
    objc_msgSend(v10, "smb_rq_done");

    v8 = 72;
  }
  else
  {
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
      smb2_smb_parse_lease_break_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    mbuf_freem(a2);
    v8 = 12;
  }
LABEL_19:

  return v8;
}

uint64_t __smb2_smb_parse_lease_break_block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callEventHandler:contextPtr:returnValue:", 8, *(_QWORD *)(a1 + 40), 0);

  return objc_msgSend(*(id *)(a1 + 48), "smb_rq_done");
}

void piston_lock(void *a1, int *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void (**v21)(id, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  void (**v27)(id, uint64_t);
  int *v28;
  id v29;

  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "pd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_lock_cold_1();
      if (!v6)
        goto LABEL_28;
    }
    else if (!v6)
    {
      goto LABEL_28;
    }
    v6[2](v6, 57);
    goto LABEL_28;
  }
  v9 = v5;
  v10 = v6;
  v11 = *a2;
  if (v11 < 3)
  {
    v12 = dword_2302C57C0[v11];
    v13 = objc_msgSend(v9, "treeID");
    v14 = objc_msgSend(v9, "onEncryptedShare");
    objc_msgSend(v9, "pd");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v16 = smb2_rq_alloc(10, v13, v14, 0, v15, &v29);
    v17 = v29;

    if ((_DWORD)v16)
    {
      if (v17)
        objc_msgSend(v17, "smb_rq_done");
      if (v10)
        v10[2](v10, v16);
      goto LABEL_25;
    }
    objc_msgSend(v17, "smb_rq_set_extflag:", 8);
    v18 = objc_msgSend(v17, "smb_rq_getrequest");
    mb_put_uint16le(v18, 48);
    mb_put_uint16le(v18, 1);
    mb_put_uint32le(v18, 0);
    mb_put_uint64le(v18, objc_msgSend(v9, "fid"));
    objc_msgSend(v9, "fid");
    mb_put_uint64le(v18, v19);
    mb_put_uint64le(v18, *((_QWORD *)a2 + 1));
    mb_put_uint64le(v18, *((_QWORD *)a2 + 2));
    mb_put_uint32le(v18, v12);
    mb_put_uint32le(v18, 0);
    objc_msgSend(v9, "pd");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __smb2_smb_lock_block_invoke;
    v25 = &unk_24FE01398;
    v21 = v10;
    v27 = v21;
    v28 = a2;
    v17 = v17;
    v26 = v17;
    v16 = smb_rq_simple_block(v20, v17, &v22);

    if (!(_DWORD)v16)
      goto LABEL_20;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_lock_cold_3();
      if (!v17)
      {
LABEL_18:
        if (v21)
          v21[2](v21, v16);
LABEL_20:

        goto LABEL_25;
      }
    }
    else if (!v17)
    {
      goto LABEL_18;
    }
    objc_msgSend(v17, "smb_rq_done", v22, v23, v24, v25);
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    piston_lock_cold_4();
    if (v10)
      goto LABEL_13;
LABEL_24:
    v17 = 0;
    LODWORD(v16) = 22;
    goto LABEL_25;
  }
  if (!v10)
    goto LABEL_24;
LABEL_13:
  LODWORD(v16) = 22;
  v10[2](v10, 22);
  v17 = 0;
LABEL_25:

  if ((_DWORD)v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    piston_lock_cold_2();
LABEL_28:

}

void __smb2_smb_lock_block_invoke(uint64_t a1, uint64_t uint16le)
{
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v15 = 0;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 32);
  v5 = a1 + 32;
  *(_DWORD *)(*(_QWORD *)(v5 + 16) + 24) = objc_msgSend(v6, "sr_ntstatus");
  if ((_DWORD)uint16le)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_lock_block_invoke_cold_2((id *)v5, uint16le);
  }
  else
  {
    v7 = (_QWORD *)objc_msgSend(*(id *)v5, "smb_rq_getreply");
    uint16le = md_get_uint16le(v7, (_WORD *)&v15 + 1);
    if (!(_DWORD)uint16le)
    {
      if (HIWORD(v15) == 4)
      {
        uint16le = md_get_uint16le(v7, &v15);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __smb2_smb_lock_block_invoke_cold_1((uint64_t)&v15 + 2, v8, v9, v10, v11, v12, v13, v14);
        uint16le = 72;
      }
    }
  }
  if (*(_QWORD *)v5)
    objc_msgSend(*(id *)v5, "smb_rq_done");
  if (v4)
    v4[2](v4, uint16le);

}

void piston_ioctl(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, void *a10)
{
  if (smb2_smb_ioctl(a1, a2, a3, a4, a7, a5, a6, a8, a9, 0, a10))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      piston_ioctl_cold_1();
  }
}

uint64_t smb2_smb_ioctl(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, _QWORD *a10, void *a11)
{
  id v18;
  id v19;
  void (**v20)(id, uint64_t);
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  id v31;
  id v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  const char *v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  char *v55;
  _BOOL8 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  char *cstring_len;
  int v66;
  id v67;
  int v68;
  unint64_t v69;
  void (**v70)(id, uint64_t);
  uint64_t v71;
  _BOOL8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BOOL8 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  _BOOL8 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _BOOL8 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _BOOL8 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _BOOL8 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _BOOL8 v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  UInt8 *v130;
  UInt8 *v131;
  _BOOL8 v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  UInt8 *v140;
  UInt8 *v141;
  _BOOL8 v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _BOOL8 v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD *v158;
  NSObject *v159;
  id v160;
  int v162;
  size_t v163;
  int *v164;
  id v165;
  id v166;
  id v167;
  id v168;
  _QWORD v169[4];
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  void (**v175)(id, uint64_t);
  uint64_t *v176;
  uint64_t v177;
  id v178;
  size_t __n;
  size_t v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t v184;
  char v185[32];
  uint64_t v186;

  v186 = *MEMORY[0x24BDAC8D0];
  v18 = a1;
  v19 = a2;
  v166 = a5;
  v168 = a6;
  v167 = a7;
  v165 = a8;
  v20 = a11;
  v181 = 0;
  v182 = &v181;
  v183 = 0x2020000000;
  v184 = 0;
  __n = 0;
  v180 = 0;
  v21 = v18;
  v22 = v21;
  if (v19)
  {
    objc_msgSend(v19, "pd");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v19, "treeID");
    v25 = objc_msgSend(v19, "onEncryptedShare");
    v26 = 0;
  }
  else
  {
    objc_msgSend(v21, "getShare:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v27;
    if (!v27)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_ioctl_cold_1();
      if (v20)
      {
        v30 = 22;
        v20[2](v20, 22);
        v26 = 0;
        v32 = 0;
      }
      else
      {
        v26 = 0;
        v32 = 0;
        v30 = 22;
      }
      v23 = v22;
      goto LABEL_156;
    }
    v24 = objc_msgSend(v27, "tree_id");
    v25 = objc_msgSend(v26, "isEncrypted");
    v23 = v22;
  }
  objc_msgSend(v23, "sock");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (v29)
  {
    v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v33)
      smb2_smb_ioctl_cold_2(v33, v34, v35, v36, v37, v38, v39, v40);
    if (v20)
      v20[2](v20, 57);
    v32 = 0;
    v30 = 100;
    goto LABEL_156;
  }
  v178 = 0;
  v30 = smb2_rq_alloc(11, v24, v25, 0, v23, &v178);
  v31 = v178;
  v32 = v31;
  if (!(_DWORD)v30)
  {
    v41 = objc_msgSend(v31, "smb_rq_getrequest");
    mb_put_uint16le(v41, 57);
    mb_put_uint16le(v41, 0);
    v164 = (int *)(a4 + 4);
    mb_put_uint32le(v41, *(_DWORD *)(a4 + 4));
    v42 = *(_DWORD *)(a4 + 4);
    if (v42 == 393620 || v42 == 1311236 || v42 == 1114136 || a10)
    {
      v43 = -1;
      mb_put_uint64le(v41, -1);
    }
    else
    {
      mb_put_uint64le(v41, objc_msgSend(v19, "fid"));
      objc_msgSend(v19, "fid");
      v43 = v71;
    }
    mb_put_uint64le(v41, v43);
    v44 = *v164;
    if (*v164 > 1163286)
    {
      if (v44 > 1311235)
      {
        if (v44 == 1311236)
        {
          objc_msgSend(v32, "smb_rq_set_srflags:", 1024);
          v68 = *(unsigned __int16 *)(a4 + 22);
          mb_put_uint32le(v41, 120);
          mb_put_uint32le(v41, 2 * v68 + 24);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 40);
          mb_put_uint32le(v41, 1);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, *(_DWORD *)(a4 + 16));
          *(_OWORD *)mb_reserve(v41, 0x10uLL) = *(_OWORD *)(a4 + 40);
          mb_put_uint16le(v41, *(_WORD *)(a4 + 20));
          mb_put_uint16le(v41, *(_WORD *)(a4 + 22));
          if (*(_WORD *)(a4 + 22))
          {
            v69 = 0;
            do
              mb_put_uint16le(v41, *(_WORD *)(a4 + 24 + 2 * v69++));
            while (v69 < *(unsigned __int16 *)(a4 + 22));
          }
          goto LABEL_74;
        }
        if (v44 == 1327346)
        {
          if (v168)
          {
            v64 = objc_msgSend(v168, "length");
            mb_put_uint32le(v41, 120);
            mb_put_uint32le(v41, v64);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, objc_msgSend(v167, "length"));
            mb_put_uint32le(v41, 1);
            mb_put_uint32le(v41, 0);
            mb_put_mem(v41, (char *)objc_msgSend(objc_retainAutorelease(v168), "bytes"), v64, 0);
            if ((*(_BYTE *)(objc_msgSend(v23, "getSessionPtr") + 560) & 0x40) != 0)
              objc_msgSend(v32, "smb_rq_set_srflags:", 512);
            goto LABEL_74;
          }
          v113 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v113)
            smb2_smb_ioctl_cold_16(v113, v114, v115, v116, v117, v118, v119, v120);
          if (!v32)
            goto LABEL_141;
          goto LABEL_140;
        }
        goto LABEL_84;
      }
      if (v44 == 1163287)
      {
        if (v168 && v167)
        {
          if (objc_msgSend(v168, "length"))
          {
            mb_put_uint32le(v41, 120);
            mb_put_uint32le(v41, objc_msgSend(v168, "length"));
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, objc_msgSend(v167, "length"));
            mb_put_uint32le(v41, 1);
            mb_put_uint32le(v41, 0);
            v67 = objc_retainAutorelease(v168);
            mb_put_mem(v41, (char *)objc_msgSend(v67, "bytes"), objc_msgSend(v67, "length"), 0);
            goto LABEL_74;
          }
          v142 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v142)
            smb2_smb_ioctl_cold_10(v142, v143, v144, v145, v146, v147, v148, v149);
          if (!v32)
            goto LABEL_141;
        }
        else
        {
          v80 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v80)
            smb2_smb_ioctl_cold_9(v80, v81, v82, v83, v84, v85, v86, v87);
          if (!v32)
            goto LABEL_141;
        }
        goto LABEL_140;
      }
      if (v44 != 1310840)
      {
LABEL_84:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_ioctl_cold_3();
        if (!v32)
          goto LABEL_141;
        goto LABEL_140;
      }
      if (!v167)
      {
        v97 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v97)
          smb2_smb_ioctl_cold_17(v97, v98, v99, v100, v101, v102, v103, v104);
        if (!v32)
          goto LABEL_141;
        goto LABEL_140;
      }
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      v54 = objc_msgSend(v167, "length");
    }
    else
    {
      if (v44 <= 589991)
      {
        if (v44 == 393620)
        {
          if (!v166 || !v167)
          {
            v72 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v72)
              smb2_smb_ioctl_cold_4(v72, v73, v74, v75, v76, v77, v78, v79);
            if (!v32)
              goto LABEL_148;
            goto LABEL_147;
          }
          cstring_len = (char *)smb_get_cstring_len(v166, (_DWORD *)&__n + 1);
          v66 = HIDWORD(__n);
          mb_put_uint32le(v41, 120);
          mb_put_uint32le(v41, v66 + 4);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, objc_msgSend(v167, "length"));
          mb_put_uint32le(v41, 1);
          mb_put_uint32le(v41, 0);
          mb_put_uint16le(v41, *(_WORD *)(a4 + 8));
          if (cstring_len)
          {
            v30 = mb_put_mem(v41, cstring_len, HIDWORD(__n), 0);
            if ((_DWORD)v30)
            {
              if (v32)
                objc_msgSend(v32, "smb_rq_done");
              if (v20)
                goto LABEL_170;
              goto LABEL_156;
            }
            mb_put_uint16le(v41, 0);
            goto LABEL_74;
          }
          v150 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v150)
            smb2_smb_ioctl_cold_5(v150, v151, v152, v153, v154, v155, v156, v157);
          if (v32)
LABEL_147:
            objc_msgSend(v32, "smb_rq_done");
LABEL_148:
          v30 = 22;
          if (v20)
            v20[2](v20, 22);
          goto LABEL_156;
        }
        if (v44 == 589988)
        {
          if (v166)
          {
            v45 = smb_get_cstring_len(v166, &__n);
            if ((__n - 32761) <= 0xFFFF8007)
            {
              v46 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v46)
                smb2_smb_ioctl_cold_15(v46, v47, v48, v49, v50, v51, v52, v53);
              if (!v32)
                goto LABEL_141;
              goto LABEL_140;
            }
            v129 = (char *)v45;
            v180 = 2 * __n + 2;
            v130 = (UInt8 *)malloc_type_malloc(v180, 0x4BDE6BB7uLL);
            v131 = v130;
            if (v130)
            {
              bzero(v130, v180);
              v30 = smb_convert_path_to_network(v129, __n, v131, &v180, 92, 32, 1);
              if ((_DWORD)v30)
              {
                free(v131);
                if (v32)
                  objc_msgSend(v32, "smb_rq_done");
                if (v20)
                  goto LABEL_170;
                goto LABEL_156;
              }
              objc_msgSend(v32, "smb_rq_set_extflag:", 8);
              v163 = v180;
              mb_put_uint32le(v41, 120);
              mb_put_uint32le(v41, (unsigned __int16)(2 * v163 + 12) + 8);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 1);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, -1610612724);
              mb_put_uint16le(v41, 2 * v163 + 12);
              mb_put_uint16le(v41, 0);
              mb_put_uint16le(v41, 0);
              mb_put_uint16le(v41, v163);
              mb_put_uint16le(v41, v163);
              mb_put_uint16le(v41, v163);
              mb_put_uint32le(v41, *v131 != 92);
              mb_put_mem(v41, (char *)v131, (unsigned __int16)v163, 0);
              mb_put_mem(v41, (char *)v131, (unsigned __int16)v163, 0);
              free(v131);
LABEL_74:
              if (a10)
              {
                smb2_rq_align8(v32);
                objc_msgSend(v32, "smb_rq_set_srflags:", 256);
                v32 = objc_retainAutorelease(v32);
                v30 = 0;
                *a10 = v32;
              }
              else if (v20)
              {
                v169[0] = MEMORY[0x24BDAC760];
                v169[1] = 3221225472;
                v169[2] = __smb2_smb_ioctl_block_invoke;
                v169[3] = &unk_24FE01488;
                v70 = v20;
                v175 = v70;
                v177 = a4;
                v32 = v32;
                v170 = v32;
                v176 = &v181;
                v23 = v23;
                v171 = v23;
                v172 = v166;
                v173 = v168;
                v174 = v167;
                v30 = smb_rq_simple_block(v23, v32, v169);
                if ((_DWORD)v30)
                {
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    smb2_smb_ioctl_cold_7();
                  if (v32)
                    objc_msgSend(v32, "smb_rq_done");
                  v70[2](v70, v30);
                }

              }
              else
              {
                v30 = smb_rq_simple(v23, v32);
                *(_DWORD *)(a4 + 12) = objc_msgSend(v32, "sr_ntstatus");
                if ((_DWORD)v30)
                {
                  if (*v164 == 1327346 && (_DWORD)v30 == 22)
                  {
                    v88 = (_QWORD *)objc_msgSend(v32, "smb_rq_getreply");
                    v182[3] = (uint64_t)v88;
                    smb2_smb_parse_ioctl_internal(v23, v88, a4, v166, v167);
                    v30 = 22;
                  }
                  else
                  {
                    v159 = MEMORY[0x24BDACB70];
                    v160 = MEMORY[0x24BDACB70];
                    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
                      smb2_smb_ioctl_cold_6((uint64_t)v185, v30, objc_msgSend(v32, "sr_ntstatus"));

                  }
                }
                else
                {
                  v158 = (_QWORD *)objc_msgSend(v32, "smb_rq_getreply");
                  v182[3] = (uint64_t)v158;
                  v30 = smb2_smb_parse_ioctl_internal(v23, v158, a4, v166, v167);
                }
                objc_msgSend(v32, "smb_rq_done", v163);
              }
              goto LABEL_156;
            }
            if (v32)
              goto LABEL_161;
            goto LABEL_162;
          }
          v89 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v89)
            smb2_smb_ioctl_cold_8(v89, v90, v91, v92, v93, v94, v95, v96);
          if (v32)
            goto LABEL_147;
          goto LABEL_148;
        }
        goto LABEL_84;
      }
      if (v44 != 589992)
      {
        if (v44 == 1114136)
        {
          if (!v165)
          {
            v105 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v105)
              smb2_smb_ioctl_cold_11(v105, v106, v107, v108, v109, v110, v111, v112);
            if (!v32)
              goto LABEL_148;
            goto LABEL_147;
          }
          v55 = (char *)smb_get_cstring_len(v165, &__n);
          if (!v55)
          {
            v132 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v132)
              smb2_smb_ioctl_cold_12(v132, v133, v134, v135, v136, v137, v138, v139);
            if (!v32)
              goto LABEL_148;
            goto LABEL_147;
          }
          if ((__n - 32761) > 0xFFFF8007)
          {
            v180 = 2 * __n + 2;
            v140 = (UInt8 *)malloc_type_malloc(v180, 0xD28BACC1uLL);
            v141 = v140;
            if (v140)
            {
              bzero(v140, v180);
              v30 = smb_convert_path_to_network(v55, __n, v141, &v180, 92, 32, 1);
              if ((_DWORD)v30)
              {
                free(v141);
                if (v32)
                  objc_msgSend(v32, "smb_rq_done");
                if (v20)
                  goto LABEL_170;
                goto LABEL_156;
              }
              v162 = v180;
              mb_put_uint32le(v41, 120);
              mb_put_uint32le(v41, v162 + 14);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 1);
              mb_put_uint32le(v41, 0);
              mb_put_uint64le(v41, a9);
              mb_put_uint32le(v41, v180);
              mb_put_uint8(v41, a9 != 0);
              mb_put_uint8(v41, 0);
              v30 = mb_put_mem(v41, (char *)v141, v180, 0);
              free(v141);
              if ((_DWORD)v30)
              {
                if (v32)
                  objc_msgSend(v32, "smb_rq_done");
                if (v20)
                  goto LABEL_170;
                goto LABEL_156;
              }
              goto LABEL_74;
            }
            if (v32)
LABEL_161:
              objc_msgSend(v32, "smb_rq_done");
LABEL_162:
            v30 = 12;
            if (v20)
              v20[2](v20, 12);
            goto LABEL_156;
          }
          v56 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v56)
            smb2_smb_ioctl_cold_13(v56, v57, v58, v59, v60, v61, v62, v63);
          if (!v32)
            goto LABEL_141;
LABEL_140:
          objc_msgSend(v32, "smb_rq_done");
LABEL_141:
          v30 = 72;
          if (v20)
            v20[2](v20, 72);
          goto LABEL_156;
        }
        goto LABEL_84;
      }
      if (!v166)
      {
        v121 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v121)
          smb2_smb_ioctl_cold_8(v121, v122, v123, v124, v125, v126, v127, v128);
        if (!v32)
          goto LABEL_148;
        goto LABEL_147;
      }
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      v54 = 0x10000;
    }
    mb_put_uint32le(v41, v54);
    mb_put_uint32le(v41, 1);
    mb_put_uint32le(v41, 0);
    goto LABEL_74;
  }
  if (v31)
    objc_msgSend(v31, "smb_rq_done");
  if (v20)
LABEL_170:
    v20[2](v20, v30);
LABEL_156:

  _Block_object_dispose(&v181, 8);
  return v30;
}

void sub_2302A2ED0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void piston_validate_negotiate(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  uint64_t *v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void (**v32)(_QWORD);
  int v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;

  v7 = a1;
  v8 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v9 = objc_msgSend(v7, "getSessionPtr");
  v10 = v9;
  if (!v9)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      piston_validate_negotiate_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    v13 = v40;
    v14 = 22;
LABEL_11:
    *((_DWORD *)v13 + 6) = v14;
    if (!v8)
      goto LABEL_19;
    goto LABEL_18;
  }
  if ((*(_QWORD *)(v9 + 552) & 0xC07000) != 0x1000)
  {
    v14 = 0;
    *((_DWORD *)v40 + 6) = 0;
    if (!v8)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_msgSend(v7, "sock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(v10 + 172);
    *(_OWORD *)(a2 + 40) = *(_OWORD *)(v10 + 176);
    v12 = *(unsigned __int16 *)(v10 + 194);
    *(_WORD *)(a2 + 20) = *(_WORD *)(v10 + 192);
    if (v12 >= 6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        piston_validate_negotiate_cold_3();
      v13 = v40;
      v14 = 12;
      goto LABEL_11;
    }
    *(_WORD *)(a2 + 22) = v12;
    if (v12)
    {
      v31 = 0;
      do
      {
        *(_WORD *)(a2 + 24 + 2 * v31) = *(_WORD *)(v10 + 196 + 2 * v31);
        ++v31;
      }
      while (v31 < *(unsigned __int16 *)(v10 + 194));
    }
    *(_DWORD *)(a2 + 4) = 1311236;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __piston_validate_negotiate_block_invoke;
    v34[3] = &unk_24FE01640;
    v36 = &v39;
    v37 = a2;
    v38 = v10;
    v32 = (void (**)(_QWORD))v8;
    v35 = v32;
    v33 = smb2_smb_ioctl(v7, 0, a3, a2, 0, 0, 0, 0, 0, 0, v34);
    *((_DWORD *)v40 + 6) = v33;
    if (v33)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        piston_validate_negotiate_cold_4();
        if (v32)
        {
LABEL_26:
          if (*((_DWORD *)v40 + 6))
            v32[2](v32);
        }
      }
      else if (v32)
      {
        goto LABEL_26;
      }
    }

    goto LABEL_19;
  }
  v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v23)
  {
    piston_validate_negotiate_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
    if (!v8)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_17:
    v14 = 57;
LABEL_18:
    (*((void (**)(id, uint64_t))v8 + 2))(v8, v14);
  }
LABEL_19:
  _Block_object_dispose(&v39, 8);

}

void sub_2302A3184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __piston_validate_negotiate_block_invoke(_QWORD *a1, int a2)
{
  _QWORD *v3;
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  int v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v3 = a1 + 5;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(_DWORD *)(v4 + 24);
  if (!v5)
  {
    v8 = a1[6];
    v7 = a1[7];
    if (*(_DWORD *)(v8 + 56) != *(_DWORD *)(v7 + 76))
    {
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v19)
        __piston_validate_negotiate_block_invoke_cold_9(v19, v20, v21, v22, v23, v24, v25, v26);
      goto LABEL_23;
    }
    if (*(_QWORD *)(v8 + 40) != *(_QWORD *)(v7 + 92) || *(_QWORD *)(v8 + 48) != *(_QWORD *)(v7 + 100))
    {
      v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v10)
        __piston_validate_negotiate_block_invoke_cold_8(v10, v11, v12, v13, v14, v15, v16, v17);
      goto LABEL_23;
    }
    if (*(unsigned __int16 *)(v8 + 60) != *(unsigned __int16 *)(v7 + 108))
    {
      v37 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v37)
        __piston_validate_negotiate_block_invoke_cold_7(v37, v38, v39, v40, v41, v42, v43, v44);
      goto LABEL_23;
    }
    v28 = *(unsigned __int16 *)(v8 + 64);
    if (v28 > 767)
    {
      if (v28 == 768)
      {
        if ((*(_BYTE *)(v7 + 553) & 0x18) != 0)
          goto LABEL_24;
        v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v29)
          goto LABEL_46;
        goto LABEL_23;
      }
      if (v28 == 770)
      {
        if ((*(_BYTE *)(v7 + 553) & 0x90) != 0)
          goto LABEL_24;
        v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v29)
          goto LABEL_46;
        goto LABEL_23;
      }
    }
    else
    {
      if (v28 == 514)
      {
        if ((*(_BYTE *)(v7 + 553) & 0x30) != 0)
          goto LABEL_24;
        v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v29)
          goto LABEL_46;
        goto LABEL_23;
      }
      if (v28 == 528)
      {
        if ((*(_BYTE *)(v7 + 553) & 0x50) != 0)
          goto LABEL_24;
        v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v29)
LABEL_46:
          __piston_validate_negotiate_block_invoke_cold_3(v29, v30, v31, v32, v33, v34, v35, v36);
LABEL_23:
        *(_DWORD *)(*(_QWORD *)(*v3 + 8) + 24) = 80;
        goto LABEL_24;
      }
    }
    v45 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v45)
      __piston_validate_negotiate_block_invoke_cold_2(v45, v46, v47, v48, v49, v50, v51, v52);
    goto LABEL_23;
  }
  if (v5 == 45 || v5 == 22)
  {
    if (piston_log_level)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __piston_validate_negotiate_block_invoke_cold_10();
      v4 = *(_QWORD *)(*v3 + 8);
    }
    *(_DWORD *)(v4 + 24) = 0;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __piston_validate_negotiate_block_invoke_cold_1();
  }
LABEL_24:
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(*(_QWORD *)(*v3 + 8) + 24));
  return result;
}

uint64_t smb2_smb_parse_ioctl_internal(void *a1, _QWORD *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t uint16le;
  int v13;
  uint64_t reparse_point;
  int v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;

  v9 = a4;
  v10 = a5;
  v29 = 0;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v23 = 0;
  v22 = 0;
  v11 = objc_msgSend(a1, "getSessionPtr");
  uint16le = md_get_uint16le(a2, (_WORD *)&v30 + 1);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  if (HIWORD(v30) != 49)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_ioctl_internal_cold_12();
    goto LABEL_19;
  }
  uint16le = md_get_uint16le(a2, &v30);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint32le(a2, &v29);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint64le(a2, &v27);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint64le(a2, &v28);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint32le(a2, (_DWORD *)&v26 + 1);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint32le(a2, &v26);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint32le(a2, (_DWORD *)&v25 + 1);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint32le(a2, &v25);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint32le(a2, (_DWORD *)&v24 + 1);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  uint16le = md_get_uint32le(a2, &v24);
  if ((_DWORD)uint16le)
    goto LABEL_20;
  if (v29 <= 1163286)
  {
    uint16le = 0;
    if (v29 <= 589991)
    {
      if (v29 != 393620)
      {
        v13 = 589988;
        goto LABEL_34;
      }
      goto LABEL_47;
    }
    if (v29 != 589992)
    {
      v13 = 1114136;
LABEL_34:
      if (v29 == v13)
        goto LABEL_20;
      goto LABEL_71;
    }
    reparse_point = smb2_smb_parse_get_reparse_point(v11, v9, a2);
LABEL_62:
    uint16le = reparse_point;
    goto LABEL_20;
  }
  if (v29 > 1311235)
  {
    if (v29 == 1311236)
    {
      v19 = v25;
      if ((_DWORD)v25 != 24 && piston_log_level)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_parse_ioctl_internal_cold_11();
        v19 = v25;
      }
      if (v19 <= 0x17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_parse_ioctl_internal_cold_10();
        goto LABEL_19;
      }
      uint16le = md_get_uint32le(a2, &v22);
      if (!(_DWORD)uint16le)
      {
        *(_DWORD *)(a3 + 56) = v22;
        uint16le = md_get_mem(a2, (char *)(a3 + 40), 16, 0);
        if (!(_DWORD)uint16le)
        {
          uint16le = md_get_uint16le(a2, &v23);
          if (!(_DWORD)uint16le)
          {
            *(_WORD *)(a3 + 60) = v23;
            *(_WORD *)(a3 + 62) = 1;
            reparse_point = md_get_uint16le(a2, (_WORD *)(a3 + 64));
            goto LABEL_62;
          }
        }
      }
      goto LABEL_20;
    }
    if (v29 == 1327346)
    {
      if ((_DWORD)v26 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_ioctl_internal_cold_4();
      if ((_DWORD)v25 != 12)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_smb_parse_ioctl_internal_cold_8();
        goto LABEL_19;
      }
      uint16le = smb2_smb_parse_copychunk_response(a2, v10);
      if ((_DWORD)uint16le && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_ioctl_internal_cold_7();
      goto LABEL_20;
    }
LABEL_71:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_ioctl_internal_cold_1();
LABEL_19:
    uint16le = 72;
    goto LABEL_20;
  }
  if (v29 == 1163287)
  {
LABEL_47:
    v16 = piston_log_level;
    if ((_DWORD)v26 && piston_log_level)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_ioctl_internal_cold_4();
      v16 = piston_log_level;
    }
    if (HIDWORD(v24) && v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_ioctl_internal_cold_3();
    if (!HIDWORD(v25) || (HIDWORD(v25) -= 112, uint16le = md_get_mem(a2, 0, HIDWORD(v25), 0), !(_DWORD)uint16le))
    {
      v17 = v25;
      if ((_DWORD)v25)
      {
        if (objc_msgSend(v10, "length") >= v17)
          v18 = v25;
        else
          v18 = objc_msgSend(v10, "length");
        v20 = objc_retainAutorelease(v10);
        v21 = v18;
        if (md_get_mem(a2, (char *)objc_msgSend(v20, "bytes"), v18, 0))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_smb_parse_ioctl_internal_cold_2();
          uint16le = 12;
        }
        else
        {
          uint16le = 0;
        }
        objc_msgSend(v20, "setLength:", v21);
      }
      else
      {
        objc_msgSend(v10, "setLength:", 0);
        uint16le = 0;
      }
    }
    goto LABEL_20;
  }
  if (v29 != 1310840)
    goto LABEL_71;
  if ((_DWORD)v26 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    smb2_smb_parse_ioctl_internal_cold_4();
  if ((_DWORD)v25 != 32)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_ioctl_internal_cold_5();
    goto LABEL_19;
  }
  if (!HIDWORD(v25) || (HIDWORD(v25) -= 112, uint16le = md_get_mem(a2, 0, HIDWORD(v25), 0), !(_DWORD)uint16le))
  {
    reparse_point = smb2_smb_parse_get_resume_key(a2, v10);
    goto LABEL_62;
  }
LABEL_20:

  return uint16le;
}

void __smb2_smb_ioctl_block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;
  int v6;
  uint64_t v7;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 72));
  v5 = (id *)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  v7 = *(_QWORD *)(a1 + 88);
  *(_DWORD *)(v7 + 12) = v6;
  if ((_DWORD)a2)
  {
    if ((_DWORD)a2 == 22 && *(_DWORD *)(v7 + 4) == 1327346)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
      smb2_smb_parse_ioctl_internal(*(void **)(a1 + 40), *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 88), *(void **)(a1 + 48), *(void **)(a1 + 64));
      a2 = 22;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      __smb2_smb_ioctl_block_invoke_cold_1((id *)(a1 + 32), a2);
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    a2 = smb2_smb_parse_ioctl_internal(*(void **)(a1 + 40), *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 88), *(void **)(a1 + 48), *(void **)(a1 + 64));
  }
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, a2);

}

uint64_t smb2_smb_parse_ioctl(void *a1, _QWORD *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "pd");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = smb2_smb_parse_ioctl_internal(v14, a2, a3, v11, v13);
  }
  else
  {
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v17)
      smb2_smb_parse_ioctl_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    v16 = 22;
  }

  return v16;
}

void piston_server_copy_file(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, uint64_t);
  void *v21;
  id v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t fid;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  _QWORD v77[4];
  void (**v78)(id, uint64_t);
  void *v79;
  _QWORD *v80;
  uint64_t v81;
  void *v82;

  v13 = a1;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  if ((*(_BYTE *)(objc_msgSend(v13, "getSessionPtr") + 560) & 0x40) == 0
    || (*(_BYTE *)(objc_msgSend(v13, "getSessionPtr") + 584) & 2) == 0)
  {
    v71 = a6;
    v72 = a5;
    v17 = v13;
    v18 = v14;
    v19 = v15;
    v20 = (void (**)(id, uint64_t))v16;
    v81 = 0;
    v82 = 0;
    objc_msgSend(v17, "getShare:", a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v74 = v14;
      v22 = -[SMBNode init:]([SMBNode alloc], "init:", v17);
      if (!v22)
      {
        v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v23)
          piston_server_copy_file_cold_10(v23, v24, v25, v26, v27, v28, v29, v30);
        v20[2](v20, 12);
        v22 = 0;
      }
      v75 = v18;
      v76 = v22;
      v31 = objc_msgSend(v22, "commonInit:onShareID:", v17, a2);
      if ((_DWORD)v31)
      {
        v32 = v31;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          piston_server_copy_file_cold_7();
        v20[2](v20, v32);
      }
      v33 = -[SMBNode init:]([SMBNode alloc], "init:", v17);
      if (!v33)
      {
        v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v34)
          piston_server_copy_file_cold_8(v34, v35, v36, v37, v38, v39, v40, v41);
        v20[2](v20, 12);
      }
      v73 = v19;
      v42 = objc_msgSend(v33, "commonInit:onShareID:", v17, a2);
      if ((_DWORD)v42)
      {
        v43 = v42;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          piston_server_copy_file_cold_7();
        v20[2](v20, v43);
      }
      v44 = malloc_type_malloc(0x18uLL, 0x1010040113C0ABBuLL);
      if (v44)
      {
        v45 = v44;
        if ((objc_msgSend(v21, "file_system_attrs") & 0x40000) == 0)
        {
          v46 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          v18 = v75;
          if (v46)
            piston_server_copy_file_cold_3(v46, v47, v48, v49, v50, v51, v52, v53);
          free(v45);
          v20[2](v20, 45);
LABEL_46:

          v19 = v73;
          v14 = v74;
          goto LABEL_47;
        }
        fid = smb2_smb_create_fid(v76, v75, 0, 137, 1, 1, 1, 0, 0, 0, 0);
        if (!(_DWORD)fid)
        {
          v64 = smb2fs_smb_listxattrs(v76, &v82, (size_t *)&v81);
          if ((_DWORD)v64)
          {
            v65 = v64;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              piston_server_copy_file_cold_5();
          }
          else
          {
            v66 = smb2_smb_close_fid(v76, 0, 0);
            if (!(_DWORD)v66)
            {
              *v45 = 0;
              v45[1] = 0;
              v45[2] = 0;
              v67 = (uint64_t)v82;
              v70 = v81;
              v77[0] = MEMORY[0x24BDAC760];
              v77[1] = 3221225472;
              v77[2] = __smb2fs_smb_copyfile_win_block_invoke;
              v77[3] = &unk_24FE01668;
              v79 = v82;
              v80 = v45;
              v78 = v20;
              v68 = (uint64_t)v45;
              v19 = v73;
              v69 = v67;
              v18 = v75;
              smb2fs_smb_copyfile_win_xattr(v17, a2, v75, v73, v72, v68, v69, v70, 0, 0, v71, v77);

              v14 = v74;
              goto LABEL_47;
            }
            v65 = v66;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              piston_server_copy_file_cold_4();
          }
          v18 = v75;
          if (v82)
            free(v82);
          free(v45);
          v20[2](v20, v65);
          goto LABEL_46;
        }
        v63 = fid;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          piston_server_copy_file_cold_6();
        free(v45);
        v20[2](v20, v63);
      }
      else
      {
        v54 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v54)
          piston_server_copy_file_cold_2(v54, v55, v56, v57, v58, v59, v60, v61);
        v20[2](v20, 12);
      }

      v14 = v74;
      v18 = v75;
      v19 = v73;
LABEL_47:

      goto LABEL_48;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_server_copy_file_cold_1();
      if (!v20)
        goto LABEL_47;
    }
    else if (!v20)
    {
      goto LABEL_47;
    }
    v20[2](v20, 22);
    goto LABEL_47;
  }
  smb2fs_smb_copyfile_stream(v13, a2, v14, v15, a5, 1, 0, 0, v16);
LABEL_48:

}

void smb2fs_smb_copyfile_stream(void *a1, uint64_t a2, void *a3, void *a4, char a5, int a6, uint64_t a7, int a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void (**v19)(id, _QWORD);
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t fid;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  _OWORD *v59;
  _QWORD *v60;
  _OWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  _BOOL8 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL8 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  _BOOL8 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  id v93;
  _QWORD *v94;
  void *v95;
  unint64_t *v96;
  unint64_t *v97;
  unint64_t *v98;
  _BOOL8 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  _QWORD *v109;
  void *v110;
  id v111;
  void *v112;
  void *v114;
  _QWORD v115[2];
  uint64_t (*v116)(uint64_t, int);
  void *v117;
  id v118;
  id v119;
  void (**v120)(id, _QWORD);
  uint64_t v121;
  int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  _QWORD *v128;
  unint64_t *v129;
  _QWORD *v130;
  _QWORD *v131;
  _OWORD v132[6];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  __int128 v143;
  uint64_t v144;
  uint64_t v145;

  v145 = *MEMORY[0x24BDAC8D0];
  v15 = a1;
  v16 = a3;
  v17 = a4;
  v18 = v15;
  v19 = a9;
  v142 = 0;
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v133 = 0u;
  memset(v132, 0, sizeof(v132));
  objc_msgSend(v15, "getShare:", a2);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
  {
    v22 = (void *)v20;
    v23 = -[SMBNode init:]([SMBNode alloc], "init:", v18);
    v24 = v18;
    v114 = v18;
    if (v23)
    {
      v25 = v23;
      v112 = v17;
      v26 = objc_msgSend(v23, "commonInit:onShareID:", v24, a2);
      if ((_DWORD)v26)
      {
        v27 = v26;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2fs_smb_copyfile_stream_cold_14();
        v19[2](v19, v27);
      }
      v28 = -[SMBNode init:]([SMBNode alloc], "init:", v114);
      if (v28)
      {
        v29 = v28;
        v30 = objc_msgSend(v28, "commonInit:onShareID:", v114, a2);
        v21 = v22;
        if ((_DWORD)v30)
        {
          v31 = v30;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2fs_smb_copyfile_stream_cold_14();
          v19[2](v19, v31);
        }
        if (a7)
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", a7, 4);
        else
          v32 = 0;
        fid = smb2_smb_create_fid(v25, v16, v32, 137, 1, 1, 1, 2 * (a8 != 0), v132, 0, 0);
        if ((_DWORD)fid)
        {
          v50 = fid;
          if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2fs_smb_copyfile_stream_cold_13();
LABEL_45:
          v19[2](v19, v50);

LABEL_46:
          v17 = v112;
          goto LABEL_47;
        }
        v51 = *((_QWORD *)&v133 + 1);
        if ((a5 & 1) != 0)
          v52 = 2;
        else
          v52 = 5;
        if (a8)
          v53 = 3;
        else
          v53 = 1;
        if (a8)
          v54 = 5;
        else
          v54 = v52;
        v55 = smb2_smb_create_fid(v29, v112, v32, 407, 1, 0, v54, v53, 0, 0, 0);
        if ((_DWORD)v55)
        {
          v50 = v55;
          if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2fs_smb_copyfile_stream_cold_12();
          if (smb2_smb_close_fid(v25, 0, 0)
            && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            smb2fs_smb_copyfile_stream_cold_11();
          }
          goto LABEL_45;
        }
        v115[0] = MEMORY[0x24BDAC760];
        v115[1] = 3221225472;
        v116 = __smb2fs_smb_copyfile_stream_block_invoke;
        v117 = &unk_24FE016B8;
        v122 = a6;
        v118 = v29;
        v108 = v51;
        v121 = v51;
        v119 = v25;
        v123 = 0x100000001;
        v120 = v19;
        v111 = v114;
        v56 = v119;
        v57 = v118;
        v109 = v115;
        v58 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
        v110 = v57;
        if (v58)
        {
          v59 = malloc_type_malloc(0x1A0uLL, 0x60BFFDF0uLL);
          if (v59)
          {
            v60 = v59;
            v107 = v56;
            v59[24] = 0u;
            v59[25] = 0u;
            v59[22] = 0u;
            v59[23] = 0u;
            v59[20] = 0u;
            v59[21] = 0u;
            v59[18] = 0u;
            v59[19] = 0u;
            v59[16] = 0u;
            v59[17] = 0u;
            v59[14] = 0u;
            v59[15] = 0u;
            v59[12] = 0u;
            v59[13] = 0u;
            v59[10] = 0u;
            v59[11] = 0u;
            v59[8] = 0u;
            v59[9] = 0u;
            v59[6] = 0u;
            v59[7] = 0u;
            v59[4] = 0u;
            v59[5] = 0u;
            v59[2] = 0u;
            v59[3] = 0u;
            *v59 = 0u;
            v59[1] = 0u;
            v61 = malloc_type_malloc(0x60uLL, 0x1000040718B784FuLL);
            if (v61)
            {
              v62 = (uint64_t)v61;
              v61[4] = 0u;
              v61[5] = 0u;
              v61[2] = 0u;
              v61[3] = 0u;
              *v61 = 0u;
              v61[1] = 0u;
              *((_DWORD *)v61 + 1) = 1310840;
              objc_msgSend(v58, "setLength:", 32);
              v63 = smb2_smb_ioctl(0, v107, 0, v62, 0, 0, v58, 0, 0, 0, 0);
              if ((_DWORD)v63)
              {
                v64 = v63;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  smb2fs_smb_copyfile_stream_cold_10();
                v65 = 0;
                goto LABEL_70;
              }
              v91 = objc_msgSend(v58, "length");
              v92 = MEMORY[0x24BDAC760];
              if (v91 <= 0x17)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  smb2fs_smb_copyfile_stream_cold_7(v58);
                v65 = 0;
                v64 = 72;
                goto LABEL_70;
              }
              objc_msgSend(v58, "getBytes:length:", &v143, 24);
              *(_DWORD *)(v62 + 4) = 1327346;
              objc_msgSend(v58, "setLength:", 12);
              *(_OWORD *)v60 = v143;
              v60[2] = v144;
              *((_DWORD *)v60 + 7) = 0;
              if (a6 == 1)
              {
                v93 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
                if (v93)
                {
                  v65 = v93;
                  objc_msgSend(v93, "appendBytes:length:", v60, 32);
                  *((_DWORD *)v60 + 6) = 0;
                  v124 = v92;
                  v125 = 3221225472;
                  v126 = __smb2fs_smb_copychunks_block_invoke;
                  v127 = &unk_24FE016E0;
                  v94 = v58;
                  v128 = v94;
                  v130 = (_QWORD *)v62;
                  v131 = v60;
                  v129 = v109;
                  v95 = v94;
                  v82 = v109;
                  v64 = smb2_smb_ioctl(v111, v110, 0, v62, 0, v65, v95, 0, 0, 0, &v124);

                  v56 = v107;
                  if (!(_DWORD)v64)
                    goto LABEL_73;
                  goto LABEL_71;
                }
                v99 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v99)
                  smb2fs_smb_copyfile_stream_cold_4(v99, v100, v101, v102, v103, v104, v105, v106);
                goto LABEL_65;
              }
              v96 = (unint64_t *)malloc_type_malloc(0x20uLL, 0x1000040F6D918ACuLL);
              if (v96)
              {
                v97 = v96;
                *v96 = v108;
                v96[1] = 0;
                *((_OWORD *)v96 + 1) = xmmword_2302C57D0;
                v124 = v92;
                v125 = 3221225472;
                v126 = __smb2fs_smb_copychunks_block_invoke_3;
                v127 = &unk_24FE01668;
                v129 = v96;
                v130 = v60;
                v128 = v109;
                v98 = v97;
                v82 = v109;
                smb2fs_smb_copychunks_win(v111, v57, v108, (uint64_t)v60, v98, v62, &v124);

                v65 = 0;
                v56 = v107;
                goto LABEL_73;
              }
              v83 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v83)
                goto LABEL_64;
            }
            else
            {
              v83 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v83)
LABEL_64:
                smb2fs_smb_copyfile_stream_cold_5(v83, v84, v85, v86, v87, v88, v89, v90);
            }
LABEL_65:
            v65 = 0;
            v64 = 12;
LABEL_70:
            v56 = v107;
            v82 = v109;
LABEL_71:
            free(v60);
            goto LABEL_72;
          }
          v74 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v74)
            smb2fs_smb_copyfile_stream_cold_5(v74, v75, v76, v77, v78, v79, v80, v81);
        }
        else
        {
          v66 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v66)
            smb2fs_smb_copyfile_stream_cold_4(v66, v67, v68, v69, v70, v71, v72, v73);
        }
        v65 = 0;
        v64 = 12;
        v82 = v109;
LABEL_72:
        v116((uint64_t)v82, v64);
LABEL_73:

        goto LABEL_46;
      }
      v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v41)
        smb2fs_smb_copyfile_stream_cold_3(v41, v42, v43, v44, v45, v46, v47, v48);
      v19[2](v19, 12);

      v17 = v112;
    }
    else
    {
      v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v33)
        smb2fs_smb_copyfile_stream_cold_2(v33, v34, v35, v36, v37, v38, v39, v40);
      v19[2](v19, 12);
    }
    v21 = v22;
LABEL_47:
    v18 = v114;
    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    smb2fs_smb_copyfile_stream_cold_1();
    if (!v19)
      goto LABEL_48;
    goto LABEL_16;
  }
  if (v19)
LABEL_16:
    v19[2](v19, 22);
LABEL_48:

}

uint64_t smb2fs_smb_check_copyfile(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _OWORD v17[6];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  memset(v17, 0, sizeof(v17));
  v2 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v3 = v2;
  if (v2)
  {
    DWORD1(v17[0]) = 1310840;
    objc_msgSend(v2, "setLength:", 32);
    v4 = smb2_smb_ioctl(0, v1, 0, (uint64_t)v17, 0, 0, v3, 0, 0, 0, 0);
    if ((_DWORD)v4)
    {
      v5 = v4;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2fs_smb_check_copyfile_cold_3();
    }
    else if ((unint64_t)objc_msgSend(v3, "length") > 0x17)
    {
      objc_msgSend(v1, "pd");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "getSessionPtr");
      *(_QWORD *)(v15 + 560) |= 0x800uLL;

      v5 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2fs_smb_check_copyfile_cold_2(v3);
      v5 = 72;
    }
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      smb2fs_smb_check_copyfile_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    v5 = 12;
  }

  return v5;
}

uint64_t smb2_smb_parse_get_reparse_point(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t uint32le;
  unsigned int v7;
  char *v9;
  char *v10;
  size_t v11;
  UInt8 *v12;
  UInt8 *v13;
  uint64_t v14;
  id v15;
  void *v16;
  CFIndex v17;
  int v18;
  size_t size;
  uint64_t v20;

  v5 = a2;
  v20 = 0;
  size = 0;
  v18 = 0;
  v17 = 0;
  uint32le = md_get_uint32le(a3, (_DWORD *)&v20 + 1);
  if (!(_DWORD)uint32le)
  {
    if (HIDWORD(v20) == -1610612724)
    {
      uint32le = md_get_uint16le(a3, (_WORD *)&size + 3);
      if (!(_DWORD)uint32le)
      {
        uint32le = md_get_uint16le(a3, (_WORD *)&size + 2);
        if (!(_DWORD)uint32le)
        {
          uint32le = md_get_uint16le(a3, (_WORD *)&size + 1);
          if (!(_DWORD)uint32le)
          {
            uint32le = md_get_uint16le(a3, &size);
            if (!(_DWORD)uint32le)
            {
              uint32le = md_get_uint16le(a3, (_WORD *)&v18 + 1);
              if (!(_DWORD)uint32le)
              {
                uint32le = md_get_uint16le(a3, &v18);
                if (!(_DWORD)uint32le)
                {
                  uint32le = md_get_uint32le(a3, &v20);
                  if (!(_DWORD)uint32le)
                  {
                    v7 = (unsigned __int16)size;
                    if (!(_WORD)size || *(_DWORD *)(a1 + 80) < (unsigned __int16)size)
                      goto LABEL_12;
                    if (WORD1(size))
                    {
                      uint32le = md_get_mem(a3, 0, WORD1(size), 0);
                      if ((_DWORD)uint32le)
                        goto LABEL_16;
                      v7 = (unsigned __int16)size;
                    }
                    v9 = (char *)malloc_type_malloc(v7, 0x66D929C1uLL);
                    if (v9)
                    {
                      v10 = v9;
                      uint32le = md_get_mem(a3, v9, (unsigned __int16)size, 0);
                      if (!(_DWORD)uint32le)
                      {
                        v11 = 9 * (unsigned __int16)size + 1;
                        v17 = v11;
                        v12 = (UInt8 *)malloc_type_malloc(v11, 0x133FDE33uLL);
                        if (v12)
                        {
                          v13 = v12;
                          bzero(v12, v11);
                          v14 = smb_convert_network_to_path(v10, (unsigned __int16)size, v13, &v17, 92, 32, 1);
                          uint32le = v14;
                          if (v5 && !(_DWORD)v14)
                          {
                            v15 = objc_alloc(MEMORY[0x24BDD17C8]);
                            v16 = (void *)objc_msgSend(v15, "initWithCString:encoding:", v13, 4, v17);
                            objc_msgSend(v5, "setString:", v16);

                          }
                          free(v13);
                        }
                        else
                        {
                          uint32le = 12;
                        }
                      }
                      free(v10);
                    }
                    else
                    {
LABEL_12:
                      uint32le = 12;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_smb_parse_get_reparse_point_cold_1();
      uint32le = 72;
    }
  }
LABEL_16:

  return uint32le;
}

uint64_t smb2_smb_parse_get_resume_key(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t mem;

  v3 = objc_retainAutorelease(a2);
  mem = md_get_mem(a1, (char *)objc_msgSend(v3, "bytes"), 32, 0);
  if ((_DWORD)mem)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_get_resume_key_cold_1();
    mem = 12;
  }
  objc_msgSend(v3, "setLength:", 32);

  return mem;
}

uint64_t smb2_smb_parse_copychunk_response(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t mem;

  v3 = objc_retainAutorelease(a2);
  mem = md_get_mem(a1, (char *)objc_msgSend(v3, "bytes"), 12, 0);
  if ((_DWORD)mem)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_parse_copychunk_response_cold_1();
    mem = 12;
  }
  objc_msgSend(v3, "setLength:", 12);

  return mem;
}

void smb2fs_smb_copyfile_win_xattr(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, void *a12)
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;

  v19 = a1;
  v20 = a3;
  v21 = a4;
  v22 = a12;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __smb2fs_smb_copyfile_win_xattr_block_invoke;
  v27[3] = &unk_24FE01690;
  v32 = a6;
  v33 = a8;
  v37 = a2;
  v28 = v19;
  v29 = v20;
  v34 = a7;
  v35 = a5;
  v36 = a11;
  v30 = v21;
  v31 = v22;
  v23 = v22;
  v24 = v21;
  v25 = v20;
  v26 = v19;
  smb2fs_smb_copyfile_stream(v26, a2, v25, v24, a5, 0, a9, a10, v27);

}

uint64_t __smb2fs_smb_copyfile_win_block_invoke(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;

  if (a2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __smb2fs_smb_copyfile_win_block_invoke_cold_1();
  v3 = (void *)a1[5];
  if (v3)
    free(v3);
  v4 = (void *)a1[6];
  if (v4)
    free(v4);
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t __smb2fs_smb_copyfile_win_xattr_block_invoke(uint64_t a1, int a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  const char *v10;
  uint64_t v11;
  size_t v12;

  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2fs_smb_copyfile_win_xattr_block_invoke_cold_1();
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  v4 = *(uint64_t **)(a1 + 64);
  v5 = *v4;
  if (!*v4)
  {
    v11 = *(_QWORD *)(a1 + 72);
    v4[1] = v11;
    if (v11)
    {
      *v4 = *(_QWORD *)(a1 + 80);
      v8 = *(_QWORD *)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 72);
      v10 = *(const char **)v8;
      goto LABEL_10;
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  v6 = v4[2] + 1;
  v7 = v4[1] - v6;
  v4[1] = v7;
  v4[2] = v6;
  if (!v7)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  *v4 = v5 + v6;
  v8 = *(_QWORD *)(a1 + 64);
  v10 = *(const char **)v8;
  v9 = *(_QWORD *)(v8 + 8);
LABEL_10:
  v12 = strnlen(v10, v9);
  *(_QWORD *)(v8 + 16) = v12;
  return smb2fs_smb_copyfile_win_xattr(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), v8, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 72), v10, v12, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56));
}

uint64_t __smb2fs_smb_copyfile_stream_block_invoke(uint64_t a1, int a2)
{
  __darwin_time_t tv_sec;
  uint64_t v5;
  timeval v6;

  tv_sec = 0;
  v5 = 0;
  if (a2)
  {
    if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2fs_smb_copyfile_stream_block_invoke_cold_5();
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  if (*(_DWORD *)(a1 + 64))
    goto LABEL_6;
  if (smb2fs_smb_set_eof(*(void **)(a1 + 32), *(_QWORD *)(a1 + 56)))
  {
    if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2fs_smb_copyfile_stream_block_invoke_cold_4();
  }
  else
  {
    v6.tv_sec = 0;
    *(_QWORD *)&v6.tv_usec = 0;
    gettimeofday(&v6, 0);
    tv_sec = v6.tv_sec;
    v5 = 1000 * v6.tv_usec;
    if (!smb2fs_smb_setfattrNT(*(void **)(a1 + 32), 0, 0, &tv_sec, 0))
    {
LABEL_6:
      if (*(_DWORD *)(a1 + 68) == 1
        && smb2_smb_close_fid(*(void **)(a1 + 40), 0, 0)
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        __smb2fs_smb_copyfile_stream_block_invoke_cold_2();
      }
      if (*(_DWORD *)(a1 + 72) == 1
        && smb2_smb_close_fid(*(void **)(a1 + 32), 0, 0)
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        __smb2fs_smb_copyfile_stream_block_invoke_cold_1();
      }
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2fs_smb_copyfile_stream_block_invoke_cold_3();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __smb2fs_smb_copychunks_block_invoke(uint64_t a1, int a2)
{
  unsigned int v3;
  void *v4;

  if (a2 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __smb2fs_smb_copychunks_block_invoke_cold_3();
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") <= 0xB
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __smb2fs_smb_copychunks_block_invoke_cold_2((id *)(a1 + 32));
  }
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 12);
  if (v3)
  {
    if (piston_log_level)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __smb2fs_smb_copychunks_block_invoke_cold_1();
      v3 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 12);
    }
    piston_ntstatus_to_errno(v3);
  }
  v4 = *(void **)(a1 + 56);
  if (v4)
    free(v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void smb2fs_smb_copychunks_win(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, void *a7)
{
  char *v13;
  id v14;
  void (**v15)(id, _QWORD);
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64x2_t v23;
  _DWORD *v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  _QWORD v46[4];
  id v47;
  char *v48;
  id v49;
  void (**v50)(id, _QWORD);
  unint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;

  v13 = a1;
  v14 = a2;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v17 = v16;
  if (v16)
  {
    v44 = a3;
    v45 = v13;
    objc_msgSend(v16, "setLength:", 12);
    LODWORD(v13) = 0;
    v18 = 0;
    v19 = *((unsigned int *)a5 + 6);
    v21 = *a5;
    v20 = a5[1];
    if ((_DWORD)v19 && v21)
    {
      v13 = 0;
      v18 = 0;
      v22 = *((unsigned int *)a5 + 5);
      v23 = vdupq_n_s64(v20);
      v24 = (_DWORD *)(a4 + 52);
      v25 = *a5;
      do
      {
        if (v25 <= v22)
          v26 = v25;
        else
          v26 = v22;
        *(v24 - 1) = v26;
        *v24 = 0;
        *(int64x2_t *)(v24 - 5) = v23;
        v18 += v26;
        if ((unint64_t)++v13 >= v19)
          break;
        v23 = vaddq_s64(v23, vdupq_n_s64(v26));
        v24 += 6;
        v25 -= v26;
      }
      while (v25);
    }
    *a5 = v21 - v18;
    a5[1] = v18 + v20;
    *(_DWORD *)(a4 + 24) = (_DWORD)v13;
    v27 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    if (!v27)
    {
      v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v28)
        smb2fs_smb_copychunks_win_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
      v15[2](v15, 0);
    }
    objc_msgSend(v27, "appendBytes:length:", a4, (24 * (_DWORD)v13 + 32));
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __smb2fs_smb_copychunks_win_block_invoke;
    v46[3] = &unk_24FE01708;
    v57 = (int)v13;
    v51 = a5;
    v52 = v18;
    v53 = a6;
    v47 = v17;
    v13 = v45;
    v54 = v44;
    v55 = a4;
    v48 = v45;
    v49 = v14;
    v56 = a4;
    v50 = v15;
    smb2_smb_ioctl(0, v49, 0, a6, 0, v27, v47, 0, 0, 0, v46);

  }
  else
  {
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
      smb2fs_smb_copychunks_win_cold_1(v36, v37, v38, v39, v40, v41, v42, v43);
    v15[2](v15, 12);
  }

}

uint64_t __smb2fs_smb_copychunks_block_invoke_3(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;

  if (a2 && piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __smb2fs_smb_copychunks_block_invoke_3_cold_1();
  v3 = (void *)a1[5];
  if (v3)
    free(v3);
  v4 = (void *)a1[6];
  if (v4)
    free(v4);
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t __smb2fs_smb_copychunks_win_block_invoke(uint64_t a1, int a2)
{
  int v2;
  unsigned int v4;
  _DWORD *v5;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;

  v2 = a2;
  v13 = 0;
  v12 = 0;
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2fs_smb_copychunks_win_block_invoke_cold_6(a1, v2);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 80) + 12) != -1073741811)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length", v12) > 0xB)
  {
    objc_msgSend(*(id *)(a1 + 32), "getBytes:length:", &v12, 12);
    v4 = *(_DWORD *)(*(_QWORD *)(a1 + 80) + 12);
    if (v4)
    {
      if (v4 == -1073741811)
      {
        v5 = *(_DWORD **)(a1 + 64);
        if (!v5[4])
        {
          v7 = HIDWORD(v12);
          v8 = v5[5];
          if (HIDWORD(v12) < v8)
          {
            v5[5] = HIDWORD(v12);
            v8 = v7;
          }
          v9 = v13 / v8;
          if (v9 >= v12)
            v9 = v12;
          v5[6] = v9;
          v5[4] = 1;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __smb2fs_smb_copychunks_win_block_invoke_cold_3();
          v10 = *(_QWORD *)(a1 + 88);
          v11 = *(_QWORD **)(a1 + 64);
          *v11 = v10;
          v11[1] = 0;
          if (!v10)
            return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          return smb2fs_smb_copychunks_win(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 104));
        }
      }
      if (piston_log_level)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __smb2fs_smb_copychunks_win_block_invoke_cold_2();
        v4 = *(_DWORD *)(*(_QWORD *)(a1 + 80) + 12);
      }
      v2 = piston_ntstatus_to_errno(v4);
    }
    else
    {
      if ((_DWORD)v12 != *(_DWORD *)(*(_QWORD *)(a1 + 96) + 24))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __smb2fs_smb_copychunks_win_block_invoke_cold_5();
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      if (*(_QWORD *)(a1 + 72) != v13)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __smb2fs_smb_copychunks_win_block_invoke_cold_4();
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
    }
    if (v2 || !**(_QWORD **)(a1 + 64))
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return smb2fs_smb_copychunks_win(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 104));
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __smb2fs_smb_copychunks_win_block_invoke_cold_1((id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void OUTLINED_FUNCTION_12(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_13@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = a2;
  return objc_msgSend(*a1, "length");
}

uint64_t smb2_smb_echo(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  __darwin_time_t tv_sec;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void *(*v20)(uint64_t, int);
  void *v21;
  id v22;
  id v23;
  timeval v24;

  v1 = a1;
  objc_msgSend(v1, "sock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_smb_echo_cold_1();
    v3 = 57;
    goto LABEL_14;
  }
  v23 = 0;
  v3 = smb2_rq_alloc(13, 0, 0, 0, v1, &v23);
  v4 = v23;
  v5 = v4;
  if (!(_DWORD)v3)
  {
    v24.tv_sec = 0;
    *(_QWORD *)&v24.tv_usec = 0;
    v6 = objc_msgSend(v4, "smb_rq_getrequest");
    mb_put_uint16le(v6, 4);
    mb_put_uint16le(v6, 0);
    gettimeofday(&v24, 0);
    tv_sec = v24.tv_sec;
    v8 = 1000 * v24.tv_usec;
    objc_msgSend(v1, "sock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLast_echo:", tv_sec, v8);

    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __smb2_smb_echo_block_invoke;
    v21 = &unk_24FE01730;
    v5 = v5;
    v22 = v5;
    v3 = smb_rq_simple_block(v1, v5, &v18);
    if ((_DWORD)v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        smb2_smb_echo_cold_2(v3, v10, v11, v12, v13, v14, v15, v16);
        if (!v5)
          goto LABEL_12;
        goto LABEL_11;
      }
      if (v5)
LABEL_11:
        objc_msgSend(v5, "smb_rq_done", v18, v19, v20, v21);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v4)
  {
    objc_msgSend(v4, "smb_rq_done");
LABEL_13:

  }
LABEL_14:

  return v3;
}

void *__smb2_smb_echo_block_invoke(uint64_t a1, int a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  int v13;

  v13 = 0;
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_echo_block_invoke_cold_2(a1, a2);
  }
  else
  {
    v4 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    if (!md_get_uint16le(v4, (_WORD *)&v13 + 1))
    {
      if (HIWORD(v13) == 4)
      {
        md_get_uint16le(v4, &v13);
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        __smb2_smb_echo_block_invoke_cold_1((uint64_t)&v13 + 2, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "smb_rq_done");
  return result;
}

void smb2_rq_credit_increment(void *a1)
{
  uint64_t v1;
  int v2;
  void *v3;
  int v4;
  pthread_mutex_t *v5;
  unsigned int *v6;
  int v7;
  unsigned int v8;
  unsigned int *v9;
  int v10;
  unsigned int v11;
  signed int v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v16;
  id v17;

  v17 = a1;
  v1 = objc_msgSend(v17, "sr_sessionp");
  v2 = objc_msgSend(v17, "sr_rspcreditsgranted");
  v3 = v17;
  if (v2)
  {
    v4 = objc_msgSend(v17, "sr_command");
    v3 = v17;
    if ((v4 - 2) >= 2)
    {
      if (v4)
      {
        v5 = (pthread_mutex_t *)(v1 + 608);
        if (v4 == 1)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v1 + 608));
          v6 = (unsigned int *)(v1 + 684);
          v7 = objc_msgSend(v17, "sr_rspcreditsgranted");
          do
            v8 = __ldaxr(v6);
          while (__stlxr(v8 + v7, v6));
        }
        else
        {
          pthread_mutex_lock((pthread_mutex_t *)(v1 + 608));
          v9 = (unsigned int *)(v1 + 680);
          v10 = objc_msgSend(v17, "sr_rspcreditsgranted");
          do
            v11 = __ldaxr(v9);
          while (__stlxr(v11 + v10, v9));
          v12 = atomic_load((unsigned int *)(v1 + 680));
          v13 = atomic_load((unsigned int *)(v1 + 688));
          if (v13 < v12)
          {
            if (v12 >= 0xFFFF)
              v12 = 0xFFFF;
            atomic_store(v12, (unsigned int *)(v1 + 688));
          }
          v14 = (unsigned int *)(v1 + 692);
          if (atomic_load((unsigned int *)(v1 + 692)))
          {
            do
              v16 = __ldaxr(v14);
            while (__stlxr(v16 - 1, v14));
            pthread_cond_signal((pthread_cond_t *)(v1 + 696));
          }
        }
        pthread_mutex_unlock(v5);
        v3 = v17;
      }
    }
  }

}

void smb_rq_bend(void *a1)
{
  id v1;
  unint64_t v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (objc_msgSend(v1, "sr_bcount"))
  {
    v2 = *(_QWORD *)(objc_msgSend(v1, "smb_rq_getrequest") + 24);
    if (v2 >= 0x10000)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb_rq_bend_cold_2();
      LOWORD(v2) = -1;
    }
    *(_WORD *)objc_msgSend(v1, "sr_bcount") = v2;
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      smb_rq_bend_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

void smb_rq_bend32(void *a1)
{
  id v1;
  unint64_t v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (objc_msgSend(v1, "sr_lcount"))
  {
    v2 = *(_QWORD *)(objc_msgSend(v1, "smb_rq_getrequest") + 24);
    if (HIDWORD(v2))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb_rq_bend32_cold_2();
      LODWORD(v2) = 0xFFFFFFF;
    }
    *(_DWORD *)objc_msgSend(v1, "sr_lcount") = v2;
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      smb_rq_bend32_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

void smb_rq_bstart(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = objc_msgSend(v1, "smb_rq_getrequest");
  objc_msgSend(v1, "setSr_bcount:", mb_reserve(v2, 2uLL));

  *(_QWORD *)(v2 + 24) = 0;
}

void smb_rq_cancel_all_requests(pthread_mutex_t *a1, void *a2, _DWORD *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  int v17;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  smb_rq_find(a1, v9, 0, 0, 0, 0, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      if ((objc_msgSend(v13, "sr_extflags") & 2) == 0)
      {
        objc_msgSend(v13, "smb_rq_set_extflag:", 16);
        smb_rq_dequeue(a1, v9, a3, v10, v13);
        if ((objc_msgSend(v13, "sr_extflags") & 4) != 0)
        {
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = __smb_rq_cancel_all_requests_block_invoke;
          v15[3] = &unk_24FE01758;
          v16 = v13;
          v17 = 57;
          dispatch_async(v11, v15);

        }
      }
      smb_rq_find(a1, v9, 0, 0, 0, 0, 1);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    while (v14);
  }

}

id smb_rq_find(pthread_mutex_t *a1, void *a2, uint64_t a3, _BOOL4 *a4, uint64_t *a5, _QWORD *a6, char a7)
{
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  char v27;
  __darwin_suseconds_t tv_usec;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  id v37;
  id v38;
  _BOOL4 *v39;
  uint64_t v40;
  _BOOL4 v42;
  __int128 v44;
  _BOOL4 *v45;
  pthread_mutex_t *v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  timeval v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v52.tv_sec = 0;
  *(_QWORD *)&v52.tv_usec = 0;
  pthread_mutex_lock(a1);
  v12 = objc_msgSend(v11, "count");
  if (!v12)
  {
    if (a4)
      *a4 = 1;
    if (a5)
      *a5 = 0;
    if (a6)
      *a6 = 0;
    pthread_mutex_unlock(a1);
    v37 = 0;
    goto LABEL_56;
  }
  v14 = v12;
  v45 = a4;
  v46 = a1;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v47 = 0;
  v49 = 0;
  v50 = 0;
  v18 = 0;
  *(_QWORD *)&v13 = 136315650;
  v44 = v13;
  v19 = a5;
  while (1)
  {
    v20 = v16;
    objc_msgSend(v11, "objectAtIndexedSubscript:", v18, v44);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      break;
LABEL_29:
    if (v14 == ++v18)
      goto LABEL_39;
  }
  if ((objc_msgSend(v16, "sr_flags") & 2) == 0)
  {
    if (!v17)
      goto LABEL_9;
    v21 = objc_msgSend(v16, "sr_credit_timesent");
    v23 = v50 <= v21;
    if (v50 == v21)
      v23 = v49 <= v22;
    if (!v23)
    {
LABEL_9:
      v47 = objc_msgSend(v16, "sr_messageid");
      v24 = objc_msgSend(v16, "sr_credit_timesent");
      v49 = v25;
      v50 = v24;
    }
    v17 = 1;
  }
  if ((a7 & 1) == 0)
  {
    if (objc_msgSend(v16, "sr_messageid") != a3)
    {
LABEL_15:
      v27 = objc_msgSend(v16, "sr_extflags");
      if (a6
        && (v27 & 4) != 0
        && (objc_msgSend(v16, "sr_flags") & 2) == 0
        && (objc_msgSend(v16, "sr_flags") & 0x200) == 0)
      {
        gettimeofday(&v52, 0);
        tv_usec = v52.tv_usec;
        v29 = -121;
        if (v52.tv_usec >= 0)
          v29 = -120;
        v30 = v29 + v52.tv_sec;
        v31 = objc_msgSend(v16, "sr_timesent");
        v33 = v30 <= v31;
        if (v30 == v31)
        {
          v34 = 1000 * tv_usec;
          if (tv_usec < 0)
            v34 += 1000000000;
          v33 = v34 <= v32;
        }
        v19 = a5;
        if (!v33)
        {
          objc_msgSend(v16, "smb_rq_set_extflag:", 4);
          objc_msgSend(v16, "setSr_extflags:", objc_msgSend(v16, "sr_extflags") & 0xFFFFFFFBLL);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v35 = objc_msgSend(v16, "sr_command");
            v36 = objc_msgSend(v16, "sr_messageid");
            *(_DWORD *)buf = v44;
            v54 = "smb_rq_find";
            v55 = 1024;
            v56 = v35;
            v57 = 2048;
            v58 = v36;
            _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Timed out waiting on the response for <0x%x> message_id = <%lld> \n", buf, 0x1Cu);
          }
          *a6 = objc_retainAutorelease(v16);
        }
      }
      goto LABEL_29;
    }
    v26 = v16;

    if (v19)
    {
      v15 = v26;
      goto LABEL_15;
    }
    pthread_mutex_unlock(v46);
    v15 = v26;
LABEL_44:
    v39 = v45;
    if (!v45)
      goto LABEL_55;
    goto LABEL_48;
  }
  v38 = v16;

  v15 = v38;
  v19 = a5;
LABEL_39:
  pthread_mutex_unlock(v46);
  if (!v19)
    goto LABEL_44;
  if (v17)
  {
    v39 = v45;
    v40 = v47;
  }
  else
  {
    v39 = v45;
    v40 = v47;
    if (v15)
      v40 = objc_msgSend(v15, "sr_messageid");
  }
  *a5 = v40;
  if (v39)
  {
LABEL_48:
    v42 = v14 == 1 && v15 != 0;
    *v39 = v42;
  }
LABEL_55:
  v37 = v15;

LABEL_56:
  return v37;
}

void smb_rq_dequeue(pthread_mutex_t *a1, void *a2, _DWORD *a3, void *a4, void *a5)
{
  NSObject *v9;
  id v10;
  id v11;

  v11 = a2;
  v9 = a4;
  v10 = a5;
  pthread_mutex_lock(a1);
  objc_msgSend(v11, "removeObjectIdenticalTo:", v10);

  if (*a3 == 1 && !objc_msgSend(v11, "count"))
  {
    *a3 = 0;
    dispatch_suspend(v9);
  }
  pthread_mutex_unlock(a1);

}

uint64_t __smb_rq_cancel_all_requests_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smb_rq_callback:", *(unsigned int *)(a1 + 40));
}

void smb_rq_empty_queue(pthread_mutex_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pthread_mutex_lock(a1);
  objc_msgSend(v3, "lastObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)v4;
    v7 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v5 = 136315650;
    v11 = v5;
    do
    {
      objc_msgSend(v3, "removeLastObject", v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(v6, "sr_messageid");
        v10 = objc_msgSend(v6, "sr_command");
        *(_DWORD *)buf = v11;
        v13 = "smb_rq_empty_queue";
        v14 = 2048;
        v15 = v9;
        v16 = 1024;
        v17 = v10;
        _os_log_error_impl(&dword_23028F000, v7, OS_LOG_TYPE_ERROR, "%s: rqp with message ID <%lld> cmd <%d> left on queue \n", buf, 0x1Cu);
      }
      objc_msgSend(v6, "smb_rq_done");
      objc_msgSend(v3, "lastObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    while (v8);
  }
  pthread_mutex_unlock(a1);

}

void smb_rq_enqueue(pthread_mutex_t *a1, void *a2, _DWORD *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  NSObject *object;

  object = a4;
  v9 = a5;
  v10 = a2;
  pthread_mutex_lock(a1);
  objc_msgSend(v10, "addObject:", v9);

  if (!*a3)
  {
    *a3 = 1;
    dispatch_resume(object);
  }
  pthread_mutex_unlock(a1);

}

id smb_rq_find_cmpd(pthread_mutex_t *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a2;
  pthread_mutex_lock(a1);
  v8 = objc_msgSend(v7, "count");
  if (!v8)
  {
    if (a4)
      *a4 = 0;
    pthread_mutex_unlock(a1);
    v17 = 0;
    goto LABEL_19;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  while (1)
  {
    v12 = v11;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      break;
LABEL_9:
    if (++v10 == v9)
    {
      v13 = 0;
      v17 = 0;
      goto LABEL_12;
    }
  }
  v13 = v11;
  objc_msgSend(v13, "sr_next_rqp");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_8:

    goto LABEL_9;
  }
  v15 = (void *)v14;
  while (objc_msgSend(v15, "sr_messageid") != a3)
  {
    objc_msgSend(v15, "sr_next_rqp");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
    if (!v16)
      goto LABEL_8;
  }
  v17 = v15;
LABEL_12:
  pthread_mutex_unlock(a1);
  if (a4 && v17)
    *a4 = objc_retainAutorelease(v13);

LABEL_19:
  return v17;
}

void smb_rq_handle_async_pending(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_msgSend(v3, "smb_rq_set_extflag:", 32);
  objc_msgSend(v3, "setSr_rspasyncid:", *(_QWORD *)(a2 + 32));
  objc_msgSend(v3, "setSr_rspcreditsgranted:", *(unsigned __int16 *)(a2 + 14));
  smb2_rq_credit_increment(v3);
  smb_rq_set_time_sent(v3, 1);

}

void smb_rq_set_time_sent(void *a1, int a2)
{
  __darwin_time_t tv_sec;
  uint64_t v4;
  id v5;
  timeval v6;

  v5 = a1;
  v6.tv_sec = 0;
  *(_QWORD *)&v6.tv_usec = 0;
  gettimeofday(&v6, 0);
  tv_sec = v6.tv_sec;
  v4 = 1000 * v6.tv_usec;
  if (!a2)
    objc_msgSend(v5, "setSr_credit_timesent:", v6.tv_sec, 1000 * v6.tv_usec);
  objc_msgSend(v5, "setSr_timesent:", tv_sec, v4);

}

uint64_t smb_rq_simple(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "smb_rq_set_srflags:", 2048);
  if (objc_msgSend(v3, "sr_command") == 2)
    v5 = 5;
  else
    v5 = 0;
  v6 = smb_rq_simple_timed(v4, v3, v5);

  return v6;
}

uint64_t smb_rq_simple_timed(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  uint64_t v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  intptr_t (*v19)(uint64_t, int);
  void *v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint8_t buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v7 = dispatch_semaphore_create(0);
  objc_msgSend(v5, "sock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    v12 = 57;
  }
  else
  {
    objc_msgSend(v6, "setSr_timeout:", a3);
    if ((objc_msgSend(v6, "sr_flags") & 0x800) != 0)
    {
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __smb_rq_simple_timed_block_invoke;
      v20 = &unk_24FE01780;
      v22 = &v23;
      v21 = v7;
      objc_msgSend(v6, "setSr_callback:", &v17);

    }
    objc_msgSend(v5, "sock", v17, v18, v19, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "sendRequest:", v6);
    *((_DWORD *)v24 + 6) = v11;

    if (*((_DWORD *)v24 + 6))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb_rq_simple_timed_cold_2();
    }
    else if ((objc_msgSend(v6, "sr_flags") & 0x800) != 0)
    {
      if (objc_msgSend(v6, "sr_timeout"))
      {
        v13 = dispatch_time(0, 1000000000 * objc_msgSend(v6, "sr_timeout"));
        if (dispatch_semaphore_wait(v7, v13))
        {
          v14 = MEMORY[0x24BDACB70];
          v15 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            smb_rq_simple_timed_cold_1(objc_msgSend(v6, "sr_command"), buf, objc_msgSend(v6, "sr_timeout"));

          *((_DWORD *)v24 + 6) = 60;
        }
      }
      else
      {
        dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    v12 = *((unsigned int *)v24 + 6);
  }

  _Block_object_dispose(&v23, 8);
  return v12;
}

void sub_2302A6EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t smb_rq_simple_block(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "sock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "setSr_callback:", v7);
    objc_msgSend(v6, "setSr_timeout:", 0);
    objc_msgSend(v5, "sock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sendRequest:", v6);

    if ((_DWORD)v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb_rq_simple_block_cold_1();
  }
  else
  {
    v10 = 57;
  }

  return v10;
}

intptr_t __smb_rq_simple_timed_block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t smb2_rq_align8(void *a1)
{
  uint64_t result;

  result = objc_msgSend(a1, "smb_rq_getrequest");
  if ((*(_QWORD *)(result + 32) & 7) != 0)
    return mb_put_mem(result, 0, 8 - (*(_QWORD *)(result + 32) & 7), 3);
  return result;
}

uint64_t smb2_rq_alloc(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, void *a5, _QWORD *a6)
{
  id v11;
  uint64_t v12;
  SMB_rq *v13;
  SMB_rq *v14;
  SMB_rq *v15;
  uint64_t v16;
  pthread_mutex_t *v17;
  int v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  unsigned int v36;
  int v37;
  unsigned int v39;
  int v40;
  unsigned int v41;
  unsigned int v42;
  unint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  unint64_t v47;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  SMB_rq *v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  BOOL v56;
  unsigned __int16 v57;
  int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  mbchain *v62;
  mdchain *v63;
  uint64_t v64;
  double v65;
  char v66;
  unsigned __int16 v67;
  unsigned __int16 v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  char *v73;
  unsigned int v75;
  _QWORD *v76;
  timeval v77;
  timespec v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  unsigned int v82;
  __int16 v83;
  unsigned int v84;
  __int16 v85;
  unint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  unsigned int v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = objc_msgSend(v11, "getSessionPtr");
  v13 = objc_alloc_init(SMB_rq);
  v14 = v13;
  if (!v13)
  {
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
      smb2_rq_alloc_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
    v27 = 12;
    goto LABEL_69;
  }
  -[SMB_rq setSr_command:](v13, "setSr_command:", a1);
  -[SMB_rq setSr_creditcharge:](v14, "setSr_creditcharge:", 1);
  -[SMB_rq setSr_creditsrequested:](v14, "setSr_creditsrequested:", 1);
  -[SMB_rq setSr_rqtreeid:](v14, "setSr_rqtreeid:", 0);
  -[SMB_rq setSr_rqsessionid:](v14, "setSr_rqsessionid:", *(_QWORD *)(v12 + 568));
  -[SMB_rq setWriteData:](v14, "setWriteData:", 0);
  -[SMB_rq setWriteLen:](v14, "setWriteLen:", 0);
  -[SMB_rq setSr_pd:](v14, "setSr_pd:", v11);
  -[SMB_rq smb_rq_set_extflag:](v14, "smb_rq_set_extflag:", 1);
  -[SMB_rq setSr_sessionp:](v14, "setSr_sessionp:", v12);
  -[SMB_rq setOnEncryptedShare:](v14, "setOnEncryptedShare:", a3);
  v15 = v14;
  v78.tv_sec = 0;
  v78.tv_nsec = 0;
  v77.tv_sec = 0;
  *(_QWORD *)&v77.tv_usec = 0;
  v16 = -[SMB_rq sr_sessionp](v15, "sr_sessionp");
  v17 = (pthread_mutex_t *)(v16 + 608);
  pthread_mutex_lock((pthread_mutex_t *)(v16 + 608));
  v18 = -[SMB_rq sr_command](v15, "sr_command");
  if (v18 <= 1)
  {
    if (v18)
    {
      if (v18 != 1)
        goto LABEL_13;
      -[SMB_rq setSr_creditsrequested:](v15, "setSr_creditsrequested:", 256);
    }
    else
    {
      -[SMB_rq setSr_creditcharge:](v15, "setSr_creditcharge:", 0);
      -[SMB_rq setSr_creditsrequested:](v15, "setSr_creditsrequested:", 0);
      atomic_store(0, (unsigned int *)(v16 + 680));
      atomic_store(0, (unsigned int *)(v16 + 684));
      atomic_store(0, (unsigned int *)(v16 + 688));
    }
  }
  else if ((v18 - 2) >= 2)
  {
    if (v18 == 18)
    {
LABEL_17:
      v75 = a2;
      v76 = a6;
      v28 = (unsigned int *)(v16 + 680);
      v29 = (unsigned int *)(v16 + 692);
LABEL_18:
      while (1)
      {
        v30 = atomic_load(v28);
        if ((int)v30 >= 1)
        {
          if (!*(_DWORD *)(v16 + 744))
            break;
          v31 = atomic_load((unint64_t *)(v16 + 672));
          v32 = *(_QWORD *)(v16 + 752);
          v33 = atomic_load((unint64_t *)(v16 + 672));
          v34 = v31 <= v32 ? v33 + ~v32 : v33 - *(_QWORD *)(v16 + 752);
          if (v34 <= v30)
            break;
        }
        if (-[SMB_rq sr_command](v15, "sr_command") == 13
          || (-[SMB_rq sr_extflags](v15, "sr_extflags") & 0x80000000) != 0)
        {
          v27 = 55;
          goto LABEL_41;
        }
        if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v42 = atomic_load((unsigned int *)(v16 + 688));
          v43 = atomic_load((unint64_t *)(v16 + 672));
          v44 = *(_QWORD *)(v16 + 752);
          v45 = atomic_load((unsigned int *)(v16 + 692));
          *(_DWORD *)buf = 136316418;
          v80 = "smb2_rq_credit_decrement";
          v81 = 1024;
          v82 = v30;
          v83 = 1024;
          v84 = v42;
          v85 = 2048;
          v86 = v43;
          v87 = 2048;
          v88 = v44;
          v89 = 1024;
          v90 = v45;
          _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Wait for credits curr %d max %d curr ID %lld pending ID %lld session_credits_wait %d\n", buf, 0x32u);
        }
        v35 = 1;
        while (1)
        {
          do
            v36 = __ldaxr(v29);
          while (__stlxr(v36 + 1, v29));
          v78 = (timespec)xmmword_2302C57F0;
          gettimeofday(&v77, 0);
          v78.tv_sec += v77.tv_sec;
          v78.tv_nsec += 1000 * v77.tv_usec;
          v37 = pthread_cond_timedwait((pthread_cond_t *)(v16 + 696), v17, &v78);
          if (v37 != 60 && v37 != 35)
            break;
          if (atomic_load(v29))
          {
            do
              v39 = __ldaxr(v29);
            while (__stlxr(v39 - 1, v29));
          }
          v40 = atomic_load(v28);
          if (v40 > 0)
            break;
          if (++v35 == 61)
          {
            v41 = atomic_load(v28);
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v46 = atomic_load((unsigned int *)(v16 + 688));
              v47 = atomic_load((unint64_t *)(v16 + 672));
              v48 = *(_QWORD *)(v16 + 752);
              v49 = atomic_load((unsigned int *)(v16 + 692));
              *(_DWORD *)buf = 136316418;
              v80 = "smb2_rq_credit_decrement";
              v81 = 1024;
              v82 = v41;
              v83 = 1024;
              v84 = v46;
              v85 = 2048;
              v86 = v47;
              v87 = 2048;
              v88 = v48;
              v89 = 1024;
              v90 = v49;
              _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Timed out waiting for credits curr %d max %d curr ID %lld pending ID %lld session_credits_wait %d\n", buf, 0x32u);
            }
            pthread_mutex_unlock(v17);
            pthread_mutex_lock(v17);
            goto LABEL_18;
          }
        }
      }
      if (a4)
      {
        v50 = *a4;
        v51 = v15;
        v52 = -[SMB_rq sr_sessionp](v51, "sr_sessionp");
        if (v50 > 0x10000)
        {
          v53 = atomic_load((unsigned int *)(v52 + 680));
          if (v53 >= 11)
          {
            v54 = (__int16)(((v50 - 1) >> 16) + 1) + 10;
            v55 = (v53 - 10) << 16;
            v56 = v54 <= v53;
            if (v54 <= v53)
              v57 = ((v50 - 1) >> 16) + 1;
            else
              v57 = v53 - 10;
            if (!v56)
              v50 = v55;
            -[SMB_rq setSr_creditcharge:](v51, "setSr_creditcharge:", v57);
          }
          else
          {
            v50 = 0x10000;
          }
        }

        *a4 = v50;
      }
      v58 = (__int16)-[SMB_rq sr_creditcharge](v15, "sr_creditcharge");
      do
        v59 = __ldaxr(v28);
      while (__stlxr(v59 - v58, v28));
      v60 = atomic_load(v28);
      a6 = v76;
      a2 = v75;
      if (v60 <= 65534)
      {
        -[SMB_rq setSr_creditsrequested:](v15, "setSr_creditsrequested:", 256);
        if (v60 < 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_rq_alloc_cold_4();
      }
      goto LABEL_59;
    }
LABEL_13:
    if ((*(_BYTE *)(v16 + 553) & 0x10) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_rq_alloc_cold_2(v15);
      v27 = 73;
LABEL_41:
      pthread_mutex_unlock(v17);

      -[SMB_rq setSr_creditcharge:](v15, "setSr_creditcharge:", 0);
      goto LABEL_64;
    }
    goto LABEL_17;
  }
LABEL_59:
  pthread_mutex_unlock(v17);

  v61 = -[SMB_rq sr_command](v15, "sr_command");
  if (v61 > 0xD || ((1 << v61) & 0x300F) == 0)
    -[SMB_rq setSr_rqtreeid:](v15, "setSr_rqtreeid:", a2);
  v62 = -[SMB_rq smb_rq_getrequest](v15, "smb_rq_getrequest");
  v63 = -[SMB_rq smb_rq_getreply](v15, "smb_rq_getreply");
  mb_done(v62);
  md_done(v63);
  v65 = mb_init((uint64_t)v62);
  if ((_DWORD)v64)
  {
    v27 = v64;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb2_rq_alloc_cold_3();
LABEL_64:
    -[SMB_rq smb_rq_done](v15, "smb_rq_done");
    goto LABEL_69;
  }
  v66 = -[SMB_rq sr_flags](v15, "sr_flags", v65);
  mb_put_mem((uint64_t)v62, "\xFESMB", 4uLL, 0);
  mb_put_uint16le((uint64_t)v62, 64);
  -[SMB_rq setSr_creditchargep:](v15, "setSr_creditchargep:", mb_reserve((uint64_t)v62, 2uLL));
  v67 = -[SMB_rq sr_creditcharge](v15, "sr_creditcharge");
  *-[SMB_rq sr_creditchargep](v15, "sr_creditchargep") = v67;
  mb_put_uint32le((uint64_t)v62, 0);
  mb_put_uint16le((uint64_t)v62, -[SMB_rq sr_command](v15, "sr_command"));
  -[SMB_rq setSr_creditreqp:](v15, "setSr_creditreqp:", mb_reserve((uint64_t)v62, 2uLL));
  v68 = -[SMB_rq sr_creditsrequested](v15, "sr_creditsrequested");
  *-[SMB_rq sr_creditreqp](v15, "sr_creditreqp") = v68;
  -[SMB_rq setSr_flagsp:](v15, "setSr_flagsp:", mb_reserve((uint64_t)v62, 4uLL));
  v69 = -[SMB_rq sr_rqflags](v15, "sr_rqflags");
  if ((v66 & 2) != 0)
  {
    -[SMB_rq setSr_rqflags:](v15, "setSr_rqflags:", v69 | 2);
    v71 = -[SMB_rq sr_rqflags](v15, "sr_rqflags");
    *-[SMB_rq sr_flagsp](v15, "sr_flagsp") = v71;
    -[SMB_rq setSr_nextcmdp:](v15, "setSr_nextcmdp:", mb_reserve((uint64_t)v62, 4uLL));
    v72 = -[SMB_rq sr_nextcmd](v15, "sr_nextcmd");
    *-[SMB_rq sr_nextcmdp](v15, "sr_nextcmdp") = v72;
    -[SMB_rq setSr_messageidp:](v15, "setSr_messageidp:", mb_reserve((uint64_t)v62, 8uLL));
    *-[SMB_rq sr_messageidp](v15, "sr_messageidp") = 0;
    mb_put_uint64le((uint64_t)v62, 0);
  }
  else
  {
    *-[SMB_rq sr_flagsp](v15, "sr_flagsp") = v69;
    -[SMB_rq setSr_nextcmdp:](v15, "setSr_nextcmdp:", mb_reserve((uint64_t)v62, 4uLL));
    v70 = -[SMB_rq sr_nextcmd](v15, "sr_nextcmd");
    *-[SMB_rq sr_nextcmdp](v15, "sr_nextcmdp") = v70;
    -[SMB_rq setSr_messageidp:](v15, "setSr_messageidp:", mb_reserve((uint64_t)v62, 8uLL));
    *-[SMB_rq sr_messageidp](v15, "sr_messageidp") = 0;
    mb_put_uint32le((uint64_t)v62, 65279);
    mb_put_uint32le((uint64_t)v62, -[SMB_rq sr_rqtreeid](v15, "sr_rqtreeid"));
  }
  mb_put_uint64le((uint64_t)v62, -[SMB_rq sr_rqsessionid](v15, "sr_rqsessionid"));
  -[SMB_rq setSr_rqsigp:](v15, "setSr_rqsigp:", mb_reserve((uint64_t)v62, 0x10uLL));
  v73 = -[SMB_rq sr_rqsigp](v15, "sr_rqsigp");
  *(_QWORD *)v73 = 0;
  *((_QWORD *)v73 + 1) = 0;
  v27 = 0;
  *a6 = objc_retainAutorelease(v15);
LABEL_69:

  return v27;
}

void smb2_rq_bstart(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  v4 = objc_msgSend(v3, "smb_rq_getrequest");
  objc_msgSend(v3, "setSr_bcount:", a2);

  *(_QWORD *)(v4 + 24) = 0;
}

void smb2_rq_bstart32(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  v4 = objc_msgSend(v3, "smb_rq_getrequest");
  objc_msgSend(v3, "setSr_lcount:", a2);

  *(_QWORD *)(v4 + 24) = 0;
}

uint64_t smb2_rq_credit_start(uint64_t a1, int a2)
{
  pthread_mutex_t *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v12;

  v4 = (pthread_mutex_t *)(a1 + 608);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 608));
  v5 = (unsigned int *)(a1 + 680);
  if (a2)
  {
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 + a2, v5));
  }
  else
  {
    v7 = atomic_load((unsigned int *)(a1 + 684));
    do
      v8 = __ldaxr(v5);
    while (__stlxr(v8 + v7, v5));
  }
  v9 = atomic_load((unsigned int *)(a1 + 680));
  atomic_store(v9, (unsigned int *)(a1 + 688));
  *(_DWORD *)(a1 + 744) = 0;
  *(_QWORD *)(a1 + 752) = 0;
  v10 = (unsigned int *)(a1 + 692);
  if (atomic_load((unsigned int *)(a1 + 692)))
  {
    do
      v12 = __ldaxr(v10);
    while (__stlxr(v12 - 1, v10));
    pthread_cond_signal((pthread_cond_t *)(a1 + 696));
  }
  return pthread_mutex_unlock(v4);
}

uint64_t smb2_rq_message_id_increment(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  pthread_mutex_t *v4;
  __int16 v5;
  unint64_t *v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;

  v1 = a1;
  v2 = objc_msgSend(v1, "sr_sessionp");
  if (!v1)
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v16)
      smb2_rq_message_id_increment_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_17;
  }
  v3 = v2;
  if (!v2)
  {
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v24)
      smb2_rq_message_id_increment_cold_2(v24, v25, v26, v27, v28, v29, v30, v31);
LABEL_17:
    v32 = 12;
    goto LABEL_22;
  }
  v4 = (pthread_mutex_t *)(v2 + 608);
  pthread_mutex_lock((pthread_mutex_t *)(v2 + 608));
  if (objc_msgSend(v1, "sr_command"))
  {
    v5 = objc_msgSend(v1, "sr_flags");
    v6 = (unint64_t *)(v3 + 672);
    v7 = objc_msgSend(v1, "sr_creditcharge");
    do
      v8 = __ldaxr(v6);
    while (__stlxr(v8 + v7, v6));
    objc_msgSend(v1, "setSr_messageid:");
    v9 = objc_msgSend(v1, "sr_messageid");
    *(_QWORD *)objc_msgSend(v1, "sr_messageidp") = v9;
    if ((v5 & 0x100) != 0)
    {
      objc_msgSend(v1, "sr_next_rqp");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        do
        {
          v12 = objc_msgSend(v11, "sr_creditcharge");
          do
            v13 = __ldaxr(v6);
          while (__stlxr(v13 + v12, v6));
          objc_msgSend(v11, "setSr_messageid:");
          v14 = objc_msgSend(v11, "sr_messageid");
          *(_QWORD *)objc_msgSend(v11, "sr_messageidp") = v14;
          objc_msgSend(v11, "sr_next_rqp");
          v15 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v15;
        }
        while (v15);
      }
    }
  }
  else
  {
    v33 = (unint64_t *)(v3 + 672);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 + 1, v33));
    objc_msgSend(v1, "setSr_messageid:");
    v35 = objc_msgSend(v1, "sr_messageid");
    *(_QWORD *)objc_msgSend(v1, "sr_messageidp") = v35;
  }
  pthread_mutex_unlock(v4);
  v32 = 0;
LABEL_22:

  return v32;
}

uint64_t smb2_rq_next_command(void *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t mem;

  v5 = *a2 + objc_msgSend(a1, "sr_rspnextcmd");
  *a2 = v5;
  v6 = v5 - a3[3];
  if (v6 < 1)
    return 0;
  mem = md_get_mem(a3, 0, v6, 0);
  if ((_DWORD)mem && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    smb2_rq_next_command_cold_1();
  return mem;
}

uint64_t smb2_rq_parse_header(void *a1, __int128 **a2)
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  __int128 *v7;
  __int128 v8;
  unsigned int uint32le;
  char v10;
  __int128 *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unsigned __int16 v28;
  unsigned int v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  __int16 v34;
  __int16 v35;
  __int16 v36;
  int v37;
  char __dst[16];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v37 = 0;
  v36 = 0;
  v35 = 0;
  v34 = 0;
  v32 = 0;
  v33 = 0;
  v30 = 0u;
  v31 = 0u;
  v4 = objc_msgSend(v3, "sr_sessionp");
  v5 = objc_msgSend(v3, "sr_command");
  v29 = 0;
  v28 = 0;
  v27 = 0;
  if (v3)
  {
    v6 = v5;
    v7 = *a2;
    v8 = (*a2)[1];
    v30 = **a2;
    v31 = v8;
    uint32le = md_get_uint32le(v7, &v37);
    if (uint32le)
      goto LABEL_19;
    uint32le = md_get_uint16le(*a2, &v36);
    if (uint32le)
      goto LABEL_19;
    if (v36 == 64)
    {
      uint32le = md_get_uint16le(*a2, &v35);
      if (uint32le)
        goto LABEL_19;
      uint32le = md_get_uint32le(*a2, &v29);
      if (uint32le)
        goto LABEL_19;
      objc_msgSend(v3, "setSr_ntstatus:", v29);
      uint32le = md_get_uint16le(*a2, &v34);
      if (uint32le)
        goto LABEL_19;
      uint32le = md_get_uint16le(*a2, &v28);
      if (uint32le)
        goto LABEL_19;
      objc_msgSend(v3, "setSr_rspcreditsgranted:", v28);
      smb2_rq_credit_increment(v3);
      uint32le = md_get_uint32le(*a2, &v29);
      if (uint32le)
        goto LABEL_19;
      objc_msgSend(v3, "setSr_rspflags:", v29);
      uint32le = md_get_uint32le(*a2, &v29);
      if (uint32le)
        goto LABEL_19;
      objc_msgSend(v3, "setSr_rspnextcmd:", v29);
      uint32le = md_get_uint64le(*a2, &v33);
      if (uint32le)
        goto LABEL_19;
      v10 = objc_msgSend(v3, "sr_rspflags");
      v11 = *a2;
      if ((v10 & 2) == 0)
      {
        uint32le = md_get_uint32le(v11, &v29);
        if (uint32le)
          goto LABEL_19;
        objc_msgSend(v3, "setSr_rsppid:", v29);
        uint32le = md_get_uint32le(*a2, &v29);
        if (uint32le)
          goto LABEL_19;
        objc_msgSend(v3, "setSr_rsptreeid:", v29);
        goto LABEL_31;
      }
      uint32le = md_get_uint64le(v11, &v32);
      if (uint32le)
        goto LABEL_19;
      v24 = v32;
      if (v24 == objc_msgSend(v3, "sr_rspasyncid"))
      {
LABEL_31:
        uint32le = md_get_uint64le(*a2, &v27);
        if (uint32le)
          goto LABEL_19;
        objc_msgSend(v3, "setSr_rspsessionid:", v27);
        uint32le = md_get_mem(*a2, __dst, 16, 0);
        if (uint32le)
          goto LABEL_19;
        v25 = *(_QWORD *)(v4 + 552);
        if ((v25 & 0x28800) != 0)
        {
          if ((*(_WORD *)(v4 + 68) & 4) == 0)
          {
            if (v6 <= 3 && v6 != 2)
              goto LABEL_42;
            if (!objc_msgSend(v3, "onEncryptedShare", v27))
            {
              v25 = *(_QWORD *)(v4 + 552);
              goto LABEL_42;
            }
LABEL_45:
            uint32le = piston_ntstatus_to_errno(objc_msgSend(v3, "sr_ntstatus", v27));
            v26 = objc_msgSend(v3, "sr_ntstatus");
            if (v26 == -1073740964)
            {
              if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_rq_parse_header_cold_3(v3);
            }
            else if (v26 == -1073741670
                   && piston_log_level
                   && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              smb2_rq_parse_header_cold_2(v3);
            }
            goto LABEL_19;
          }
          if (v6)
            goto LABEL_45;
        }
LABEL_42:
        if ((v25 & 8) != 0 || (objc_msgSend(v3, "sr_flags") & 0x400) != 0)
        {
          uint32le = smb2_rq_verify(v3, (uint64_t)&v30, __dst);
          if (uint32le)
            goto LABEL_19;
        }
        goto LABEL_45;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb2_rq_parse_header_cold_4(&v33, &v32, v3);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      smb2_rq_parse_header_cold_5();
    }
    uint32le = 72;
    goto LABEL_19;
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v12)
    smb2_rq_parse_header_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  uint32le = 12;
LABEL_19:
  v20 = objc_msgSend(v3, "sr_command", v27);
  if (uint32le == 16 && v20 == 5)
    v22 = 35;
  else
    v22 = uint32le;
  objc_msgSend(v3, "setReplyError:", v22);

  return v22;
}

uint64_t OUTLINED_FUNCTION_5_3@<X0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 8) = x8_0;
  return objc_msgSend(a1, "sr_command");
}

void piston_smb3_derive_keys(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t __buf;
  __int128 macOut;
  CCHmacContext ctx;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "getSessionPtr");
    if (v3)
    {
      v4 = v3;
      *(_DWORD *)(v3 + 260) = 0;
      *(_DWORD *)(v3 + 488) = 0;
      *(_DWORD *)(v3 + 528) = 0;
      memset(&ctx, 0, sizeof(ctx));
      __buf = 0;
      v5 = v3 + 224;
      CCHmacInit(&ctx, 1u, *(const void **)(v3 + 216), *(unsigned int *)(v3 + 224));
      arc4random_buf(&__buf, 8uLL);
      CCHmacUpdate(&ctx, &__buf, 8uLL);
      CCHmacFinal(&ctx, &macOut);
      *(_OWORD *)(v5 + 312) = macOut;
      if (*(_QWORD *)(v5 - 8))
      {
        if (*(_DWORD *)v5 > 0xFu)
        {
          if ((*(_BYTE *)(v4 + 554) & 2) != 0)
          {
            *(_OWORD *)ctx.ctx = *(_OWORD *)"SMBSigningKey";
          }
          else
          {
            macOut = *(_OWORD *)"SmbSign";
            *(_OWORD *)ctx.ctx = *(_OWORD *)"SMB2AESCMAC";
          }
          if (piston_smb3_kdf_hmac_sha256())
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              piston_smb3_derive_keys_cold_7();
          }
          else
          {
            *(_DWORD *)(v4 + 260) = 16;
            *(_QWORD *)(v4 + 456) = 0;
            *(_QWORD *)(v4 + 464) = 0;
            *(_DWORD *)(v4 + 488) = 0;
            if ((*(_BYTE *)(v4 + 554) & 2) != 0)
            {
              strcpy((char *)&ctx, "SMBC2SCipherKey");
              if (*(unsigned __int16 *)(v4 + 492) - 3 > 1)
                v30 = 16;
              else
                v30 = 32;
            }
            else
            {
              macOut = *(_OWORD *)"ServerIn ";
              *(_OWORD *)ctx.ctx = *(_OWORD *)"SMB2AESCCM";
              v30 = 16;
            }
            if (piston_smb3_kdf_hmac_sha256())
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                piston_smb3_derive_keys_cold_6();
            }
            else
            {
              *(_DWORD *)(v4 + 488) = v30;
              if ((*(_BYTE *)(v4 + 554) & 2) != 0)
              {
                strcpy((char *)&ctx, "SMBS2CCipherKey");
                if (*(unsigned __int16 *)(v4 + 492) - 3 > 1)
                  v31 = 16;
                else
                  v31 = 32;
              }
              else
              {
                macOut = *(_OWORD *)"ServerOut";
                *(_OWORD *)ctx.ctx = *(_OWORD *)"SMB2AESCCM";
                v31 = 16;
              }
              if (piston_smb3_kdf_hmac_sha256())
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  piston_smb3_derive_keys_cold_5();
              }
              else
              {
                *(_DWORD *)(v4 + 528) = v31;
              }
            }
          }
        }
        else if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          piston_smb3_derive_keys_cold_4();
        }
      }
      else if (piston_log_level)
      {
        v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v22)
          piston_smb3_derive_keys_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    else
    {
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v14)
        piston_smb3_derive_keys_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      piston_smb3_derive_keys_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

uint64_t piston_smb3_kdf_hmac_sha256()
{
  uint64_t CtrHmac;

  CtrHmac = CCKDFParametersCreateCtrHmac();
  if (!(_DWORD)CtrHmac)
  {
    CtrHmac = CCDeriveKey();
    CCKDFParametersDestroy();
  }
  return CtrHmac;
}

double smb_reset_sig(uint64_t a1)
{
  void *v2;
  void *v3;
  double result;

  v2 = *(void **)(a1 + 216);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 216) = 0;
  }
  *(_DWORD *)(a1 + 224) = 0;
  v3 = *(void **)(a1 + 232);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 232) = 0;
  }
  *(_DWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 252) = 0;
  *(_QWORD *)(a1 + 244) = 0;
  *(_DWORD *)(a1 + 260) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_DWORD *)(a1 + 488) = 0;
  return result;
}

uint64_t smb2_rq_sign(void *a1)
{
  id v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  int *v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  uint32_t v29;
  uint64_t v30;
  _QWORD *v31;
  _OWORD *v32;
  _DWORD *v33;
  uint64_t *v34;
  uint64_t i;
  const void *v36;
  size_t v37;
  id v38;
  uint64_t v39;
  _QWORD *v40;
  _DWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  int *v46;
  int v47;
  id v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v59;
  uint64_t v60;
  uint8_t v61[4];
  uint64_t v62;
  uint8_t v63[4];
  uint64_t v64;
  uint64_t data;
  _OWORD macOut[2];
  CCHmacContext buf;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "sr_sessionp");
  v3 = objc_msgSend(v1, "sr_command");
  if (!v1)
  {
    if (piston_log_level)
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v5)
        smb2_rq_sign_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_44;
  }
  if (!v2)
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      smb2_rq_sign_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_44;
  }
  if (v3 < 2)
  {
    v4 = 0;
    goto LABEL_45;
  }
  if (!*(_QWORD *)(v2 + 216))
  {
    v50 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v50)
      smb2_rq_sign_cold_3(v50, v51, v52, v53, v54, v55, v56, v57);
LABEL_44:
    v4 = 22;
    goto LABEL_45;
  }
  v21 = *(_QWORD *)(v2 + 552) & 0x28800;
  v59 = v1;
  v22 = v1;
  v23 = &piston_log_level;
  v24 = MEMORY[0x24BDACB70];
  v60 = v21;
  do
  {
    v25 = v22;
    v26 = v25;
    if (v21)
    {
      v27 = objc_msgSend(v25, "sr_sessionp");
      v28 = (_QWORD *)objc_msgSend(v26, "sr_rqsigp");
      if (v28)
      {
        v29 = *(_DWORD *)(v27 + 260);
        if (v29 > 0xF)
        {
          v40 = v28;
          *v28 = 0;
          v28[1] = 0;
          v41 = (_DWORD *)objc_msgSend(v26, "sr_flagsp");
          *v41 |= 8u;
          v42 = (uint64_t *)objc_msgSend(v26, "smb_rq_getrequest");
          v43 = *v42;
          if (*v42)
          {
            v44 = 0;
            do
            {
              v44 += mbuf_len(v43);
              v43 = mbuf_next(v43);
            }
            while (v43);
          }
          else
          {
            v44 = 0;
          }
          v46 = v23;
          if (objc_msgSend(v26, "sr_command") == 9)
          {
            v47 = objc_msgSend(v26, "writeLen");
            objc_msgSend(v26, "writeData");
            v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v49 = objc_msgSend(v48, "bytes");

          }
          else
          {
            v49 = 0;
            v47 = 0;
          }
          smb3_get_signature(v27, v26, v42, 0, v44, v49, v47, (objc_msgSend(v26, "sr_flags") >> 8) & 1, v40);
          v23 = v46;
          v21 = v60;
        }
        else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          buf.ctx[0] = 136315394;
          *(_QWORD *)&buf.ctx[1] = "smb3_sign";
          LOWORD(buf.ctx[3]) = 1024;
          *(uint32_t *)((char *)&buf.ctx[3] + 2) = v29;
          _os_log_error_impl(&dword_23028F000, v24, OS_LOG_TYPE_ERROR, "%s: smb3 keylen %u\n", (uint8_t *)&buf, 0x12u);
        }
      }
      else if (*v23 && os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        smb2_rq_sign_cold_5(v61, &v62, v39);
      }
    }
    else
    {
      memset(&buf, 0, sizeof(buf));
      v30 = objc_msgSend(v25, "sr_sessionp");
      v31 = (_QWORD *)objc_msgSend(v26, "sr_rqsigp");
      data = 0;
      if (v31)
      {
        v32 = v31;
        memset(macOut, 0, sizeof(macOut));
        *v31 = 0;
        v31[1] = 0;
        v33 = (_DWORD *)objc_msgSend(v26, "sr_flagsp");
        *v33 |= 8u;
        v34 = (uint64_t *)objc_msgSend(v26, "smb_rq_getrequest");
        CCHmacInit(&buf, 2u, *(const void **)(v30 + 216), *(unsigned int *)(v30 + 224));
        for (i = *v34; i; i = mbuf_next(i))
        {
          v36 = (const void *)mbuf_data(i);
          v37 = mbuf_len(i);
          CCHmacUpdate(&buf, v36, v37);
        }
        if (objc_msgSend(v26, "sr_command") == 9)
        {
          objc_msgSend(v26, "writeData");
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CCHmacUpdate(&buf, (const void *)objc_msgSend(v38, "bytes"), objc_msgSend(v26, "writeLen"));

          if ((objc_msgSend(v26, "sr_flags") & 0x100) != 0 && (objc_msgSend(v26, "writeLen") & 7) != 0)
            CCHmacUpdate(&buf, &data, 8 - (objc_msgSend(v26, "writeLen") & 7));
        }
        CCHmacFinal(&buf, macOut);
        *v32 = macOut[0];
      }
      else if (*v23 && os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        smb2_rq_sign_cold_4(v63, &v64, v45);
      }
    }

    objc_msgSend(v26, "sr_next_rqp");
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  while (v22);
  v4 = 0;
  v1 = v59;
LABEL_45:

  return v4;
}

uint64_t smb2_rq_verify(void *a1, uint64_t a2, const void *a3)
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _BOOL8 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  void *v82;
  size_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  size_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  size_t v95;
  uint64_t v96;
  _BOOL8 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _BOOL8 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _BOOL8 v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _BOOL8 v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  _QWORD data[2];
  _BYTE macOut[16];
  CCHmacContext ctx;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = objc_msgSend(v5, "sr_sessionp");
  v7 = objc_msgSend(v5, "sr_command");
  if (v5)
  {
    if (!v6)
    {
      v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v34)
        smb2_rq_verify_cold_2(v34, v35, v36, v37, v38, v39, v40, v41);
      goto LABEL_24;
    }
    v8 = v7;
    LODWORD(v9) = objc_msgSend(v5, "sr_rspnextcmd");
    if ((*(_BYTE *)(v6 + 552) & 8) == 0 && (objc_msgSend(v5, "sr_flags") & 0x400) == 0)
    {
      if (piston_log_level)
      {
        v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v10)
          smb2_rq_verify_cold_3(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      goto LABEL_24;
    }
    v26 = 0;
    if (!*(_QWORD *)(v6 + 216) || v8 == 18 || v8 < 2)
      goto LABEL_25;
    v27 = *(_QWORD *)(v6 + 552);
    if ((v27 & 0x800000) != 0)
    {
LABEL_24:
      v26 = 0;
      goto LABEL_25;
    }
    v28 = v27 & 0x28800;
    v29 = v5;
    v30 = v29;
    if (v28)
    {
      v31 = objc_msgSend(v29, "sr_sessionp");
      if (v31)
      {
        v32 = v31;
        if (*(_DWORD *)(v31 + 260) > 0xFu)
        {
          v133 = v30;
          v58 = *(_QWORD *)(a2 + 8);
          v59 = mbuf_data(v58);
          v60 = mbuf_len(v58);
          v61 = *(_QWORD *)(a2 + 8);
          if (v61)
          {
            v62 = v60 + v59 - *(_QWORD *)(a2 + 16);
            v63 = 48;
            while (1)
            {
              if (v61 != *(_QWORD *)(a2 + 8))
                v62 = mbuf_len(v61);
              if (v63 < v62)
                break;
              v61 = mbuf_next(v61);
              v63 -= v62;
              if (!v61)
                goto LABEL_39;
            }
            v80 = 16;
            while (1)
            {
              v81 = v61 == *(_QWORD *)(a2 + 8) ? *(_QWORD *)(a2 + 16) : mbuf_data(v61);
              v82 = (void *)(v81 + v63);
              v83 = v80 >= v62 - v63 ? v62 - v63 : v80;
              bzero(v82, v83);
              v80 -= v83;
              v84 = mbuf_next(v61);
              if (!v84)
                break;
              v61 = v84;
              v62 = mbuf_len(v84);
              v63 = 0;
              if (!v80)
                goto LABEL_105;
            }
            if (!v80)
            {
LABEL_105:
              if ((_DWORD)v9)
              {
                v9 = v9;
                v30 = v133;
              }
              else
              {
                v105 = *(_QWORD *)(a2 + 8);
                v106 = mbuf_data(v105);
                v9 = mbuf_len(v105) + v106 - *(_QWORD *)(a2 + 16);
                v107 = mbuf_next(v105);
                v30 = v133;
                if (v107)
                {
                  v108 = v107;
                  do
                  {
                    v9 += mbuf_len(v108);
                    v108 = mbuf_next(v108);
                  }
                  while (v108);
                }
              }
              smb3_get_signature(v32, v30, 0, a2, v9, 0, 0, 0, &ctx);
              v33 = timingsafe_bcmp(a3, &ctx, 0x10uLL);
              if (v33
                && piston_log_level
                && (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR) || !smb2_rq_verify_cold_19(v30))
                && (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR) || !smb2_rq_verify_cold_18())
                && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                smb2_rq_verify_cold_17();
              }
              goto LABEL_46;
            }
            v97 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v97)
              smb2_rq_verify_cold_20(v97, v98, v99, v100, v101, v102, v103, v104);
          }
          else
          {
LABEL_39:
            v64 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v64)
              smb2_rq_verify_cold_16(v64, v65, v66, v67, v68, v69, v70, v71);
          }
          goto LABEL_41;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb2_rq_verify_cold_15();
        v33 = 80;
        goto LABEL_46;
      }
      v50 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v50)
        smb2_rq_verify_cold_14(v50, v51, v52, v53, v54, v55, v56, v57);
    }
    else
    {
      memset(&ctx, 0, sizeof(ctx));
      v43 = objc_msgSend(v29, "sr_sessionp");
      if (v43)
      {
        v44 = v43;
        v133 = v30;
        v45 = *(_QWORD *)(a2 + 8);
        v46 = mbuf_data(v45);
        v47 = mbuf_len(v45) + v46 - *(_QWORD *)(a2 + 16);
        v48 = mbuf_len(v45);
        v49 = mbuf_len(v45) - v47;
        if (v49 > v48)
        {
          if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_rq_verify_cold_6();
          goto LABEL_41;
        }
        if ((_DWORD)v9)
        {
          v9 = v9;
        }
        else
        {
          v85 = mbuf_next(v45);
          v9 = v47;
          if (v85)
          {
            v86 = v85;
            v9 = v47;
            do
            {
              v9 += mbuf_len(v86);
              v86 = mbuf_next(v86);
            }
            while (v86);
          }
        }
        if (v9 <= 0x3F)
        {
          if (!piston_log_level)
            goto LABEL_41;
          v30 = v133;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb2_rq_verify_cold_7();
LABEL_70:
          v33 = 72;
          goto LABEL_46;
        }
        data[0] = 0;
        data[1] = 0;
        CCHmacInit(&ctx, 2u, *(const void **)(v44 + 216), *(unsigned int *)(v44 + 224));
        v87 = 48;
        while (1)
        {
          if (v47)
          {
            if (v49 > v48)
            {
              if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_rq_verify_cold_6();
              goto LABEL_41;
            }
          }
          else
          {
            v88 = mbuf_next(v45);
            if (!v88)
            {
              if (!piston_log_level)
                goto LABEL_41;
              v109 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              v30 = v133;
              if (v109)
                smb2_rq_verify_cold_8(v109, v110, v111, v112, v113, v114, v115, v116);
              goto LABEL_70;
            }
            v45 = v88;
            v47 = mbuf_len(v88);
            v48 = mbuf_len(v45);
            v49 = 0;
          }
          if (v87 >= v47)
            v89 = v47;
          else
            v89 = v87;
          v90 = mbuf_data(v45);
          CCHmacUpdate(&ctx, (const void *)(v90 + v49), v89);
          v49 += v89;
          v47 -= v89;
          v9 -= v89;
          v87 -= v89;
          if (!v87)
          {
            v91 = 16;
            CCHmacUpdate(&ctx, data, 0x10uLL);
            while (1)
            {
              if (v47)
              {
                if (v49 > v48)
                {
                  if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    goto LABEL_124;
                  goto LABEL_41;
                }
              }
              else
              {
                v92 = mbuf_next(v45);
                if (!v92)
                {
                  if (!piston_log_level)
                    goto LABEL_41;
                  v117 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                  v30 = v133;
                  if (v117)
                    smb2_rq_verify_cold_8(v117, v118, v119, v120, v121, v122, v123, v124);
                  goto LABEL_70;
                }
                v45 = v92;
                v47 = mbuf_len(v92);
                v48 = mbuf_len(v45);
                v49 = 0;
              }
              if (v91 >= v47)
                v93 = v47;
              else
                v93 = v91;
              v49 += v93;
              v47 -= v93;
              v9 -= v93;
              v91 -= v93;
              if (!v91)
              {
                if (!v9)
                {
LABEL_101:
                  CCHmacFinal(&ctx, macOut);
                  v33 = timingsafe_bcmp(a3, macOut, 0x10uLL);
                  goto LABEL_42;
                }
                while (1)
                {
                  if (v47)
                  {
                    if (v49 > v48)
                    {
                      if (!piston_log_level || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        goto LABEL_41;
LABEL_124:
                      smb2_rq_verify_cold_6();
LABEL_41:
                      v33 = 72;
LABEL_42:
                      v30 = v133;
LABEL_46:

                      if (v33)
                      {
                        if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          smb2_rq_verify_cold_4(v30);
                        v26 = 80;
                        goto LABEL_25;
                      }
                      goto LABEL_24;
                    }
                  }
                  else
                  {
                    v94 = mbuf_next(v45);
                    if (!v94)
                    {
                      if (piston_log_level)
                      {
                        v125 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                        if (v125)
                          smb2_rq_verify_cold_8(v125, v126, v127, v128, v129, v130, v131, v132);
                      }
                      goto LABEL_41;
                    }
                    v45 = v94;
                    v47 = mbuf_len(v94);
                    v48 = mbuf_len(v45);
                    v49 = 0;
                  }
                  if (v9 >= v47)
                    v95 = v47;
                  else
                    v95 = v9;
                  v96 = mbuf_data(v45);
                  CCHmacUpdate(&ctx, (const void *)(v96 + v49), v95);
                  v49 += v95;
                  v47 -= v95;
                  v9 -= v95;
                  if (!v9)
                    goto LABEL_101;
                }
              }
            }
          }
        }
      }
      v72 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v72)
        smb2_rq_verify_cold_5(v72, v73, v74, v75, v76, v77, v78, v79);
    }
    v33 = 22;
    goto LABEL_46;
  }
  if (piston_log_level)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      smb2_rq_verify_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  v26 = 22;
LABEL_25:

  return v26;
}

uint64_t smb3_rq_encrypt(void *a1)
{
  id v1;
  uint64_t v2;
  _WORD *v3;
  uint64_t *v4;
  __int16 v5;
  _DWORD *v6;
  uint64_t v7;
  void *v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t chain_len;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  _CCCryptor *v26;
  const void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  size_t v31;
  _CCCryptor *v32;
  const void *v33;
  void *v34;
  CCCryptorRef cryptorRef[2];
  size_t dataOutMoved;
  _QWORD *v38;
  _QWORD dataOut[2];
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v38 = 0;
  v2 = objc_msgSend(v1, "sr_sessionp");
  v41 = 0uLL;
  v40 = 0uLL;
  cryptorRef[1] = 0;
  dataOutMoved = 0;
  dataOut[0] = 0;
  dataOut[1] = 0;
  cryptorRef[0] = 0;
  v3 = (_WORD *)(v2 + 492);
  if (*(unsigned __int16 *)(v2 + 492) - 1 >= 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_rq_encrypt_cold_18();
    *v3 = 1;
  }
  v4 = (uint64_t *)objc_msgSend(v1, "smb_rq_getrequest");
  v5 = objc_msgSend(v1, "sr_flags");
  v6 = (_DWORD *)mb_detach(v4);
  if ((v5 & 0x100) != 0)
  {
    objc_msgSend(v1, "sr_next_rqp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        v9 = (_DWORD *)mb_detach((uint64_t *)objc_msgSend(v8, "smb_rq_getrequest"));
        v6 = (_DWORD *)mbuf_concatenate((uint64_t)v6, v9);
        objc_msgSend(v8, "sr_next_rqp");
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v10;
      }
      while (v10);
    }
    m_fixhdr((uint64_t)v6);
  }
  v38 = 0;
  if (*(_DWORD *)(v2 + 488))
  {
    if (mbuf_gethdr(0, 1, &v38))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_rq_encrypt_cold_17();
      v11 = 55;
    }
    else
    {
      v20 = mbuf_data((uint64_t)v38);
      *(_OWORD *)v20 = 0u;
      *(_OWORD *)(v20 + 16) = 0u;
      *(_OWORD *)(v20 + 32) = 0u;
      *(_DWORD *)(v20 + 48) = 0;
      *(_DWORD *)v20 = 1112364029;
      pthread_mutex_lock((pthread_mutex_t *)v2);
      v21 = *(_QWORD *)(v2 + 544);
      *(_QWORD *)(v2 + 544) = v21 + 1;
      if (v21 == -1)
      {
        *(_QWORD *)(v2 + 544) = 1;
        ++*(_QWORD *)(v2 + 536);
      }
      pthread_mutex_unlock((pthread_mutex_t *)v2);
      v41 = *(_OWORD *)(v2 + 536);
      switch(*(_WORD *)(v2 + 492))
      {
        case 1:
        case 3:
          HIBYTE(v41) = 0;
          *(_DWORD *)((char *)&v41 + 11) = 0;
          break;
        case 2:
        case 4:
          HIDWORD(v41) = 0;
          break;
        default:
          break;
      }
      *(_OWORD *)(v20 + 20) = v41;
      chain_len = mbuf_get_chain_len((uint64_t)v6);
      if (!HIDWORD(chain_len))
      {
        *(_DWORD *)(v20 + 36) = chain_len;
        *(_WORD *)(v20 + 42) = 1;
        *(_QWORD *)(v20 + 44) = objc_msgSend(v1, "sr_rqsessionid");
        mbuf_setlen((uint64_t)v38, 52);
        switch(*v3)
        {
          case 1:
          case 3:
            if (CCCryptorCreateWithMode(0, 0xCu, 0, 0, 0, (const void *)(v2 + 456), *(unsigned int *)(v2 + 488), 0, 0, 0, 0, cryptorRef))
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_77;
              goto LABEL_29;
            }
            if (CCCryptorAddParameter())
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb3_rq_encrypt_cold_15();
              goto LABEL_77;
            }
            if (CCCryptorAddParameter())
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb3_rq_encrypt_cold_14();
              goto LABEL_77;
            }
            if (CCCryptorAddParameter())
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_77;
              goto LABEL_38;
            }
            if (CCCryptorAddParameter())
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_77;
              goto LABEL_44;
            }
            if (v6)
            {
              v29 = (uint64_t)v6;
              do
              {
                v30 = mbuf_len(v29);
                if (v30)
                {
                  v31 = v30;
                  v32 = cryptorRef[0];
                  v33 = (const void *)mbuf_data(v29);
                  v34 = (void *)mbuf_data(v29);
                  if (CCCryptorUpdate(v32, v33, v31, v34, v31, &dataOutMoved))
                  {
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      goto LABEL_77;
                    goto LABEL_60;
                  }
                }
                v29 = mbuf_next(v29);
              }
              while (v29);
            }
            if (CCCryptorFinal(cryptorRef[0], dataOut, 0x10uLL, &dataOutMoved))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb3_rq_encrypt_cold_10();
            }
            else if (dataOutMoved)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb3_rq_encrypt_cold_9();
            }
            else
            {
              if (!CCCryptorGetParameter())
                goto LABEL_83;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb3_rq_encrypt_cold_8();
            }
            goto LABEL_77;
          case 2:
          case 4:
            if (CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, (const void *)(v2 + 456), *(unsigned int *)(v2 + 488), 0, 0, 0, 0, cryptorRef))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_29:
                smb3_rq_encrypt_cold_7();
              goto LABEL_77;
            }
            if (CCCryptorAddParameter())
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_38:
                smb3_rq_encrypt_cold_6();
              goto LABEL_77;
            }
            if (CCCryptorAddParameter())
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_44:
                smb3_rq_encrypt_cold_5();
              goto LABEL_77;
            }
            if (!v6)
              goto LABEL_53;
            v23 = (uint64_t)v6;
            break;
          default:
            goto LABEL_84;
        }
        do
        {
          v24 = mbuf_len(v23);
          if (v24)
          {
            v25 = v24;
            v26 = cryptorRef[0];
            v27 = (const void *)mbuf_data(v23);
            v28 = (void *)mbuf_data(v23);
            if (CCCryptorUpdate(v26, v27, v25, v28, v25, &dataOutMoved))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_60:
                smb3_rq_encrypt_cold_4();
              goto LABEL_77;
            }
          }
          v23 = mbuf_next(v23);
        }
        while (v23);
LABEL_53:
        if (CCCryptorGCMFinalize())
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            smb3_rq_encrypt_cold_3();
          goto LABEL_77;
        }
LABEL_83:
        *(_OWORD *)(v20 + 4) = v40;
LABEL_84:
        v38 = (_QWORD *)mbuf_concatenate((uint64_t)v38, v6);
        m_fixhdr((uint64_t)v38);
        mb_initm((uint64_t)v4, (uint64_t)v38);
        v11 = 0;
        goto LABEL_80;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_rq_encrypt_cold_2();
LABEL_77:
      v11 = 80;
    }
    mbuf_freem(v6);
    if (v38)
      mbuf_freem(v38);
LABEL_80:
    if (cryptorRef[0])
      CCCryptorRelease(cryptorRef[0]);
    goto LABEL_82;
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v12)
    smb3_rq_encrypt_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  v11 = 22;
LABEL_82:

  return v11;
}

uint64_t smb3_msg_decrypt(uint64_t a1, _QWORD **a2)
{
  _WORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  _CCCryptor *v21;
  const void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  _CCCryptor *v27;
  const void *v28;
  void *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t dataOutMoved;
  CCCryptorRef cryptorRef;
  _QWORD *v46;
  _QWORD dataOut[2];
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  cryptorRef = 0;
  v46 = 0;
  v48 = 0uLL;
  dataOutMoved = 0;
  dataOut[0] = 0;
  dataOut[1] = 0;
  v4 = (_WORD *)(a1 + 492);
  if (*(unsigned __int16 *)(a1 + 492) - 1 >= 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_msg_decrypt_cold_22();
    *v4 = 1;
  }
  v46 = 0;
  if (!*(_DWORD *)(a1 + 528))
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      smb3_msg_decrypt_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_13;
  }
  v5 = *a2;
  if (mbuf_split(*a2, 0x34uLL, 0, &v46))
  {
LABEL_10:
    v8 = 72;
    goto LABEL_14;
  }
  v6 = mbuf_data((uint64_t)v5);
  v7 = v6;
  if (*(_DWORD *)v6 != 1112364029)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_msg_decrypt_cold_21((unsigned __int8 *)v7);
    goto LABEL_10;
  }
  if (*(_WORD *)(v6 + 42) != 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_msg_decrypt_cold_20();
    goto LABEL_13;
  }
  if (*(_QWORD *)(v6 + 44) != *(_QWORD *)(a1 + 568))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_msg_decrypt_cold_19();
LABEL_13:
    v8 = 80;
LABEL_14:
    v5 = v46;
    if (v46)
LABEL_15:
      mbuf_freem(v5);
    return v8;
  }
  switch(*v4)
  {
    case 1:
    case 3:
      if (CCCryptorCreateWithMode(1u, 0xCu, 0, 0, 0, (const void *)(a1 + 494), *(unsigned int *)(a1 + 528), 0, 0, 0, 0, &cryptorRef))
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        goto LABEL_22;
      }
      if (CCCryptorAddParameter())
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_msg_decrypt_cold_17();
        goto LABEL_13;
      }
      if (CCCryptorAddParameter())
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_msg_decrypt_cold_16();
        goto LABEL_13;
      }
      if (CCCryptorAddParameter())
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        goto LABEL_35;
      }
      if (CCCryptorAddParameter())
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        goto LABEL_41;
      }
      v24 = (uint64_t)v46;
      if (v46)
      {
        do
        {
          v25 = mbuf_len(v24);
          if (v25)
          {
            v26 = v25;
            v27 = cryptorRef;
            v28 = (const void *)mbuf_data(v24);
            v29 = (void *)mbuf_data(v24);
            if (CCCryptorUpdate(v27, v28, v26, v29, v26, &dataOutMoved))
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_13;
              goto LABEL_56;
            }
          }
          v24 = mbuf_next(v24);
        }
        while (v24);
      }
      if (CCCryptorFinal(cryptorRef, dataOut, 0x10uLL, &dataOutMoved))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_msg_decrypt_cold_12();
      }
      else if (dataOutMoved)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_msg_decrypt_cold_11();
      }
      else if (CCCryptorGetParameter())
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_msg_decrypt_cold_10();
      }
      else
      {
        if (!cc_cmp_safe())
          goto LABEL_82;
        if (piston_log_level)
        {
          v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v30)
            smb3_msg_decrypt_cold_9(v30, v31, v32, v33, v34, v35, v36, v37);
          if (piston_log_level)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              smb3_msg_decrypt_cold_8(v7 + 4, (unsigned __int8 *)v7, v38, v39, v40, v41, v42, v43);
            if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              smb3_msg_decrypt_cold_7();
          }
        }
      }
      goto LABEL_13;
    case 2:
    case 4:
      if (CCCryptorCreateWithMode(1u, 0xBu, 0, 0, 0, (const void *)(a1 + 494), *(unsigned int *)(a1 + 528), 0, 0, 0, 0, &cryptorRef))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_22:
          smb3_msg_decrypt_cold_6();
        goto LABEL_13;
      }
      if (CCCryptorAddParameter())
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_35:
          smb3_msg_decrypt_cold_5();
        goto LABEL_13;
      }
      if (CCCryptorAddParameter())
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_41:
          smb3_msg_decrypt_cold_4();
        goto LABEL_13;
      }
      v18 = (uint64_t)v46;
      if (!v46)
        goto LABEL_49;
      break;
    default:
      goto LABEL_82;
  }
  do
  {
    v19 = mbuf_len(v18);
    if (v19)
    {
      v20 = v19;
      v21 = cryptorRef;
      v22 = (const void *)mbuf_data(v18);
      v23 = (void *)mbuf_data(v18);
      if (CCCryptorUpdate(v21, v22, v20, v23, v20, &dataOutMoved))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_56:
          smb3_msg_decrypt_cold_3();
        goto LABEL_13;
      }
    }
    v18 = mbuf_next(v18);
  }
  while (v18);
LABEL_49:
  v48 = *(_OWORD *)(v7 + 4);
  if (CCCryptorGCMFinalize())
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_msg_decrypt_cold_2();
    goto LABEL_13;
  }
LABEL_82:
  v8 = 0;
  *a2 = v46;
  if (v5)
    goto LABEL_15;
  return v8;
}

uint64_t smb3_verify_session_setup(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  ccaes_cbc_encrypt_mode();
  v6 = *(unsigned __int16 *)(a1 + 264);
  if (!a2 || !a3)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      smb3_verify_session_setup_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    return 80;
  }
  if (a3 <= 0x40)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_verify_session_setup_cold_2();
    return 80;
  }
  if (*(_DWORD *)(a1 + 260) <= 0xFu)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_verify_session_setup_cold_3();
    return 80;
  }
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  if (v6 == 2)
  {
    if (CCCryptorGCMOneshotEncrypt())
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_verify_session_setup_cold_9();
      return 80;
    }
  }
  else
  {
    if (v6 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_verify_session_setup_cold_4();
      return 80;
    }
    if (cccmac_one_shot_generate())
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_verify_session_setup_cold_8();
      return 80;
    }
  }
  result = cc_cmp_safe();
  if ((_DWORD)result)
  {
    if (piston_log_level)
    {
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        smb3_verify_session_setup_cold_7(v16, v17, v18, v19, v20, v21, v22, v23);
      if (piston_log_level)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_verify_session_setup_cold_6();
        if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_verify_session_setup_cold_5();
      }
    }
    return 80;
  }
  return result;
}

uint64_t smb311_pre_auth_integrity_hash_init(uint64_t a1, int a2, uint64_t a3)
{
  _OWORD *v6;
  const void *v7;
  CC_LONG v8;
  CC_SHA512_CTX v10;
  _OWORD v11[4];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  memset(v11, 0, sizeof(v11));
  if (!a1)
    return 22;
  memset(&v10, 0, sizeof(v10));
  CC_SHA512_Init(&v10);
  if (a2)
    v6 = (_OWORD *)(a1 + 328);
  else
    v6 = v11;
  CC_SHA512_Update(&v10, v6, 0x40u);
  for (; a3; a3 = mbuf_next(a3))
  {
    if (mbuf_len(a3))
    {
      v7 = (const void *)mbuf_data(a3);
      v8 = mbuf_len(a3);
      CC_SHA512_Update(&v10, v7, v8);
    }
  }
  CC_SHA512_Final((unsigned __int8 *)(a1 + 392), &v10);
  return 0;
}

uint64_t smb311_pre_auth_integrity_hash_update(uint64_t a1, uint64_t a2)
{
  void *v4;
  const void *v5;
  CC_LONG v6;
  CC_SHA512_CTX v8;

  if (!a1)
    return 22;
  memset(&v8, 0, sizeof(v8));
  CC_SHA512_Init(&v8);
  v4 = (void *)(a1 + 392);
  CC_SHA512_Update(&v8, v4, 0x40u);
  for (; a2; a2 = mbuf_next(a2))
  {
    if (mbuf_len(a2))
    {
      v5 = (const void *)mbuf_data(a2);
      v6 = mbuf_len(a2);
      CC_SHA512_Update(&v8, v5, v6);
    }
  }
  CC_SHA512_Final((unsigned __int8 *)v4, &v8);
  return 0;
}

uint64_t smb311_pre_auth_integrity_hash_print(uint64_t a1)
{
  if (a1)
    return 0;
  else
    return 22;
}

void smb3_get_signature(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, int a8, _QWORD *a9)
{
  id v16;
  int v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  BOOL v40;
  int v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  id v52;
  int v53;
  uint64_t v54;
  CCCryptorRef cryptorRef;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v16 = a2;
  v59 = 0u;
  v60 = 0u;
  v57 = 0;
  v58 = 0;
  v17 = *(unsigned __int16 *)(a1 + 264);
  cryptorRef = 0;
  v56 = 0;
  if (!a9)
  {
    v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v26)
      smb3_get_signature_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_80;
  }
  if (!((unint64_t)a3 | a4))
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      smb3_get_signature_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_80;
  }
  if (*(_DWORD *)(a1 + 260) <= 0xFu)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_get_signature_cold_3();
    goto LABEL_80;
  }
  *a9 = 0;
  a9[1] = 0;
  v34 = (uint64_t *)(a4 + 8);
  if (!a4)
    v34 = a3;
  v35 = *v34;
  v53 = a8;
  if (v17 == 2)
  {
    if (CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, (const void *)(a1 + 244), *(unsigned int *)(a1 + 260), 0, 0, 0, 0, &cryptorRef))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_get_signature_cold_16();
      goto LABEL_78;
    }
    v56 = objc_msgSend(v16, "sr_messageid");
    if (a4)
      LODWORD(v57) = v57 | 1;
    if (objc_msgSend(v16, "sr_command") == 12)
      LODWORD(v57) = v57 | 2;
    if (CCCryptorGCMSetIV())
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_get_signature_cold_14();
      goto LABEL_78;
    }
    v36 = 0;
  }
  else
  {
    if (v17 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_get_signature_cold_4();
      goto LABEL_78;
    }
    v36 = CCAESCmacCreate();
    if (!v36)
    {
      v43 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v43)
        smb3_get_signature_cold_5(v43, v44, v45, v46, v47, v48, v49, v50);
      goto LABEL_78;
    }
  }
  v51 = a7;
  v52 = v16;
  v54 = v36;
  if (!v35)
  {
LABEL_35:
    v16 = v52;
    v42 = v54;
    if (!a6 || !v51)
      goto LABEL_63;
    if (v17 == 2)
    {
      if (CCCryptorGCMAddAAD())
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_get_signature_cold_12();
        goto LABEL_76;
      }
    }
    else
    {
      CCAESCmacUpdate();
    }
    if (v53 && (v51 & 7) != 0)
    {
      if (v17 != 2)
      {
        CCAESCmacUpdate();
LABEL_64:
        CCAESCmacFinal();
        goto LABEL_71;
      }
      if (CCCryptorGCMAddAAD())
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          smb3_get_signature_cold_11();
        goto LABEL_76;
      }
    }
    else
    {
LABEL_63:
      if (v17 != 2)
        goto LABEL_64;
    }
    if (CCCryptorGCMFinalize())
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        smb3_get_signature_cold_9();
      goto LABEL_76;
    }
LABEL_71:
    if (a4 && a5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      smb3_get_signature_cold_8();
    *(_OWORD *)a9 = v59;
    goto LABEL_76;
  }
  v37 = v35;
  while (1)
  {
    if (a4 && v37 == v35)
    {
      v38 = mbuf_data(v35);
      v39 = mbuf_len(v35) + v38 - *(_QWORD *)(a4 + 16);
    }
    else
    {
      v39 = mbuf_len(v37);
      mbuf_data(v37);
    }
    if (a4)
      v40 = a5 == 0;
    else
      v40 = 1;
    v41 = !v40;
    if ((v41 & (a5 < v39)) != 0)
      v39 = a5;
    if (v17 == 2)
      break;
    CCAESCmacUpdate();
LABEL_32:
    if (!v41 || (a5 -= v39) != 0)
    {
      v37 = mbuf_next(v37);
      if (v37)
        continue;
    }
    goto LABEL_35;
  }
  if (!CCCryptorGCMAddAAD())
    goto LABEL_32;
  v16 = v52;
  v42 = v54;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    smb3_get_signature_cold_14();
LABEL_76:
  if (v42)
    CCAESCmacDestroy();
LABEL_78:
  if (cryptorRef)
  {
    CCCryptorGCMReset();
    CCCryptorRelease(cryptorRef);
  }
LABEL_80:

}

void OUTLINED_FUNCTION_6_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x6Cu);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_12_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void piston_flush(void *a1, _WORD *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (**v19)(id, uint64_t);
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  void (**v26)(id, uint64_t);
  _WORD *v27;
  id v28;

  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "pd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_flush_cold_1();
      if (!v6)
        goto LABEL_20;
    }
    else if (!v6)
    {
      goto LABEL_20;
    }
    v6[2](v6, 57);
    goto LABEL_20;
  }
  v9 = v5;
  v10 = v6;
  v11 = objc_msgSend(v9, "treeID");
  v12 = objc_msgSend(v9, "onEncryptedShare");
  objc_msgSend(v9, "pd");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v14 = smb2_rq_alloc(7, v11, v12, 0, v13, &v28);
  v15 = v28;

  if ((_DWORD)v14)
  {
    if (v15)
      objc_msgSend(v15, "smb_rq_done");
    if (v10)
      v10[2](v10, v14);
    goto LABEL_17;
  }
  v16 = objc_msgSend(v15, "smb_rq_getrequest");
  mb_put_uint16le(v16, 24);
  mb_put_uint16le(v16, -(*a2 & 1));
  mb_put_uint32le(v16, 0);
  mb_put_uint64le(v16, objc_msgSend(v9, "fid"));
  objc_msgSend(v9, "fid");
  mb_put_uint64le(v16, v17);
  objc_msgSend(v9, "pd");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __smb2_smb_flush_block_invoke;
  v24 = &unk_24FE01398;
  v19 = v10;
  v26 = v19;
  v27 = a2;
  v20 = v15;
  v25 = v20;
  v14 = smb_rq_simple_block(v18, v20, &v21);

  if ((_DWORD)v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      piston_flush_cold_3();
      if (!v20)
      {
LABEL_14:
        if (v19)
          v19[2](v19, v14);
        goto LABEL_16;
      }
    }
    else if (!v20)
    {
      goto LABEL_14;
    }
    objc_msgSend(v20, "smb_rq_done", v21, v22, v23, v24);
    goto LABEL_14;
  }
LABEL_16:

LABEL_17:
  if ((_DWORD)v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    piston_flush_cold_2();
LABEL_20:

}

void __smb2_smb_flush_block_invoke(uint64_t a1, uint64_t uint16le)
{
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v15 = 0;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 32);
  v5 = a1 + 32;
  *(_DWORD *)(*(_QWORD *)(v5 + 16) + 4) = objc_msgSend(v6, "sr_ntstatus");
  if ((_DWORD)uint16le)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __smb2_smb_flush_block_invoke_cold_2((id *)v5, uint16le);
  }
  else
  {
    v7 = (_QWORD *)objc_msgSend(*(id *)v5, "smb_rq_getreply");
    uint16le = md_get_uint16le(v7, (_WORD *)&v15 + 1);
    if (!(_DWORD)uint16le)
    {
      if (HIWORD(v15) == 4)
      {
        uint16le = md_get_uint16le(v7, &v15);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __smb2_smb_flush_block_invoke_cold_1((uint64_t)&v15 + 2, v8, v9, v10, v11, v12, v13, v14);
        uint16le = 72;
      }
    }
  }
  if (*(_QWORD *)v5)
    objc_msgSend(*(id *)v5, "smb_rq_done");
  if (v4)
    v4[2](v4, uint16le);

}

void sub_2302AB55C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

void sub_2302ACC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_2302ACE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_2302ACFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose((const void *)(v17 - 56), 8);
  objc_destroyWeak((id *)(v17 - 24));
  _Unwind_Resume(a1);
}

void sub_2302AD844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void sub_2302ADC2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void piston_gss_reset(gss_cred_id_t *cred_handle)
{
  gss_ctx_id_t *v2;
  gss_cred_id_t v3;
  gss_cred_id_t v4;
  OM_uint32 minor_status;

  minor_status = 0;
  v2 = cred_handle + 15;
  if (cred_handle[15])
  {
    gss_delete_sec_context(&minor_status, v2, 0);
    *v2 = 0;
  }
  if (cred_handle[16])
  {
    gss_destroy_cred(&minor_status, cred_handle + 16);
    cred_handle[16] = 0;
  }
  v3 = cred_handle[18];
  if (v3)
  {
    free(v3);
    cred_handle[18] = 0;
  }
  cred_handle[17] = 0;
  v4 = cred_handle[20];
  if (v4)
  {
    free(v4);
    cred_handle[20] = 0;
  }
  cred_handle[19] = 0;
}

uint64_t piston_gss_parse_server_mechs(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  void **p_value;
  uint64_t v7;
  unint64_t v8;
  int v9;
  OM_uint32 minor_status[9];
  __int128 v12;
  gss_buffer_desc_struct v13[3];
  gss_buffer_desc_struct output_token;

  output_token.length = 0;
  output_token.value = 0;
  memset(v13, 0, sizeof(v13));
  memset(&minor_status[1], 0, 32);
  v12 = 0u;
  if (!*(_QWORD *)(a1 + 144))
    return 589824;
  minor_status[0] = 0;
  v2 = gss_decapsulate_token((gss_const_buffer_t)(a1 + 136), MEMORY[0x24BDD1AA8], &output_token);
  if (!(_DWORD)v2)
  {
    v3 = decode_NegotiationToken();
    if (v3)
    {
      if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        piston_gss_parse_server_mechs_cold_3();
      v4 = decode_NegotiationTokenWin();
      if ((_DWORD)v4)
      {
        v2 = v4;
        if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          piston_gss_parse_server_mechs_cold_2();
        v5 = 0;
        goto LABEL_44;
      }
      if (minor_status[1] != 1)
      {
        gss_release_buffer(minor_status, &output_token);
        v5 = 0;
        v2 = 589824;
        goto LABEL_48;
      }
      p_value = (void **)&minor_status[3];
      if (*((_QWORD *)&v12 + 1)
        && **((_QWORD **)&v12 + 1)
        && (piston_log_level & 4) != 0
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        piston_gss_parse_server_mechs_cold_1();
      }
      v5 = 0;
    }
    else
    {
      if (LODWORD(v13[0].length) != 1)
      {
        v5 = 1;
        v2 = 589824;
LABEL_44:
        gss_release_buffer(minor_status, &output_token);
        goto LABEL_49;
      }
      p_value = &v13[0].value;
      v5 = 1;
    }
    if (*(_DWORD *)p_value)
    {
      v7 = 0;
      v8 = 0;
      while (1)
      {
        v2 = der_print_heim_oid();
        if (!(_DWORD)v2)
          break;
LABEL_41:
        ++v8;
        v7 += 16;
        if (v8 >= *(unsigned int *)p_value)
          goto LABEL_47;
      }
      if (!strcmp(0, "1.2.840.48018.1.2.2"))
      {
        v9 = 1;
      }
      else if (!strcmp(0, "1.2.840.113554.1.2.2"))
      {
        v9 = 2;
      }
      else if (!strcmp(0, "1.2.752.43.14.3"))
      {
        v9 = 4;
      }
      else if (!strcmp(0, "1.3.6.1.5.5.14"))
      {
        v9 = 8;
      }
      else if (!strcmp(0, "1.3.6.1.4.1.311.2.2.10"))
      {
        v9 = 16;
      }
      else if (!strcmp(0, "1.3.5.1.5.2.7"))
      {
        v9 = 32;
      }
      else
      {
        if (strcmp(0, "1.3.6.1.5.2.5"))
        {
LABEL_40:
          free(0);
          goto LABEL_41;
        }
        v9 = 64;
      }
      *(_DWORD *)(a1 + 112) |= v9;
      goto LABEL_40;
    }
    v2 = 589824;
LABEL_47:
    gss_release_buffer(minor_status, &output_token);
    if (!v3)
      goto LABEL_49;
LABEL_48:
    free_NegotiationTokenWin();
LABEL_49:
    if (v5)
      free_NegotiationToken();
  }
  return v2;
}

uint64_t piston_gss_transact(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  gss_OID_desc *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *value;
  OM_uint32 v29;
  char *v30;
  _BOOL4 v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  const void *v46;
  gss_name_t v47;
  const __CFUUID *v48;
  const __CFUUID *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  OM_uint32 v54;
  OM_uint32 v55;
  char *v56;
  _BOOL4 v57;
  OM_uint32 inited;
  OM_uint32 v59;
  _BOOL8 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BOOL8 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  int v83;
  _BOOL8 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  gss_OID v94;
  id v95;
  uint64_t v96;
  OM_uint32 v97;
  char *v98;
  _BOOL4 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  _BOOL8 v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  OM_uint32 v116;
  _BOOL4 v117;
  _BOOL8 v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  __CFError *cstring_len;
  void *v128;
  __CFError *v129;
  void *v130;
  __CFError *v131;
  OM_uint32 v132;
  char *v133;
  _BOOL4 v134;
  CFErrorRef v135;
  uint64_t v136;
  _BOOL8 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  CFUUIDRef v145;
  CFUUIDRef v146;
  _DWORD *v147;
  int v148;
  _BOOL8 v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  int v163;
  int v164;
  char *v165;
  _BOOL4 v166;
  _BOOL8 v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  _BOOL8 v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _BOOL8 v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  _BOOL8 v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  _BOOL8 v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  _BOOL8 v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  gss_name_t_desc_struct *desired_name;
  gss_buffer_desc_struct input_name_buffer;
  gss_name_t output_name;
  gss_OID actual_mech_type;
  OM_uint32 ret_flags;
  OM_uint32 minor_status[2];
  uint64_t v230;
  CFErrorRef error[5];
  void *rctx;
  OM_uint32 v233;
  pthread_mutex_t output_cred_handle;
  pthread_cond_t v235;
  OM_uint32 status_value[4];
  uint64_t v237;

  v237 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  *(_QWORD *)minor_status = 0;
  ret_flags = 0;
  output_name = 0;
  actual_mech_type = 0;
  input_name_buffer.length = 0;
  input_name_buffer.value = 0;
  v2 = objc_msgSend(v1, "getSessionPtr");
  objc_msgSend(v1, "sock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(v2 + 560);
    if ((v4 & 0x200000) != 0)
    {
      v5 = (gss_OID_desc *)MEMORY[0x24BDD1A80];
    }
    else if ((v4 & 0x400000) != 0)
    {
      if ((piston_log_level & 4) != 0)
      {
        v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v15)
          piston_gss_transact_cold_39(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      v5 = (gss_OID_desc *)MEMORY[0x24BDD1A78];
    }
    else
    {
      v5 = (gss_OID_desc *)MEMORY[0x24BDD1AA0];
    }
    if (*(_QWORD *)(v2 + 128))
      goto LABEL_14;
    objc_msgSend(v1, "userName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      v68 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v68)
        piston_gss_transact_cold_2(v68, v69, v70, v71, v72, v73, v74, v75);
      goto LABEL_61;
    }
    if (gss_oid_equal(v5, MEMORY[0x24BDD1A80]))
    {
      if ((piston_log_level & 4) != 0)
      {
        v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v33)
          piston_gss_transact_cold_38(v33, v34, v35, v36, v37, v38, v39, v40);
      }
      v41 = v1;
      output_cred_handle.__sig = 0;
      error[0] = 0;
      v42 = objc_msgSend(v41, "getSessionPtr");
      if (!gss_oid_equal(v5, MEMORY[0x24BDD1A80]))
      {
        v51 = 0;
        v50 = 0;
        v55 = 983040;
LABEL_166:

        goto LABEL_167;
      }
      v43 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v41, "userName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "realm");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (const void *)objc_msgSend(v43, "stringWithFormat:", CFSTR("%@@%@"), v44, v45);
      v47 = GSSCreateName(v46, MEMORY[0x24BDD1A68], error);

      if (!v47)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          piston_gss_transact_cold_28((uint64_t)error, v100, v101, v102, v103, v104, v105, v106);
        v50 = 0;
        v51 = 0;
        v55 = 983040;
        goto LABEL_164;
      }
      v48 = CFUUIDCreate(0);
      desired_name = v47;
      if (!v48)
      {
        v108 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v108)
          piston_gss_transact_cold_29(v108, v109, v110, v111, v112, v113, v114, v115);
        v50 = 0;
        v51 = 0;
        v55 = 983040;
        goto LABEL_163;
      }
      v49 = v48;
      v50 = (__CFString *)CFUUIDCreateString(0, v48);
      if (!v50)
      {
        v118 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v118)
          piston_gss_transact_cold_30(v118, v119, v120, v121, v122, v123, v124, v125);
        v51 = 0;
        v55 = 983040;
        goto LABEL_162;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XCACHE:%@"), v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        piston_gss_transact_cold_37();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v52)
      {
        v137 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v137)
          piston_gss_transact_cold_31(v137, v138, v139, v140, v141, v142, v143, v144);
        v55 = 983040;
        goto LABEL_161;
      }
      objc_msgSend(v41, "password");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setObject:forKey:", v53, CFSTR("kGSSICPassword"));

      objc_msgSend(v52, "setObject:forKey:", v51, CFSTR("kGSSICKerberosCacheName"));
      v54 = gss_aapl_initial_cred(desired_name, MEMORY[0x24BDD1A80], (CFDictionaryRef)v52, (gss_cred_id_t *)&output_cred_handle, error);
      if (v54)
      {
        v55 = v54;
        v56 = piston_gss_error(v54, 0, v5);
        v57 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v56)
        {
          if (v57)
            piston_gss_transact_cold_36();
          free(v56);
        }
        else if (v57)
        {
          piston_gss_transact_cold_35();
        }
      }
      else
      {
        if (output_cred_handle.__sig)
        {
          v145 = GSSCredentialCopyUUID((gss_cred_id_t)output_cred_handle.__sig);
          if (v145)
          {
            v146 = v145;
            if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              piston_gss_transact_cold_34();
            CFRelease(v146);
            v55 = 0;
            *(_QWORD *)(v42 + 128) = output_cred_handle.__sig;
            goto LABEL_161;
          }
          v192 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v192)
            piston_gss_transact_cold_33(v192, v193, v194, v195, v196, v197, v198, v199);
        }
        else
        {
          v184 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v184)
            piston_gss_transact_cold_32(v184, v185, v186, v187, v188, v189, v190, v191);
        }
        v55 = 0;
      }
LABEL_161:

LABEL_162:
      CFRelease(v49);
LABEL_163:
      CFRelease(desired_name);
LABEL_164:
      if (error[0])
        CFRelease(error[0]);
      goto LABEL_166;
    }
    v81 = v1;
    *(_OWORD *)status_value = 0u;
    memset(&v235, 0, sizeof(v235));
    memset(&output_cred_handle, 0, sizeof(output_cred_handle));
    LODWORD(rctx) = 0;
    v82 = objc_msgSend(v81, "getSessionPtr");
    v233 = 0;
    v230 = 0;
    v83 = pthread_mutex_init(&output_cred_handle, 0);
    if (v83)
    {
      printf("pthread_mutex_init failed <%d> \n", v83);
LABEL_81:
      v55 = 851968;
      goto LABEL_167;
    }
    v107 = pthread_cond_init(&v235, 0);
    if (v107)
    {
      printf("pthread_cond_init failed <%d> \n", v107);
      pthread_mutex_destroy(&output_cred_handle);
      goto LABEL_81;
    }
    status_value[0] = 0;
    if ((*(_WORD *)(v82 + 554) & 0x840) == 0)
    {
      objc_msgSend(v81, "realm");
      v158 = objc_claimAutoreleasedReturnValue();
      if (!v158
        || (v159 = (void *)v158,
            objc_msgSend(v81, "realm"),
            v160 = (void *)objc_claimAutoreleasedReturnValue(),
            v161 = objc_msgSend(v160, "length"),
            v160,
            v159,
            !v161))
      {
        if (gss_oid_equal(v5, MEMORY[0x24BDD1A78]))
          objc_msgSend(v81, "setRealm:", CFSTR("WELLKNOWN:COM.APPLE.LKDC"));
        if (gss_oid_equal(v5, MEMORY[0x24BDD1A80]))
        {
          piston_gss_get_realm();
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setRealm:", v162);

        }
      }
    }
    objc_msgSend(v81, "userName");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    cstring_len = (__CFError *)smb_get_cstring_len(v126, &v233);

    objc_msgSend(v81, "password");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = (__CFError *)smb_get_cstring_len(v128, (_DWORD *)&v230 + 1);

    objc_msgSend(v81, "realm");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = (__CFError *)smb_get_cstring_len(v130, &v230);

    error[0] = (CFErrorRef)1;
    error[1] = cstring_len;
    error[2] = v131;
    error[3] = v129;
    error[4] = 0;
    v132 = __ApplePrivate_gss_acquire_cred_ex_f();
    if (v132)
    {
      v55 = v132;
      v133 = piston_gss_error(v132, (OM_uint32)rctx, v5);
      v134 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v133)
      {
        if (v134)
          goto LABEL_140;
        goto LABEL_141;
      }
      if (!v134)
        goto LABEL_176;
    }
    else
    {
      pthread_mutex_lock(&output_cred_handle);
      while (!status_value[0])
      {
        v163 = pthread_cond_wait(&v235, &output_cred_handle);
        if (v163)
        {
          v164 = v163;
          v165 = strerror(v163);
          printf("pthread_cond_wait failed <%s (%d)> \n", v165, v164);
          status_value[1] = 851968;
        }
      }
      pthread_mutex_unlock(&output_cred_handle);
      v55 = status_value[1];
      if (!status_value[1])
      {
        *(_QWORD *)(v82 + 128) = *(_QWORD *)&status_value[2];
        goto LABEL_176;
      }
      LODWORD(rctx) = 0;
      v133 = piston_gss_error(status_value[1], 0, v5);
      v166 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v133)
      {
        if (v166)
LABEL_140:
          piston_gss_transact_cold_25();
LABEL_141:
        free(v133);
LABEL_176:
        pthread_mutex_destroy(&output_cred_handle);
        pthread_cond_destroy(&v235);
LABEL_167:

        if (v55)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            piston_gss_transact_cold_23();
          goto LABEL_170;
        }
LABEL_14:
        if (gss_oid_equal(v5, MEMORY[0x24BDD1A80]))
        {
          v23 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v1, "sock");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "serverName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("cifs@%@"), v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            piston_gss_transact_cold_21(v26);
          v27 = objc_retainAutorelease(v26);
          value = (void *)objc_msgSend(v27, "cStringUsingEncoding:", 4);
          input_name_buffer.value = value;
        }
        else
        {
          if (gss_oid_equal(v5, MEMORY[0x24BDD1A78]))
          {
            input_name_buffer.length = 39;
            input_name_buffer.value = "cifs/localhost@WELLKNOWN:COM.APPLE.LKDC";
            v29 = gss_import_name(&minor_status[1], &input_name_buffer, MEMORY[0x24BDD1A88], &output_name);
            if (v29)
            {
LABEL_20:
              v30 = piston_gss_error(v29, minor_status[1], MEMORY[0x24BDD1AA8]);
              v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v30)
              {
                if (v31)
                  piston_gss_transact_cold_20();
                free(v30);
              }
              else if (v31)
              {
                piston_gss_transact_cold_19();
              }
              goto LABEL_61;
            }
LABEL_44:
            inited = gss_init_sec_context(&minor_status[1], *(gss_cred_id_t *)(v2 + 128), (gss_ctx_id_t *)(v2 + 120), output_name, MEMORY[0x24BDD1AA8], 0x2Au, 0xFFFFFFFF, 0, (gss_buffer_t)(v2 + 136), &actual_mech_type, (gss_buffer_t)(v2 + 152), &ret_flags, 0);
            if (inited == 1)
            {
              if ((piston_log_level & 4) != 0)
              {
                v84 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v84)
                  piston_gss_transact_cold_18(v84, v85, v86, v87, v88, v89, v90, v91);
              }
              v14 = 35;
              goto LABEL_171;
            }
            v59 = inited;
            if (inited)
            {
              v92 = piston_gss_error(inited, minor_status[1], MEMORY[0x24BDD1AA8]);
              if (v92)
              {
                v93 = v92;
                printf("%s: gss_init_sec_context failed <%s> \n", "piston_gss_transact", v92);
                free(v93);
              }
              else
              {
                printf("%s: gss_init_sec_context failed <0x%x> \n", "piston_gss_transact", v59);
              }
              goto LABEL_170;
            }
            if ((piston_log_level & 4) != 0)
            {
              v60 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v60)
                piston_gss_transact_cold_17(v60, v61, v62, v63, v64, v65, v66, v67);
            }
            if (*(_QWORD *)(v2 + 152) >= 0x401uLL)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                piston_gss_transact_cold_3();
              goto LABEL_61;
            }
            v94 = actual_mech_type;
            v95 = v1;
            v233 = 0;
            error[0] = 0;
            rctx = 0;
            v96 = objc_msgSend(v95, "getSessionPtr");
            if (gss_oid_equal(v94, MEMORY[0x24BDD1AA0]))
            {
              v97 = gss_inquire_sec_context_by_oid(&v233, *(gss_ctx_id_t *)(v96 + 120), MEMORY[0x24BDD1A98], (gss_buffer_set_t *)error);
              if (v97)
              {
                v98 = piston_gss_error(v97, v233, v94);
                v99 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (!v98)
                {
                  if (v99)
                    piston_gss_transact_cold_15();
                  goto LABEL_194;
                }
                if (v99)
                  piston_gss_transact_cold_16();
                goto LABEL_92;
              }
              v135 = error[0];
              v136 = *(_QWORD *)error[0];
              if (!*(_QWORD *)error[0])
              {
                v167 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v167)
                  piston_gss_transact_cold_14(v167, v168, v169, v170, v171, v172, v173, v174);
                goto LABEL_194;
              }
              if (v136 != 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                LODWORD(output_cred_handle.__sig) = 136315394;
                *(uint64_t *)((char *)&output_cred_handle.__sig + 4) = (uint64_t)"piston_gss_get_sessionkey";
                *(_WORD *)&output_cred_handle.__opaque[4] = 2048;
                *(_QWORD *)&output_cred_handle.__opaque[6] = v136;
                _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Multiple keys received [%ld], using first key though.\n", (uint8_t *)&output_cred_handle, 0x16u);
                v135 = error[0];
              }
              piston_set_session_key(v95, *(const void **)(*((_QWORD *)v135 + 1) + 8), **((_DWORD **)v135 + 1));
              gss_release_buffer_set(&v233, (gss_buffer_set_t *)error);
LABEL_184:

              if (gss_oid_equal(actual_mech_type, MEMORY[0x24BDD1AA0]))
              {
                output_cred_handle.__sig = 0;
                if (gss_inquire_sec_context_by_oid(minor_status, *(gss_ctx_id_t *)(v2 + 120), MEMORY[0x24BDD1A70], (gss_buffer_set_t *)&output_cred_handle))
                {
                  if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    piston_gss_transact_cold_7();
                }
                else
                {
                  if (**(_DWORD **)(*(_QWORD *)(output_cred_handle.__sig + 8) + 8))
                  {
                    *(_QWORD *)(v2 + 552) |= 0x8000000uLL;
                    v208 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                    if (v208)
                      piston_gss_transact_cold_6(v208, v209, v210, v211, v212, v213, v214, v215);
                  }
                  else if (piston_log_level)
                  {
                    v216 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                    if (v216)
                      piston_gss_transact_cold_5(v216, v217, v218, v219, v220, v221, v222, v223);
                  }
                  gss_release_buffer_set(minor_status, (gss_buffer_set_t *)&output_cred_handle);
                }
              }
              v14 = 0;
              goto LABEL_171;
            }
            if (!gss_oid_equal(v94, MEMORY[0x24BDD1A78]) && !gss_oid_equal(v94, MEMORY[0x24BDD1A80]))
            {
              v176 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v176)
                piston_gss_transact_cold_4(v176, v177, v178, v179, v180, v181, v182, v183);
              goto LABEL_194;
            }
            v116 = gss_krb5_export_lucid_sec_context(&v233, (gss_ctx_id_t *)(v96 + 120), 1u, &rctx);
            if (v116)
            {
              v98 = piston_gss_error(v116, v233, v94);
              v117 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (!v98)
              {
                if (v117)
                  piston_gss_transact_cold_12();
                goto LABEL_194;
              }
              if (v117)
                piston_gss_transact_cold_13();
LABEL_92:
              free(v98);
LABEL_194:

LABEL_170:
              v14 = 80;
LABEL_171:
              if (output_name)
                gss_release_name(&minor_status[1], &output_name);
              goto LABEL_173;
            }
            v147 = rctx;
            if (*(_DWORD *)rctx == 1)
            {
              if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                piston_gss_transact_cold_10();
              v148 = v147[8];
              if (v148 == 1)
              {
                if (v147[16])
                  v157 = (uint64_t)(v147 + 22);
                else
                  v157 = (uint64_t)(v147 + 18);
LABEL_180:
                if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  piston_gss_transact_cold_8(v157, v201, v202, v203, v204, v205, v206, v207);
                piston_set_session_key(v95, *(const void **)(v157 + 8), *(_DWORD *)(v157 + 4));
                gss_krb5_free_lucid_sec_context(&v233, rctx);
                goto LABEL_184;
              }
              if (!v148)
              {
                if ((piston_log_level & 4) != 0)
                {
                  v149 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                  if (v149)
                    piston_gss_transact_cold_9(v149, v150, v151, v152, v153, v154, v155, v156);
                }
                v157 = (uint64_t)(v147 + 12);
                goto LABEL_180;
              }
              v175 = v147;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                piston_gss_transact_cold_11();
              v175 = 0;
            }
            gss_krb5_free_lucid_sec_context(&v233, v175);
            goto LABEL_194;
          }
          if (!gss_oid_equal(v5, MEMORY[0x24BDD1AA0]))
          {
LABEL_61:
            v14 = 22;
            goto LABEL_171;
          }
          v76 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v1, "sock");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "serverName");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "stringWithFormat:", CFSTR("cifs@%@"), v78);
          v27 = (id)objc_claimAutoreleasedReturnValue();

          if ((piston_log_level & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            piston_gss_transact_cold_21(v27);
          objc_msgSend(v1, "sock");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "serverName");
          v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          input_name_buffer.value = (void *)objc_msgSend(v80, "cStringUsingEncoding:", 4);

          value = input_name_buffer.value;
        }
        input_name_buffer.length = strlen((const char *)value);
        v29 = gss_import_name(&minor_status[1], &input_name_buffer, MEMORY[0x24BDD1A60], &output_name);

        if (v29)
          goto LABEL_20;
        goto LABEL_44;
      }
      if (!v166)
        goto LABEL_176;
    }
    piston_gss_transact_cold_24();
    goto LABEL_176;
  }
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v6)
    piston_gss_transact_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = 57;
LABEL_173:

  return v14;
}

char *piston_gss_error(OM_uint32 status_value, OM_uint32 a2, gss_OID mech_type)
{
  char *v7;
  gss_buffer_desc_struct buffer;
  gss_buffer_desc_struct status_string;
  OM_uint32 message_content[2];

  status_string.value = 0;
  *(_QWORD *)message_content = 0;
  v7 = 0;
  buffer.length = 0;
  status_string.length = 0;
  buffer.value = 0;
  if (!(gss_display_status(&message_content[1], status_value, 1, mech_type, message_content, &status_string) >> 16))
  {
    message_content[0] = 0;
    if (!(gss_display_status(&message_content[1], a2, 2, mech_type, message_content, &buffer) >> 16)
      && (asprintf(&v7, "gss-code: %lu %.*s -- mech-code: %lu %.*s", status_value, SLODWORD(status_string.length), (const char *)status_string.value, a2, SLODWORD(buffer.length), (const char *)buffer.value) < 0|| !v7))
    {
      v7 = 0;
    }
  }
  gss_release_buffer(&message_content[1], &status_string);
  gss_release_buffer(&message_content[1], &buffer);
  return v7;
}

id piston_gss_get_realm()
{
  krb5_error_code inited;
  krb5_error_code default_realm;
  const char *error_message;
  void *v3;
  id v5;
  char *v6;
  krb5_context v7;

  v6 = 0;
  v7 = 0;
  inited = krb5_init_context(&v7);
  if (inited)
  {
    printf("%s: krb5_init_context failed <%d> \n", "piston_gss_get_realm", inited);
  }
  else
  {
    default_realm = krb5_get_default_realm(v7, &v6);
    if (default_realm)
    {
      error_message = krb5_get_error_message(v7, default_realm);
      printf("%s: krb5_get_default_realm failed <%s> \n", "piston_gss_get_realm", error_message);
      krb5_free_error_message(v7, error_message);
    }
    else
    {
      MEMORY[0x2348B60EC](v7);
      if (v6)
      {
        v5 = objc_alloc(MEMORY[0x24BDD17C8]);
        v3 = (void *)objc_msgSend(v5, "initWithCString:encoding:", v6, 4);
        return v3;
      }
    }
  }
  v3 = 0;
  return v3;
}

uint64_t piston_gss_acquire_cred_complete(uint64_t a1, int a2, uint64_t a3, uint64_t a4, gss_OID_set_desc_struct *a5)
{
  OM_uint32 minor_status;
  gss_OID_set set;

  set = a5;
  minor_status = 0;
  gss_release_oid_set(&minor_status, &set);
  *(_QWORD *)(a1 + 120) = a4;
  *(_DWORD *)(a1 + 116) = a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  *(_DWORD *)(a1 + 112) = 1;
  pthread_cond_signal((pthread_cond_t *)(a1 + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void piston_negotiate(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  unint64_t v14;
  unint64_t v15;
  void (**v16)(id, uint64_t);
  void *v17;
  SMBSocket *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  _BOOL8 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  _QWORD block[4];
  id v83;
  void (**v84)(id, uint64_t);
  uint64_t v85;

  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a7;
  objc_msgSend(v13, "sock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v13, "setSock:", 0);
  v18 = objc_alloc_init(SMBSocket);
  objc_msgSend(v13, "setSock:", v18);
  objc_msgSend(v13, "sock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v28)
    {
      piston_negotiate_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
      if (!v16)
        goto LABEL_37;
    }
    else if (!v16)
    {
      goto LABEL_37;
    }
    v16[2](v16, 12);
    goto LABEL_37;
  }
  if (v14 | v15)
  {
    objc_msgSend(v13, "sock");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPort:", a4);

    if (!v14)
    {
LABEL_30:
      if (v15)
      {
        objc_msgSend(v13, "sock");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setNetBiosName:", v15);

      }
      objc_msgSend(v13, "sock");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setConnectTimeOut:", a5);

      objc_msgSend(v13, "sock");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "openSocket:", v13);

      if ((_DWORD)v61)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          piston_negotiate_cold_3();
        objc_msgSend(v13, "setSock:", 0);
        if (v16)
          v16[2](v16, v61);
      }
      else
      {
        objc_msgSend(v13, "sock");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "signing_queue");
        v63 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __piston_negotiate_block_invoke;
        block[3] = &unk_24FE019C8;
        v83 = v13;
        v84 = v16;
        v85 = a6;
        dispatch_async(v63, block);

      }
      goto LABEL_37;
    }
    if (objc_msgSend((id)v14, "containsString:", CFSTR("["))
      && objc_msgSend((id)v14, "containsString:", CFSTR("]"))
      && objc_msgSend((id)v14, "characterAtIndex:", 0) == 91)
    {
      v37 = CFSTR("]");
    }
    else
    {
      v37 = CFSTR(":");
      if (!objc_msgSend((id)v14, "containsString:", CFSTR(":")))
        goto LABEL_28;
    }
    objc_msgSend((id)v14, "componentsSeparatedByString:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = v38;
      v81 = a6;
      objc_msgSend(v38, "firstObject");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = (void *)v40;
        objc_msgSend(v39, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "length");

        if (v43)
        {
          objc_msgSend(v39, "firstObject");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("["));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringByTrimmingCharactersInSet:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46 && objc_msgSend(v46, "length"))
          {
            objc_msgSend(v13, "sock");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setServerName:", v46);

            objc_msgSend(v39, "objectAtIndex:", 1);
            v48 = objc_claimAutoreleasedReturnValue();
            if (v48
              && (v49 = (void *)v48,
                  objc_msgSend(v39, "objectAtIndex:", 1),
                  v50 = (void *)objc_claimAutoreleasedReturnValue(),
                  v51 = objc_msgSend(v50, "length"),
                  v50,
                  v49,
                  v51))
            {
              objc_msgSend(v39, "objectAtIndex:", 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "stringByTrimmingCharactersInSet:", v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();

              if (v54 && objc_msgSend(v54, "length"))
              {
                v80 = objc_alloc_init(MEMORY[0x24BDD16F0]);
                objc_msgSend(v80, "numberFromString:", v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v55, "unsignedShortValue");

                objc_msgSend(v13, "sock");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "setPort:", v56);

                v54 = 0;
              }
              a6 = v81;

            }
            else
            {
              a6 = v81;
            }
            goto LABEL_29;
          }
          v72 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v72)
          {
            piston_negotiate_cold_5(v72, v73, v74, v75, v76, v77, v78, v79);
            if (!v16)
              goto LABEL_49;
          }
          else if (!v16)
          {
LABEL_49:

            goto LABEL_50;
          }
          v16[2](v16, 22);
          goto LABEL_49;
        }
      }
      v64 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v64)
      {
        piston_negotiate_cold_4(v64, v65, v66, v67, v68, v69, v70, v71);
        if (!v16)
          goto LABEL_50;
      }
      else if (!v16)
      {
LABEL_50:

        goto LABEL_37;
      }
      v16[2](v16, 22);
      goto LABEL_50;
    }
LABEL_28:
    objc_msgSend(v13, "sock");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setServerName:", v14);
LABEL_29:

    goto LABEL_30;
  }
  v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v20)
  {
    piston_negotiate_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    if (!v16)
      goto LABEL_37;
    goto LABEL_7;
  }
  if (v16)
LABEL_7:
    v16[2](v16, 22);
LABEL_37:

}

void __piston_negotiate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  __int16 client_security_mode;
  int client_capabilities;
  _DWORD *v17;
  _WORD *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  _WORD *v38;
  size_t v39;
  uint64_t v40;
  const char *v41;
  int v42;
  _WORD *v43;
  const char *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  id v52;
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "getSessionPtr");
  objc_msgSend(*(id *)(a1 + 32), "sock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "connectSocket");

  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __piston_negotiate_block_invoke_cold_3();
    objc_msgSend(*(id *)(a1 + 32), "setSock:", 0);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
    v6 = 0;
    goto LABEL_18;
  }
  v7 = *(_DWORD *)(v2 + 64);
  v8 = *(void **)(a1 + 32);
  v52 = 0;
  v9 = smb2_rq_alloc(0, 0, 0, 0, v8, &v52);
  v10 = v52;
  v6 = v10;
  if (v9)
  {
    if (v10)
      objc_msgSend(v10, "smb_rq_done");
LABEL_10:
    v11 = *(_QWORD *)(a1 + 40);
    if (!v11)
      goto LABEL_18;
    v12 = *(void (**)(void))(v11 + 16);
LABEL_17:
    v12();
    goto LABEL_18;
  }
  v13 = objc_msgSend(v10, "smb_rq_getrequest");
  mb_put_uint16le(v13, 36);
  if (!smb2_smb_get_client_dialects(v2, 0, (__int16 *)(v2 + 194), (__int16 *)(v2 + 196), 0x10uLL))
  {
    mb_put_uint16le(v13, *(_WORD *)(v2 + 194));
    client_security_mode = smb2_smb_get_client_security_mode(v2);
    *(_WORD *)(v2 + 192) = client_security_mode;
    mb_put_uint16le(v13, client_security_mode);
    mb_put_uint16le(v13, 0);
    client_capabilities = smb2_smb_get_client_capabilities(v2);
    *(_DWORD *)(v2 + 172) = client_capabilities;
    mb_put_uint32le(v13, client_capabilities);
    *(_OWORD *)mb_reserve(v13, 0x10uLL) = *(_OWORD *)(v2 + 176);
    v17 = (_DWORD *)mb_reserve(v13, 4uLL);
    v18 = (_WORD *)mb_reserve(v13, 2uLL);
    mb_put_uint16le(v13, 0);
    LODWORD(v19) = *(unsigned __int16 *)(v2 + 194);
    if (*(_WORD *)(v2 + 194))
    {
      v20 = 0;
      do
      {
        mb_put_uint16le(v13, *(_WORD *)(v2 + 196 + 2 * v20++));
        v19 = *(unsigned __int16 *)(v2 + 194);
      }
      while (v20 < v19);
    }
    if ((*(_BYTE *)(v2 + 555) & 0x40) != 0)
      goto LABEL_26;
    v21 = 2 * v19 + 36;
    v22 = v21 & 6;
    if ((v21 & 6) != 0)
    {
      v23 = 8 - v22;
      mb_put_mem(v13, 0, (8 - v22), 3);
      v21 += v23;
    }
    if ((*(_BYTE *)(v2 + 561) & 0x10) == 0)
    {
LABEL_26:
      *v17 = 0;
      *v18 = 0;
      goto LABEL_27;
    }
    v43 = v18;
    objc_msgSend(*(id *)(a1 + 32), "sock");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "serverName");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend(v31, "cStringUsingEncoding:", 4);

    v44 = (const char *)v32;
    if (!v32)
    {
      objc_msgSend(*(id *)(a1 + 32), "sock");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (const char *)objc_msgSend(v33, "getIPv4IPv6DotName");

    }
    *v17 = v21 + 64;
    v53 = 0;
    arc4random_buf((void *)(v2 + 296), 0x20uLL);
    mb_put_uint16le(v13, 1);
    mb_put_uint16le(v13, 38);
    mb_put_uint32le(v13, 0);
    mb_put_uint16le(v13, 1);
    mb_put_uint16le(v13, 32);
    mb_put_uint16le(v13, 1);
    mb_put_mem(v13, (char *)(v2 + 296), 0x20uLL, 0);
    mb_put_mem(v13, 0, 2uLL, 3);
    v34 = *(_QWORD *)(v2 + 560);
    v35 = vaddvq_s32((int32x4_t)(*(_OWORD *)&vshlq_u32((uint32x4_t)vdupq_n_s32(v34), (uint32x4_t)xmmword_2302C5890) & __PAIR128__(0xFFFFFF01FFFFFF01, 0xFFFFFF01FFFFFF01)));
    if (!v35)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "smb2_smb_add_negotiate_contexts";
        _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: No encryption algorithm set? Assuming AES-128-CCM \n", buf, 0xCu);
        v34 = *(_QWORD *)(v2 + 560);
      }
      *(_QWORD *)(v2 + 560) = v34 | 0x1000000;
      LOWORD(v35) = 1;
    }
    v36 = 2 * v35 + 2;
    mb_put_uint16le(v13, 2);
    mb_put_uint16le(v13, v36 & 0xFFFE);
    mb_put_uint32le(v13, 0);
    mb_put_uint16le(v13, v35);
    v37 = *(_QWORD *)(v2 + 560);
    if ((v37 & 0x8000000) != 0)
    {
      mb_put_uint16le(v13, 4);
      v37 = *(_QWORD *)(v2 + 560);
    }
    if ((v37 & 0x4000000) != 0)
    {
      mb_put_uint16le(v13, 3);
      v37 = *(_QWORD *)(v2 + 560);
      if ((v37 & 0x2000000) == 0)
      {
LABEL_44:
        if ((v37 & 0x1000000) == 0)
        {
LABEL_46:
          if ((v36 & 6) != 0)
            mb_put_mem(v13, 0, 8 - (v36 & 6u), 3);
          mb_put_uint16le(v13, 3);
          mb_put_uint16le(v13, 10);
          mb_put_uint32le(v13, 0);
          mb_put_uint16le(v13, 1);
          mb_put_uint16le(v13, 0);
          mb_put_uint32le(v13, 0);
          mb_put_uint16le(v13, 0);
          mb_put_mem(v13, 0, 6uLL, 3);
          mb_put_uint16le(v13, 8);
          mb_put_uint16le(v13, 6);
          mb_put_uint32le(v13, 0);
          mb_put_uint16le(v13, 2);
          mb_put_uint16le(v13, 2);
          mb_put_uint16le(v13, 1);
          mb_put_mem(v13, 0, 2uLL, 3);
          mb_put_uint16le(v13, 5);
          v38 = (_WORD *)mb_reserve(v13, 2uLL);
          mb_put_uint32le(v13, 0);
          if (v44)
          {
            v39 = strlen(v44);
            v40 = v13;
            v41 = v44;
          }
          else
          {
            v41 = "UnknownServer";
            v40 = v13;
            v39 = 13;
          }
          v42 = smb_put_dmem(v40, v41, v39, 0, 1, &v53);
          *v38 = v53;
          if (v42)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              __piston_negotiate_block_invoke_cold_2();
            goto LABEL_10;
          }
          *v43 = 5;
LABEL_27:
          *(_QWORD *)(v2 + 552) |= 0x1000uLL;
          v45[0] = MEMORY[0x24BDAC760];
          v45[1] = 3221225472;
          v45[2] = __piston_negotiate_block_invoke_7;
          v45[3] = &unk_24FE019A0;
          v24 = *(void **)(a1 + 32);
          v25 = *(id *)(a1 + 40);
          v26 = *(_QWORD *)(a1 + 48);
          v47 = v25;
          v48 = v26;
          v6 = v6;
          v49 = v2;
          v50 = 0;
          v51 = v7;
          v46 = v6;
          v27 = smb_rq_simple_block(v24, v6, v45);
          if (!(_DWORD)v27)
          {
LABEL_33:

            goto LABEL_18;
          }
          v28 = v27;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            __piston_negotiate_block_invoke_cold_1();
            if (!v6)
            {
LABEL_31:
              v29 = *(_QWORD *)(a1 + 40);
              if (v29)
                (*(void (**)(uint64_t, uint64_t))(v29 + 16))(v29, v28);
              goto LABEL_33;
            }
          }
          else if (!v6)
          {
            goto LABEL_31;
          }
          objc_msgSend(v6, "smb_rq_done");
          goto LABEL_31;
        }
LABEL_45:
        mb_put_uint16le(v13, 1);
        goto LABEL_46;
      }
    }
    else if ((v37 & 0x2000000) == 0)
    {
      goto LABEL_44;
    }
    mb_put_uint16le(v13, 2);
    if ((*(_QWORD *)(v2 + 560) & 0x1000000) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
  if (v6)
    objc_msgSend(v6, "smb_rq_done");
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
  {
    v12 = *(void (**)(void))(v14 + 16);
    goto LABEL_17;
  }
LABEL_18:

}

void __piston_negotiate_block_invoke_7(uint64_t a1, int a2)
{
  void (**v4)(_QWORD, _QWORD);
  id *v5;
  id v6;
  uint64_t v7;
  __n128 *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  size_t size;
  uint8_t buf[4];
  const char *v39;
  char v40[8];
  char __dst[8];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B63BC](*(_QWORD *)(a1 + 40));
  v5 = (id *)(a1 + 32);
  **(_DWORD **)(a1 + 48) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __piston_negotiate_block_invoke_7_cold_6((id *)(a1 + 32));
LABEL_17:
    v11 = 45;
    goto LABEL_18;
  }
  v6 = *v5;
  size = 0;
  v36 = 0;
  v7 = objc_msgSend(v6, "sr_sessionp");
  v8 = (__n128 *)objc_msgSend(v6, "smb_rq_getreply");
  if (md_get_uint16le(v8, (_WORD *)&size + 3))
    goto LABEL_14;
  if (HIWORD(size) != 65)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __piston_negotiate_block_invoke_7_cold_5();
    goto LABEL_14;
  }
  if (md_get_uint16le(v8, (_WORD *)(v7 + 108)))
  {
LABEL_14:

LABEL_15:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __piston_negotiate_block_invoke_7_cold_1();
    goto LABEL_17;
  }
  v9 = *(_WORD *)(v7 + 108);
  if ((v9 & 1) != 0)
    *(_QWORD *)(v7 + 552) |= 4uLL;
  if ((v9 & 2) != 0)
  {
    v10 = *(_QWORD *)(v7 + 552) | 8;
    goto LABEL_24;
  }
  v10 = *(_QWORD *)(v7 + 552);
  if ((*(_BYTE *)(v7 + 561) & 1) != 0)
LABEL_24:
    v10 |= 8uLL;
  *(_QWORD *)(v7 + 552) = v10 | 3;
  if (md_get_uint16le(v8, (_WORD *)(v7 + 70)))
    goto LABEL_14;
  v12 = *(unsigned __int16 *)(v7 + 70);
  if (v12 > 0x2FF)
  {
    switch(v12)
    {
      case 0x300u:
        v13 = 6144;
        break;
      case 0x311u:
        v13 = 135168;
        break;
      case 0x302u:
        v13 = 36864;
        break;
      default:
        goto LABEL_64;
    }
  }
  else
  {
    switch(v12)
    {
      case 0x202u:
        v13 = 12288;
        break;
      case 0x210u:
        v13 = 20480;
        break;
      case 0x2FFu:
        v13 = 4096;
        break;
      default:
LABEL_64:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __piston_negotiate_block_invoke_7_cold_2();
        goto LABEL_14;
    }
  }
  *(_QWORD *)(v7 + 552) |= v13;
  if (md_get_uint16le(v8, &size))
    goto LABEL_14;
  if (md_get_mem(v8, (char *)(v7 + 92), 16, 0))
    goto LABEL_14;
  v14 = (unsigned int *)(v7 + 76);
  if (md_get_uint32le(v8, (_DWORD *)(v7 + 76)))
    goto LABEL_14;
  v15 = *v14;
  if ((*v14 & 2) == 0)
  {
    if (piston_log_level && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "smb2_smb_parse_negotiate";
      _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Server does not support leasing but supports dir leases? Disabling dir leases. \n", buf, 0xCu);
      v15 = *v14;
    }
    *v14 = v15 & 0xFFFFFFDF;
  }
  if ((*(_BYTE *)(v7 + 553) & 0xC8) != 0 && (v15 & 2) != 0)
  {
    objc_msgSend(v6, "sr_pd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "resp_wait_timeout");

    if (v18 <= 0x2C)
    {
      objc_msgSend(v6, "sr_pd");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sock");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setResp_wait_timeout:", 45);

      if (piston_log_level)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __piston_negotiate_block_invoke_7_cold_4(v6);
      }
    }
  }
  if (md_get_uint32le(v8, (_DWORD *)(v7 + 80))
    || md_get_uint32le(v8, (_DWORD *)(v7 + 84))
    || md_get_uint32le(v8, (_DWORD *)(v7 + 88))
    || md_get_mem(v8, __dst, 8, 0)
    || md_get_mem(v8, v40, 8, 0)
    || md_get_uint16le(v8, (_WORD *)&size + 2)
    || md_get_uint16le(v8, (_WORD *)&size + 1)
    || md_get_uint32le(v8, &v36))
  {
    goto LABEL_14;
  }
  if (WORD2(size))
  {
    WORD2(size) -= 128;
    if (md_get_mem(v8, 0, WORD2(size), 0))
      goto LABEL_14;
    v21 = WORD2(size) + 64;
  }
  else
  {
    v21 = 64;
  }
  v22 = *(void **)(v7 + 144);
  if (v22)
  {
    free(v22);
    *(_QWORD *)(v7 + 144) = 0;
  }
  *(_QWORD *)(v7 + 136) = 0;
  if (WORD1(size))
  {
    v23 = (char *)malloc_type_malloc(WORD1(size), 0xBA86BDD5uLL);
    *(_QWORD *)(v7 + 144) = v23;
    if (v23)
    {
      v24 = WORD1(size);
      *(_QWORD *)(v7 + 136) = WORD1(size);
      if (!md_get_mem(v8, v23, v24, 0))
      {
        piston_gss_parse_server_mechs(v7);
        v25 = 0;
        v21 += WORD1(size);
        goto LABEL_75;
      }
      goto LABEL_14;
    }
    v25 = 12;
  }
  else
  {
    v25 = 0;
  }
LABEL_75:
  if ((*(_BYTE *)(v7 + 554) & 2) != 0)
    v25 = smb2_smb_parse_negotiate_contexts(v7, v8, v21, v36, (unsigned __int16)size);

  if (v25)
    goto LABEL_15;
  if (*(_DWORD *)(a1 + 68) == 1
    && *(_DWORD *)(a1 + 72) != *(_DWORD *)(*(_QWORD *)(a1 + 56) + 64)
    && piston_log_level
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __piston_negotiate_block_invoke_7_cold_3(a1 + 72, a1 + 56, v26, v27, v28, v29, v30, v31);
  }
  v32 = *(_QWORD *)(a1 + 48);
  v11 = 0;
  if (v32)
  {
    v33 = *(_QWORD *)(a1 + 56);
    *(_WORD *)(v32 + 4) = *(_WORD *)(v33 + 108);
    *(_DWORD *)(v32 + 6) = *(_DWORD *)(v33 + 70);
    *(_OWORD *)(v32 + 16) = *(_OWORD *)(v33 + 92);
    v35 = *(_QWORD *)(a1 + 48);
    v34 = *(_QWORD *)(a1 + 56);
    *(_OWORD *)(v35 + 32) = *(_OWORD *)(v34 + 76);
    *(_DWORD *)(v35 + 48) = *(_DWORD *)(v34 + 112);
  }
LABEL_18:
  if (*v5)
    objc_msgSend(*v5, "smb_rq_done");
  if (v4)
    v4[2](v4, v11);

}

uint64_t smb2_smb_parse_negotiate_contexts(uint64_t a1, __n128 *a2, int a3, int a4, int a5)
{
  uint64_t result;
  NSObject *v9;
  int v10;
  int v11;
  unsigned __int16 v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __n128 v21[2];
  int v22;
  int v23;
  __int16 v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = 0;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v22 = 0;
  v23 = 0;
  memset(v21, 0, sizeof(v21));
  if (a1)
  {
    if (a4)
    {
      result = md_get_mem(a2, 0, (a4 - a3 - 64), 0);
      if ((_DWORD)result)
        return result;
    }
    v9 = MEMORY[0x24BDACB70];
    while (1)
    {
      md_shadow_copy(a2, v21);
      result = md_get_uint16le(v21, (_WORD *)&v28 + 1);
      if ((_DWORD)result)
        return result;
      result = md_get_uint16le(v21, &v28);
      if ((_DWORD)result)
        return result;
      result = md_get_uint32le(v21, 0);
      if ((_DWORD)result)
        return result;
      switch(HIWORD(v28))
      {
        case 1:
          result = md_get_uint16le(v21, (_WORD *)&v27 + 1);
          if ((_DWORD)result)
            return result;
          result = md_get_uint16le(v21, &v27);
          if ((_DWORD)result)
            return result;
          if (!HIWORD(v27))
            goto LABEL_15;
          v10 = 0;
          while (1)
          {
            result = md_get_uint16le(v21, (_WORD *)&v26 + 1);
            if ((_DWORD)result)
              return result;
            if (++v10 >= HIWORD(v27))
            {
LABEL_15:
              result = md_get_mem(v21, 0, (unsigned __int16)v27, 0);
              if (!(_DWORD)result)
                goto LABEL_36;
              return result;
            }
          }
        case 2:
          result = md_get_uint16le(v21, &v26);
          if (!(_DWORD)result)
          {
            if ((unsigned __int16)v26 != 1)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                smb2_smb_parse_negotiate_contexts_cold_2();
              return 72;
            }
            result = md_get_uint16le(v21, (_WORD *)&v25 + 1);
            if (!(_DWORD)result)
            {
              *(_WORD *)(a1 + 492) = HIWORD(v25);
              goto LABEL_36;
            }
          }
          return result;
        case 3:
          result = md_get_uint16le(v21, &v25);
          if (!(_DWORD)result)
          {
            result = md_get_uint16le(v21, 0);
            if (!(_DWORD)result)
            {
              result = md_get_uint32le(v21, &v23);
              if (!(_DWORD)result)
              {
                if (!(_WORD)v25)
                  goto LABEL_36;
                v11 = 0;
                while (1)
                {
                  result = md_get_uint16le(v21, &v24);
                  if ((_DWORD)result)
                    break;
                  if (++v11 >= (unsigned __int16)v25)
                    goto LABEL_36;
                }
              }
            }
          }
          return result;
        case 6:
        case 7:
          goto LABEL_36;
        case 8:
          result = md_get_uint16le(v21, (_WORD *)&v22 + 1);
          if ((_DWORD)result)
            return result;
          if (HIWORD(v22) != 1)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              smb2_smb_parse_negotiate_contexts_cold_4();
            return 72;
          }
          result = md_get_uint16le(v21, &v22);
          if ((_DWORD)result)
            return result;
          if ((unsigned __int16)v22 - 3 <= 0xFFFFFFFD)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              smb2_smb_parse_negotiate_contexts_cold_3();
            return 22;
          }
          *(_WORD *)(a1 + 264) = v22;
LABEL_36:
          if (!(_WORD)--a5)
            return 0;
          if ((v28 & 7) != 0)
            v12 = ((v28 + 8) & 0xFFF8) + 8;
          else
            v12 = v28 + 8;
          LOWORD(v28) = v12;
          result = md_get_mem(a2, 0, v12, 0);
          if ((_DWORD)result)
            return result;
          break;
        default:
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v30 = "smb2_smb_parse_negotiate_contexts";
            v31 = 1024;
            v32 = HIWORD(v28);
            _os_log_error_impl(&dword_23028F000, v9, OS_LOG_TYPE_ERROR, "%s: Unknown context type: 0x%x\n", buf, 0x12u);
          }
          goto LABEL_36;
      }
    }
  }
  v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v13)
    smb2_smb_parse_negotiate_contexts_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  return 22;
}

uint64_t decode_MechType()
{
  return _asn1_decode_top();
}

uint64_t encode_MechType()
{
  return _asn1_encode();
}

uint64_t length_MechType()
{
  return _asn1_length();
}

uint64_t free_MechType()
{
  return _asn1_free_top();
}

uint64_t copy_MechType()
{
  return _asn1_copy_top();
}

uint64_t decode_MechTypeList()
{
  return _asn1_decode_top();
}

uint64_t encode_MechTypeList()
{
  return _asn1_encode();
}

uint64_t length_MechTypeList()
{
  return _asn1_length();
}

uint64_t free_MechTypeList()
{
  return _asn1_free_top();
}

uint64_t copy_MechTypeList()
{
  return _asn1_copy_top();
}

uint64_t decode_ContextFlags()
{
  return _asn1_decode_top();
}

uint64_t encode_ContextFlags()
{
  return _asn1_encode();
}

uint64_t length_ContextFlags()
{
  return _asn1_length();
}

uint64_t free_ContextFlags()
{
  return _asn1_free_top();
}

uint64_t copy_ContextFlags()
{
  return _asn1_copy_top();
}

uint64_t ContextFlags2int(char a1)
{
  return a1 & 0x7F;
}

uint64_t int2ContextFlags(char a1)
{
  return a1 & 0x7F;
}

uint64_t decode_NegHints()
{
  return _asn1_decode_top();
}

uint64_t encode_NegHints()
{
  return _asn1_encode();
}

uint64_t length_NegHints()
{
  return _asn1_length();
}

uint64_t free_NegHints()
{
  return _asn1_free_top();
}

uint64_t copy_NegHints()
{
  return _asn1_copy_top();
}

uint64_t decode_NegTokenInitWin()
{
  return _asn1_decode_top();
}

uint64_t encode_NegTokenInitWin()
{
  return _asn1_encode();
}

uint64_t length_NegTokenInitWin()
{
  return _asn1_length();
}

uint64_t free_NegTokenInitWin()
{
  return _asn1_free_top();
}

uint64_t copy_NegTokenInitWin()
{
  return _asn1_copy_top();
}

uint64_t decode_NegTokenInit()
{
  return _asn1_decode_top();
}

uint64_t encode_NegTokenInit()
{
  return _asn1_encode();
}

uint64_t length_NegTokenInit()
{
  return _asn1_length();
}

uint64_t free_NegTokenInit()
{
  return _asn1_free_top();
}

uint64_t copy_NegTokenInit()
{
  return _asn1_copy_top();
}

uint64_t decode_NegResultEnum()
{
  return _asn1_decode_top();
}

uint64_t encode_NegResultEnum()
{
  return _asn1_encode();
}

uint64_t length_NegResultEnum()
{
  return _asn1_length();
}

uint64_t free_NegResultEnum()
{
  return _asn1_free_top();
}

uint64_t copy_NegResultEnum()
{
  return _asn1_copy_top();
}

uint64_t decode_NegTokenResp()
{
  return _asn1_decode_top();
}

uint64_t encode_NegTokenResp()
{
  return _asn1_encode();
}

uint64_t length_NegTokenResp()
{
  return _asn1_length();
}

uint64_t free_NegTokenResp()
{
  return _asn1_free_top();
}

uint64_t copy_NegTokenResp()
{
  return _asn1_copy_top();
}

uint64_t decode_NegotiationToken()
{
  return _asn1_decode_top();
}

uint64_t encode_NegotiationToken()
{
  return _asn1_encode();
}

uint64_t length_NegotiationToken()
{
  return _asn1_length();
}

uint64_t free_NegotiationToken()
{
  return _asn1_free_top();
}

uint64_t copy_NegotiationToken()
{
  return _asn1_copy_top();
}

uint64_t decode_NegotiationTokenWin()
{
  return _asn1_decode_top();
}

uint64_t encode_NegotiationTokenWin()
{
  return _asn1_encode();
}

uint64_t length_NegotiationTokenWin()
{
  return _asn1_length();
}

uint64_t free_NegotiationTokenWin()
{
  return _asn1_free_top();
}

uint64_t copy_NegotiationTokenWin()
{
  return _asn1_copy_top();
}

void piston_set_info_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "piston_set_info";
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

void piston_set_info_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_set_info failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_set_info_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_set_info_cold_2(uint8_t *buf, int a2, int a3)
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = "smb2_smb_set_info";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a3;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", buf, 0x18u);
}

void smb2_smb_set_info_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_set_info_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown file info class: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_set_info_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: error %d from smb_put_dmem for name\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_set_info_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_set_info_block_invoke_cold_2(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
}

void smb2fs_smb_set_delete_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_set_info failed %d ntstatus %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_set_eof_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_set_info failed %d ntstatus %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_setfattrNT_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smb2fs_smb_set_file_basic_info failed %d\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_setfattrNT_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "shareID");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: share_id <%d> not found. \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_setfattrNT_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_set_info failed %d ntstatus %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_read_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_read_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_read_one failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_read_one_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_write_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_write_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_write_one failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_write_one_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Not enough data in ioBuffer <%d> < <%d> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void smb2_smb_write_one_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_write_one_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: mb_put_mem failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_read_one_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_read_one_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_write_one_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_read_one_block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __smb2_smb_write_one_block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void piston_query_dir_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_query_dir_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_query_info failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_dir_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: outputBuffer is NULL \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_dir_cold_2(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315650;
  *(_QWORD *)(a1 + 4) = "smb2_smb_query_dir";
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 18) = 1024;
  *(_DWORD *)(a1 + 20) = a3;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)a1);
}

void smb2_smb_query_dir_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_dir_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: path is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_dir_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: error 0x%x from smb_put_dmem for name\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_dir_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_dir_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting output buffer offset bytes\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_dir_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting output buffer len\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_dir_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting output buffer offset\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_dir_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_dir_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed getting struct size\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_query_dir_block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_7(a1);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

void piston_change_notify_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "piston_change_notify";
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

void piston_change_notify_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_change_notify failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_change_notify_cold_3(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315650;
  *(_QWORD *)(a1 + 4) = "smb2_smb_change_notify";
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 18) = 1024;
  *(_DWORD *)(a1 + 20) = a3;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)a1);
}

void piston_change_notify_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_change_notify_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_change_notify_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Bad struct size: %u\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_change_notify_block_invoke_cold_1(id *a1, int a2)
{
  int v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "sr_ntstatus");
  v5 = 136315650;
  v6 = "smb2_smb_change_notify_block_invoke";
  v7 = 1024;
  v8 = a2;
  v9 = 1024;
  v10 = v3;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v4, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v5);
}

void piston_query_info_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_query_info failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_info_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown info_type: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_info_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown SMB2_0_INFO_FILE/file_info_class: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_info_cold_4(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315650;
  *(_QWORD *)(a1 + 4) = "smb2_smb_query_info";
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 18) = 1024;
  *(_DWORD *)(a1 + 20) = a3;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)a1);
}

void smb2_smb_query_info_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_info_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown SMB2_0_INFO_FILESYSTEM/file_info_class: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_query_info_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown SMB2_0_INFO_SECURITY/file_info_class: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_query_share_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_query_share_info_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_query_share_info_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMBNode failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_query_share_info_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close_fid failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_query_share_info_block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_query_info failed for fs_attr <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_query_share_info_block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_query_info failed for fs_size <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_query_share_info_block_invoke_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_create_fid failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_query_share_info_block_invoke_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: outputBuffer is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_info_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: File name len of <0> \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_info_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal file name len %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_info_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smbfs_ntwrkname_tolocal returned NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_info_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Should not have gotten here \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_query_info_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_file_all_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMBFileAllInformation failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_file_all_info_cold_2(uint64_t a1, uint64_t a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = "smb2_smb_parse_file_all_info";
  v4 = 2080;
  v5 = a1;
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Filename %s utf8_char_cnt = %lu \n", (uint8_t *)&v2, 0x20u);
  OUTLINED_FUNCTION_5_1();
}

void smb2_smb_parse_file_all_info_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: File name len of <0>\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_file_all_info_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal file name len %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_file_all_info_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smbfs_ntwrkname_tolocal returned NULL. Bad path from server? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_fs_attr_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "shareID");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: share_id <%d> not found. \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_fs_attr_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Malloc failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_fs_attr_cold_3(void *a1, uint64_t a2)
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sharename");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = 136316418;
  v6 = "smb2_smb_parse_fs_attr";
  v7 = 2080;
  v8 = objc_msgSend(v4, "cStringUsingEncoding:", 4);
  v9 = 2080;
  v10 = a2;
  v11 = 1024;
  v12 = objc_msgSend(a1, "file_system_attrs");
  v13 = 1024;
  v14 = objc_msgSend(a1, "max_component_name_len");
  v15 = 1024;
  v16 = objc_msgSend(a1, "fstype");
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: %s type '%s', attr 0x%x, max_cnp_name %d, fstype %d\n", (uint8_t *)&v5, 0x32u);

}

void smb2_smb_parse_fs_attr_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smbfs_ntwrkname_tolocal return NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_fs_attr_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal file name len %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_fs_size_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "shareID");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: treeID <%d> not found. \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_security_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: outputBuffer is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_security_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_security_cold_3()
{
  int v0[4];
  __int16 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_4();
  v1 = 2048;
  v2 = 20;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Output buffer len %d < ntsecdesc %ld\n", (uint8_t *)v0, 0x1Cu);
  OUTLINED_FUNCTION_5_1();
}

void __smb2_smb_query_info_block_invoke_cold_1(id *a1, int a2)
{
  int v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "sr_ntstatus");
  v5 = 136315650;
  v6 = "smb2_smb_query_info_block_invoke";
  v7 = 1024;
  v8 = a2;
  v9 = 1024;
  v10 = v3;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v4, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v5);
  OUTLINED_FUNCTION_5_1();
}

void smb2fs_smb_listxattrs_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: NSMutableData failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_listxattrs_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_query_info failed, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_listxattrs_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMB_MALLOC failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void mbuf_free_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Double FREE", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void mbuf_split_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: src is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void mbuf_split_cold_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315650;
  v5 = "mbuf_split";
  v6 = 2048;
  v7 = a2;
  v8 = 2048;
  v9 = v3;
  OUTLINED_FUNCTION_0_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: offset %zu > src->m_maxlen %zu \n", (uint8_t *)&v4);
}

void mbuf_split_cold_3(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "mbuf_split";
  v3 = 1024;
  v4 = a1;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: smb_mbuf_get failed <%d> \n", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

uint64_t mb_reserve_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(_DWORD *)a1 = 136315650;
  *(_QWORD *)(a1 + 4) = "mb_reserve";
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 22) = 2048;
  *(_QWORD *)(a1 + 24) = a3;
  OUTLINED_FUNCTION_0_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: mb_reserve: size (%ld) > mbuf_maxlen (%ld)", (uint8_t *)a1);
  return a4 & 1;
}

void md_get_mem_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "md_get_mem";
  v5 = 2048;
  v6 = a1;
  v7 = 2048;
  v8 = a2;
  OUTLINED_FUNCTION_0_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: WARNING: Incomplete copy original size = %ld size = %ld\n", (uint8_t *)&v3);
}

void piston_tree_connect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_tree_connect_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_tree_connect failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_tree_connect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: shareName is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_tree_connect_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smb_get_cstring_len failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_tree_connect_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: share name too long \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_tree_connect_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: error %d from smb_put_dmem for share name\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_tree_connect_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: error %d from smb_put_dmem for back slash\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_tree_connect_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: error %d from smb_put_dmem for srvr name\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_tree_connect_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Illegal chars in share name \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_tree_connect_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Illegal control chars in share name \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_tree_connect_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_tree_connect with IP address failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_tree_connect_block_invoke_cold_2(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v3 = 136315650;
  v4 = "piston_tree_connect_block_invoke";
  v5 = 1024;
  v6 = a2;
  v7 = 2080;
  v8 = v2;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: treeconnect failed <%d> with server name <%s> \n", (uint8_t *)&v3, 0x1Cu);
}

void piston_tree_disconnect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_tree_disconnect_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_tree_disconnect failed <%d> for share_id <%d>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_tree_disconnect_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_tree_disconnect_cold_4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "tree_id");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: tree_id <%d> is invalid. \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_tree_disconnect_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_tree_connect_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_tree_connect_block_invoke_cold_2(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __smb2_smb_tree_disconnect_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_tree_disconnect_block_invoke_cold_2(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void piston_logoff_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_logoff_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Bad struct size: %u\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_logoff_cold_3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "sr_ntstatus");
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void piston_session_setup_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: reset keys due to <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Missing username or password \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: piston_gss_transact failed <%d>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb3_verify_session_setup returned %d. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Got guest access, but wanted real access, logging off.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smb2_smb_gss_session_setup failed <%d> NT Status<0x%x> \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Connecting using NTLM \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Connecting using LKDC \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Connecting using KRB5 \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_10(id *a1)
{
  id v1;
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "realm");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = 136315394;
  v3 = "piston_session_setup_block_invoke";
  v4 = 2080;
  v5 = objc_msgSend(v1, "cStringUsingEncoding:", 4);
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Using realm <%s> \n", (uint8_t *)&v2, 0x16u);

  OUTLINED_FUNCTION_4_0();
}

void __piston_session_setup_block_invoke_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Setting realm to NULL since none passed in \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_session_setup_block_invoke_cold_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Connecting using guest \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_ntstatus_to_errno_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Couldn't map ntstatus (0x%x) to errno returning EIO\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_set_session_key_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: malloc failed for full_session_mackey \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_set_session_key_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: malloc failed for session_mackey\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_network_to_path_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_convert_from_network = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: inbuf is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: *inbuf is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: outbuf is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Cant handle non Unicode \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: CFStringCreateWithCString failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CFStringCreateMutableCopy failed for <%s>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: CFStringGetBytes failed to get len\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: calloc failed for encode_len <%lu>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: CFStringGetBytes failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_from_network_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: outbuf too small \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: inbuf is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: *inbuf is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: outbuf is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: *outbuf is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Cant handle non Unicode \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CFStringCreateWithCString failed for <%s>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CFStringCreateMutableCopy failed for <%s>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CFStringGetBytes failed to get len for <%s>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: outbuf too small \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_convert_to_network_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CFStringGetBytes failed for <%s>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_get_alloc_size_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "shareID");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: share_id <%d> not found. \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_get_alloc_size_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sharep->fs_block_size is 0 \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_get_client_capabilities_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Null sessionp \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_get_client_dialects_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Not enough space for dialects %ld \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_get_client_dialects_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMB311 is disabled \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_get_client_dialects_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Unknown dialect for reconnect 0x%llx \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_get_client_security_mode_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Null sessionp \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_file_id_check_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Server does not support File IDs \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_get_create_options_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_get_create_options_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sharep attributes not retrieved yet? Assuming share supports reparse points \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_close_file_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "piston_close_file";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void piston_close_file_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_close_cold_1(_DWORD *a1, int a2, int a3)
{
  uint64_t v3;
  uint8_t *v4;

  *a1 = 136315650;
  OUTLINED_FUNCTION_7_1((uint64_t)a1, a2, a3, (uint64_t)"smb2_smb_close");
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v3, "%s: Reply failed <%d> ntStatus <0x%x> \n", v4);
}

void smb2_smb_close_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_close_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "smb2_smb_close";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Trying to close a fid of zero???\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void piston_create_file_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "piston_create_file";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void piston_create_file_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_create failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_create_cold_1(_DWORD *a1, int a2, int a3)
{
  uint64_t v3;
  uint8_t *v4;

  *a1 = 136315650;
  OUTLINED_FUNCTION_7_1((uint64_t)a1, a2, a3, (uint64_t)"smb2_smb_create");
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v3, "%s: Reply failed <%d> ntStatus <0x%x> \n", v4);
}

void smb2_smb_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_create_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "smb2_smb_add_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Persistent handles do not need to add lease \n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_create_cold_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "smb2_smb_add_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Requesting reconnect with persistent handle \n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_create_cold_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "smb2_smb_add_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Requesting persistent handle \n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_create_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: error %d from smb_put_dmem for name\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_resolveID_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "piston_resolveID";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void piston_resolveID_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "piston_resolveID";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: ResolveID not supported. \n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __piston_resolveID_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_resolveID_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "piston_resolveID_block_invoke";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMBNode failed\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __piston_resolveID_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close_fid failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_resolveID_block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_create_fid failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_resolveID_block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_close_fid_cold_1()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  v3 = 136315650;
  v4 = "smb2_smb_close_fid";
  v5 = 1024;
  v6 = v0;
  v7 = 1024;
  v8 = v1;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v2, "%s: smb2_smb_close failed %d ntstatus 0x%x\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_close_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_close_block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_7(a1);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)v2);
  OUTLINED_FUNCTION_5_1();
}

void smb2_smb_parse_create_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "smb2_smb_parse_create";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Found a NON OS X server\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_create_block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_7(a1);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)v2);
  OUTLINED_FUNCTION_5_1();
}

void smb2_smb_parse_create_contexts_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown context name: 0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal MxAc data len: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal RqLs data len: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_4(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Received lease V2 response for a lease V1 request \n", a1);
}

void smb2_smb_parse_create_contexts_cold_5(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Received lease V1 response for a lease V2 request \n", a1);
}

void smb2_smb_parse_create_contexts_cold_6(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Received Durable Handle V1 response for a Durable Handle V2 request \n", a1);
}

void smb2_smb_parse_create_contexts_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal DHnQ data len: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_8(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Server unexpectedly granted persistent handle??? \n", a1);
}

void smb2_smb_parse_create_contexts_cold_9(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Server failed to grant persistent handle??? \n", a1);
}

void smb2_smb_parse_create_contexts_cold_10(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Persistent handle granted \n", a1);
}

void smb2_smb_parse_create_contexts_cold_11(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Received Durable Handle V2 response for a Durable Handle V1 request \n", a1);
}

void smb2_smb_parse_create_contexts_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal DH2Q data len: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal AAPL data len: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown AAPL subcommand: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal AAPL data len (cmd/pad): %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_16()
{
  uint64_t *v0;
  uint64_t v1;
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  v1 = *v0;
  v3 = 136315650;
  v4 = "smb2_smb_parse_create_contexts";
  v5 = 1024;
  v6 = v2;
  v7 = 2048;
  v8 = v1;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Illegal kAAPL_SERVER_QUERY data len: %u, reply_bitmap 0x%llx\n", (uint8_t *)&v3, 0x1Cu);
  OUTLINED_FUNCTION_5_1();
}

void smb2_smb_parse_create_contexts_cold_17(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Found an OS X server\n", a1);
}

void smb2_smb_parse_create_contexts_cold_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: resolve_idp is NULL \n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal kAAPL_RESOLVE_ID data len (cmd/pad): %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_contexts_cold_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Illegal context name length: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_str_cold_1()
{
  __int16 v0;
  int v1;
  uint64_t v2;
  int v3[4];
  __int16 v4;
  int v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  v3[0] = 136315650;
  OUTLINED_FUNCTION_5();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v2, "%s: Illegal string len <%d> > <%d>\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_str_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Malloc failed for model string %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_str_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "smb2_smb_parse_create_str";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smbfs_ntwrkname_tolocal return NULL\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_create_str_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_convert_network_to_path failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_lease_break_ack_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_lease_break_ack_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_lease_break_ack failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_lease_break_ack_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: treeID <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_lease_break_ack_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_lease_break_ack_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v5 = 136316162;
  v6 = "smb2_smb_lease_break_ack_block_invoke";
  v7 = 2048;
  v8 = v1;
  v9 = 2048;
  v10 = v2;
  v11 = 2048;
  v12 = v4;
  v13 = 2048;
  v14 = v3;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Lease key mismatch: 0x%llx:0x%llx != 0x%llx:0x%llx\n", (uint8_t *)&v5, 0x34u);
}

void __smb2_smb_lease_break_ack_block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_lease_break_ack_block_invoke_cold_3(id *a1, int a2)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "sr_ntstatus");
  v4 = 136315650;
  v5 = "smb2_smb_lease_break_ack_block_invoke";
  v6 = 1024;
  v7 = a2;
  v8 = 1024;
  v9 = v3;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void smb2_smb_parse_lease_break_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No event callback, thus ignoring lease break \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_lease_break_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMBPistonEvents failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_lease_break_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_lease_break_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_rq_parse_header failed %d for lease break \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_lock_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "piston_lock";
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

void piston_lock_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_lock failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_lock_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_lock_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown lock type %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_lock_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Bad struct size: %u\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_lock_block_invoke_cold_2(id *a1, int a2)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "sr_ntstatus");
  v4 = 136315650;
  v5 = "smb2_smb_lock_block_invoke";
  v6 = 1024;
  v7 = a2;
  v8 = 1024;
  v9 = v3;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void piston_ioctl_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unsupported ioctl: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dfsReferral or rcvOutputBuffer is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: c_dfs_ref_namep is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_6(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315650;
  *(_QWORD *)(a1 + 4) = "smb2_smb_ioctl";
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 18) = 1024;
  *(_DWORD *)(a1 + 20) = a3;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)a1);
}

void smb2_smb_ioctl_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: reparsePath is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sendInputBuffer or rcvOutputBuffer is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Pipe transceive needs > 0 data\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: pipeName is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: c_target_namep is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: pipeName len is invalid \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: set reparse len is invalid \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sendInputBuffer is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_ioctl_cold_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: rcvOutputBuffer is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_validate_negotiate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sessionp is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_validate_negotiate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_validate_negotiate_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Dialect count too high <%hu>? \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_validate_negotiate_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_validate_negotiate_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_validate_negotiate_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Unknown server dialect does not match \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_validate_negotiate_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Server dialect does not match \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_validate_negotiate_block_invoke_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Server security mode does not match \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_validate_negotiate_block_invoke_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Server GUID does not match \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_validate_negotiate_block_invoke_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Server capabilities do not match \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_validate_negotiate_block_invoke_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Server does not fully support Validate Negotiate %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unsupported ret ioctl: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: flags is supposed to be 0: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: ret_input_len is supposed to be 0: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: ret_output_len is supposed to be 32, got: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_parse_copychunk_response failed, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: ret_output_len is supposed to be 12, got: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Validate Neg output buffer too small: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: output_count is supposed to be 24, got: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_ioctl_internal_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_ioctl_block_invoke_cold_1(id *a1, int a2)
{
  int v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "sr_ntstatus");
  v5 = 136315650;
  v6 = "smb2_smb_ioctl_block_invoke";
  v7 = 1024;
  v8 = a2;
  v9 = 1024;
  v10 = v3;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v4, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v5);
  OUTLINED_FUNCTION_5_1();
}

void smb2_smb_parse_ioctl_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: pd is null? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: malloc failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Named streams must be supported for Win copyfile \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close_fid failed (src) %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2fs_smb_listxattrs failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_create_fid failed (src file) %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: targetNode failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_server_copy_file_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sourceNode failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sourceNode failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: targetNode failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: NSMutableData failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMB_MALLOC failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_7(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Resume key too short %d \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed to get resume key, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close_fid failed (src) %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_create_fid failed (targ file) %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_create_fid failed (src file) %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copyfile_stream_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_check_copyfile_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: NSMutableData failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_check_copyfile_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Resume key too short %d \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_check_copyfile_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed to get resume key, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_get_reparse_point_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad reparse tag: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_get_resume_key_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_copychunk_response_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copyfile_win_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2fs_smb_copyfile_win_xattr failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copyfile_win_xattr_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2fs_smb_copyfile_stream failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close_fid failed (tgt) %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_close_fid failed (src) %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: failed setting mtime: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: failed setting target eof, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2fs_smb_copychunks failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copychunks_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: copychunk result: nt_stat: 0x%0x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copychunks_block_invoke_cold_2(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_13(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: rcv_output_buffer too small, expected: %lu, got: %u\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5_1();
}

void __smb2fs_smb_copychunks_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2fs_smb_copychunks_win_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: NSMutableData failed\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copychunks_block_invoke_3_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2fs_smb_copychunks_win failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_13(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: rcv_output_buffer too small, expected: %lu, got: %u\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5_1();
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_ioctl result: nt_stat: 0x%0x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Trying with smaller chunk size <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: copychunk error: total_bytes_written: %u, expected: %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_5_1();
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_5()
{
  __int16 v0;
  int v1;
  uint64_t v2;
  int v3[4];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_10();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_4_1(&dword_23028F000, MEMORY[0x24BDACB70], v2, "%s: copychunk error: chunks_written: %u, expected: %u\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_1();
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_6(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(uint64_t **)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *v2;
  LODWORD(v2) = *((_DWORD *)v2 + 5);
  v5 = *(_DWORD *)(a1 + 112);
  v6 = 136316418;
  v7 = "smb2fs_smb_copychunks_win_block_invoke";
  v8 = 1024;
  v9 = a2;
  v10 = 2048;
  v11 = v4;
  v12 = 1024;
  v13 = (int)v2;
  v14 = 1024;
  v15 = v5;
  v16 = 2048;
  v17 = v3;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: smb2_smb_ioctl error: %d, remain: %llu, max_chunk: %u, count: %u, this_len: %llu\n", (uint8_t *)&v6, 0x32u);
}

void smb2_smb_echo_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "smb2_smb_echo";
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_echo_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smb_rq_simple_block failed <%d> \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_echo_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Bad struct size: %u\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_echo_block_invoke_cold_2(uint64_t a1, int a2)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  v4 = 136315650;
  v5 = "smb2_smb_echo_block_invoke";
  v6 = 1024;
  v7 = a2;
  v8 = 1024;
  v9 = v3;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void smb_rq_bend_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: no bcount\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_rq_bend_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: byte count too large (%ld)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_rq_bend32_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: no lcount\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_rq_bend32_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: byte count too large (%ld)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_rq_simple_timed_cold_1(unsigned __int16 a1, uint8_t *buf, int a3)
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = "smb_rq_simple_timed";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a1;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: timed out <%d> secs waiting on cmd <%x> \n", buf, 0x18u);
}

void smb_rq_simple_timed_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: piston_send_request failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb_rq_simple_block_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: piston_send_request failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_alloc_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: malloc failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_alloc_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: SMB 2/3 not allowed on SMB 1 connection. cmd = %x\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_alloc_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: mb_init failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_alloc_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: credit count %d < 0 \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_message_id_increment_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: rqp is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_message_id_increment_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sessionp is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_next_command_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_parse_header_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: rqp is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_parse_header_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: STATUS_INSUFFICIENT_RESOURCES: while attempting cmd %x\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_parse_header_cold_3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_3(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: STATUS_NETWORK_SESSION_EXPIRED: while attempting cmd %x. Reconnecting.\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_parse_header_cold_4(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 136315906;
  v6 = "smb2_rq_parse_header";
  v7 = 2048;
  v8 = v3;
  v9 = 2048;
  v10 = v4;
  v11 = 2048;
  v12 = objc_msgSend(a3, "sr_rspasyncid");
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Async rsp ids do not match: id %lld async_id %lld ! = %lld\n", (uint8_t *)&v5, 0x2Au);
}

void smb2_rq_parse_header_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_smb3_derive_keys_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: pd is null? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_smb3_derive_keys_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sessionp is null? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_smb3_derive_keys_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Keys not generated, missing session key\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_smb3_derive_keys_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Warning: Session.SessionKey too small, len: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_smb3_derive_keys_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Could not generate smb3 decrypt key, error: %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_smb3_derive_keys_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Could not generate smb3 encrypt key, error: %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_smb3_derive_keys_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: piston_smb3_kdf_hmac_sha256 failed <%d>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_sign_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Called with NULL rqp\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_sign_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sessionp is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_sign_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No session key for signing.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_sign_cold_4(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_sign";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sr_rqsig was never allocated.\n", a1);
}

void smb2_rq_sign_cold_5(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb3_sign";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sr_rqsig was never allocated.\n", a1);
}

void smb2_rq_verify_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Called with NULL rqp\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: NULL sessionp\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: signatures not enabled!\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "sr_messageid");
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Could not verify signature for sr_command %x, msgid: %llu\n", v2, v3, v4, v5, 2u);
}

void smb2_rq_verify_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sessionp is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: mb_off: %lu past end of mbuf, mbuf_len: %lu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_5_1();
}

void smb2_rq_verify_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: reply length: %lu too short\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: mbuf_next didn't return an mbuf\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sessionp is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: SMB3 signing key len too small: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Signature not found\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_rq_verify_cold_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_8_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: SigExpected: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_18();
}

BOOL smb2_rq_verify_cold_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_8_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: SigCalc: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
  return piston_log_level == 0;
}

BOOL smb2_rq_verify_cold_19(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "sr_messageid");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: SMB3 signature mismatch: mid %llu\n", v2, v3, v4, v5, 2u);
  return piston_log_level == 0;
}

void smb2_rq_verify_cold_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Not enough bytes for signature\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smb3 encr, no key\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: mb msglen too big for transform: %lu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorGCMFinalize ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorUpdate smbhdr ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorAddParameter kCCParameterAuthData ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorAddParameter kCCParameterIV ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorCreateWithMode ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorGetParameter kCCParameterAuthTag ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorFinal had leftover data of len %zu", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorFinal ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorAddParameter kCCMacSize ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorAddParameter kCCDataSize ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: No mbuf for transform hdr, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_rq_encrypt_cold_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown cipher %d defaulting to SMB2_ENCRYPTION_AES_128_CCM \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: smb3 decr, no key\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: %s: CCCryptorGCMFinalize ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_5_1();
}

void smb3_msg_decrypt_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorUpdate hdr+payload ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorAddParameter kCCParameterAuthData ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorAddParameter kCCParameterIV ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorCreateWithMode ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_8_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CalcSig: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_18();
}

void smb3_msg_decrypt_cold_8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_23028F000, MEMORY[0x24BDACB70], a2[15], "%s: TF Sig: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", a2[17], a2[18], 1024, a8, 2u);
  OUTLINED_FUNCTION_18();
}

void smb3_msg_decrypt_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Transform signature mismatch\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorGetParameter kCCParameterAuthTag ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorFinal had leftover data of len %zu", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: %s: CCCryptorFinal ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_5_1();
}

void smb3_msg_decrypt_cold_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorAddParameter kCCMacSize ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorAddParameter kCCDataSize ccstatus %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: TF sess_id mismatch: expect: %llu got: %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_5_1();
}

void smb3_msg_decrypt_cold_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unsupported ENCR alg: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_msg_decrypt_cold_21(unsigned __int8 *a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = 136316162;
  v6 = "smb3_msg_decrypt";
  v7 = 1024;
  v8 = v1;
  v9 = 1024;
  v10 = v2;
  v11 = 1024;
  v12 = v3;
  v13 = 1024;
  v14 = v4;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: TF HDR protocol incorrect: %02x %02x %02x %02x\n", (uint8_t *)&v5, 0x24u);
  OUTLINED_FUNCTION_5_1();
}

void smb3_msg_decrypt_cold_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown cipher %d defaulting to SMB2_ENCRYPTION_AES_128_CCM \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_verify_session_setup_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sess_setup_reply is null or sess_setup_len is 0 \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_verify_session_setup_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: sess_setup_reply is too small %zu \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_verify_session_setup_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: SMB3 keylen too small %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_verify_session_setup_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Signing algorithm (%u) not supported", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_verify_session_setup_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_8_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: SigExpected: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_18();
}

void smb3_verify_session_setup_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_8_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: SigCalc: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_18();
}

void smb3_verify_session_setup_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: SMB3 signature mismatch on last session setup reply \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_verify_session_setup_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: cccmac_one_shot_generate failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_verify_session_setup_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorGCMOneshotEncrypt failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: out_signaturep is null\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: mbp and mdp are null\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb3 keylen %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Signing algorithm (%u) not supported", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: CCAESCmacCreate failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Not enough bytes in packet? <%zu>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorGCMFinalize failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorGCMSetIV failed <%d> for write pads \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorGCMSetIV failed <%d> for write \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorGCMSetIV failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb3_get_signature_cold_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CCCryptorCreateWithMode failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_flush_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "piston_flush";
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

void piston_flush_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_flush failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_flush_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_flush_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Bad struct size: %u\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __smb2_smb_flush_block_invoke_cold_2(id *a1, int a2)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "sr_ntstatus");
  v4 = 136315650;
  v5 = "smb2_smb_flush_block_invoke";
  v6 = 1024;
  v7 = a2;
  v8 = 1024;
  v9 = v3;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void piston_gss_parse_server_mechs_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: hintsname(%s)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_parse_server_mechs_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: [%d]decode_NegotiationToken <NegotiationToken win>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_parse_server_mechs_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: [%d]decode_NegotiationToken <NegotiationToken rfc2478>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sock is NULL. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Missing user name\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss output token len <%u> is larger than MAX_SECBLOBLEN <%u>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Unsupported Mech \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Context is NOT NTLM simple file sharing\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: NTLMSSP simple file sharing\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_inquire_sec_context_by_oid returned major %d; minor %d \n",
    v1,
    v2,
    v3,
    v4,
    2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: lucid key type = %d len = %d \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Got rfc1964\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: vers = %d, protocol = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Lucid version %d is unsupported\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_krb5_export_lucid_sec_context failed <0x%x> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_krb5_export_lucid_sec_context failed <%s> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No session key, GSS keys->count is zero \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_inquire_sec_context_by_oid failed <0x%x> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_inquire_sec_context_by_oid failed <%s> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: GSS_S_COMPLETE\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: GSS_S_CONTINUE_NEEDED\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_import_name failed <0x%x> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_import_name failed <%s> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_21(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: service_principal <%s> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: piston_gss_acquire_cred failed <0x%x> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_acquire_cred_ex_f failed <0x%x> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_acquire_cred_ex_f failed <%s> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: GSSCreateName error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: CFUUIDCreate returned NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: CFBridgingRelease returned NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: [NSMutableDictionary dictionary] returned NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: gss_aapl_initial_cred has NULL credential", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: GSSCredentialCopyUUID returned NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_aapl_initial_cred - uuid(%@)", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_35()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_aapl_initial_cred failed <0x%x> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_36()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: gss_aapl_initial_cred failed <%s> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_37()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: kGSSICKerberosCacheName: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Attempting piston_gss_aapl_initial_cred for GSS_KRB5_MECHANISM...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_gss_transact_cold_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: GSS_IAKERB_MECHANISM\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_negotiate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed to create socket \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_negotiate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Need either server name or netbios name \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_negotiate_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: openSocket failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_negotiate_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: First component is null or empty? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void piston_negotiate_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: cleanedServer is null or empty? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_negotiate_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_negotiate_block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_add_negotiate_contexts failed %d \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_negotiate_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: connectSocket failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_negotiate_block_invoke_7_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb2_smb_negotiate_parse failed <%d>\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_negotiate_block_invoke_7_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown dialect 0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_negotiate_block_invoke_7_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Reconnecting with different sv_caps <0x%x> != <0x%x>\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_negotiate_block_invoke_7_cold_4(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "sr_pd");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resp_wait_timeout");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v3, "%s: session_resp_wait_timeout changed to %d\n", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

void __piston_negotiate_block_invoke_7_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __piston_negotiate_block_invoke_7_cold_6(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_3(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void smb2_smb_parse_negotiate_contexts_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sessionp is null? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_negotiate_contexts_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: CipherCount is supposed to be 1 (%d) \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_negotiate_contexts_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Server provided an invalid signing algorithm (%u)", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void smb2_smb_parse_negotiate_contexts_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Server must set SigningCnt to 1 (%d) \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t CCAESCmacCreate()
{
  return MEMORY[0x24BDAC010]();
}

uint64_t CCAESCmacDestroy()
{
  return MEMORY[0x24BDAC018]();
}

uint64_t CCAESCmacFinal()
{
  return MEMORY[0x24BDAC020]();
}

uint64_t CCAESCmacUpdate()
{
  return MEMORY[0x24BDAC028]();
}

uint64_t CCCryptorAddParameter()
{
  return MEMORY[0x24BDAC0F0]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC118](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC130](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCCryptorGCMAddAAD()
{
  return MEMORY[0x24BDAC138]();
}

uint64_t CCCryptorGCMFinalize()
{
  return MEMORY[0x24BDAC150]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x24BDAC160]();
}

uint64_t CCCryptorGCMReset()
{
  return MEMORY[0x24BDAC168]();
}

uint64_t CCCryptorGCMSetIV()
{
  return MEMORY[0x24BDAC170]();
}

uint64_t CCCryptorGetParameter()
{
  return MEMORY[0x24BDAC180]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC198](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x24BDAC1A0]();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x24BDAC240](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x24BDAC248](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x24BDAC250](ctx, data, dataLength);
}

uint64_t CCKDFParametersCreateCtrHmac()
{
  return MEMORY[0x24BDAC260]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x24BDAC270]();
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC3B0](c, data, *(_QWORD *)&len);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x24BDBC6D0](theString, theForm);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

gss_name_t GSSCreateName(CFTypeRef name, gss_const_OID name_type, CFErrorRef *error)
{
  return (gss_name_t)MEMORY[0x24BDD1A18](name, name_type, error);
}

CFUUIDRef GSSCredentialCopyUUID(gss_cred_id_t credential)
{
  return (CFUUIDRef)MEMORY[0x24BDD1A28](credential);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __ApplePrivate_gss_acquire_cred_ex_f()
{
  return MEMORY[0x24BDD1A50]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x24BDAC8B0](a1, a2, *(_QWORD *)&a3, a4, a5);
}

uint64_t _asn1_copy_top()
{
  return MEMORY[0x24BEDBD58]();
}

uint64_t _asn1_decode_top()
{
  return MEMORY[0x24BEDBD60]();
}

uint64_t _asn1_encode()
{
  return MEMORY[0x24BEDBD68]();
}

uint64_t _asn1_free_top()
{
  return MEMORY[0x24BEDBD70]();
}

uint64_t _asn1_length()
{
  return MEMORY[0x24BEDBD78]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x24BDAD360]();
}

uint64_t cccmac_one_shot_generate()
{
  return MEMORY[0x24BDAD3C0]();
}

uint64_t der_print_heim_oid()
{
  return MEMORY[0x24BEDBE18]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x24BDADD70](data1, data2);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x24BDAE658](a1, a2);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

OM_uint32 gss_aapl_initial_cred(gss_name_t desired_name, gss_const_OID desired_mech, CFDictionaryRef attributes, gss_cred_id_t *output_cred_handle, CFErrorRef *error)
{
  return MEMORY[0x24BDD1AB8](desired_name, desired_mech, attributes, output_cred_handle, error);
}

OM_uint32 gss_decapsulate_token(gss_const_buffer_t input_token, gss_const_OID oid, gss_buffer_t output_token)
{
  return MEMORY[0x24BDD1AD8](input_token, oid, output_token);
}

OM_uint32 gss_delete_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t output_token)
{
  return MEMORY[0x24BDD1AE0](minor_status, context_handle, output_token);
}

OM_uint32 gss_destroy_cred(OM_uint32 *min_stat, gss_cred_id_t *cred_handle)
{
  return MEMORY[0x24BDD1AE8](min_stat, cred_handle);
}

OM_uint32 gss_display_status(OM_uint32 *minor_status, OM_uint32 status_value, int status_type, gss_OID mech_type, OM_uint32 *message_content, gss_buffer_t status_string)
{
  return MEMORY[0x24BDD1AF0](minor_status, *(_QWORD *)&status_value, *(_QWORD *)&status_type, mech_type, message_content, status_string);
}

OM_uint32 gss_import_name(OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  return MEMORY[0x24BDD1AF8](minor_status, input_name_buffer, input_name_type, output_name);
}

OM_uint32 gss_init_sec_context(OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  return MEMORY[0x24BDD1B00](minor_status, initiator_cred_handle, context_handle, target_name, input_mech_type, *(_QWORD *)&req_flags, *(_QWORD *)&time_req, input_chan_bindings);
}

OM_uint32 gss_inquire_sec_context_by_oid(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_OID desired_object, gss_buffer_set_t *data_set)
{
  return MEMORY[0x24BDD1B10](minor_status, context_handle, desired_object, data_set);
}

OM_uint32 gss_krb5_export_lucid_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, OM_uint32 version, void **rctx)
{
  return MEMORY[0x24BDD1B20](minor_status, context_handle, *(_QWORD *)&version, rctx);
}

OM_uint32 gss_krb5_free_lucid_sec_context(OM_uint32 *minor_status, void *c)
{
  return MEMORY[0x24BDD1B28](minor_status, c);
}

int gss_oid_equal(gss_const_OID a, gss_const_OID b)
{
  return MEMORY[0x24BDD1B30](a, b);
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  return MEMORY[0x24BDD1B38](minor_status, buffer);
}

OM_uint32 gss_release_buffer_set(OM_uint32 *minor_status, gss_buffer_set_t *buffer_set)
{
  return MEMORY[0x24BDD1B40](minor_status, buffer_set);
}

OM_uint32 gss_release_name(OM_uint32 *minor_status, gss_name_t *input_name)
{
  return MEMORY[0x24BDD1B50](minor_status, input_name);
}

OM_uint32 gss_release_oid_set(OM_uint32 *minor_status, gss_OID_set *set)
{
  return MEMORY[0x24BDD1B58](minor_status, set);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void krb5_free_context(krb5_context a1)
{
  MEMORY[0x24BE4C6D0](a1);
}

void krb5_free_error_message(krb5_context a1, const char *a2)
{
  MEMORY[0x24BE4C6F0](a1, a2);
}

krb5_error_code krb5_get_default_realm(krb5_context a1, char **a2)
{
  return MEMORY[0x24BE4C760](a1, a2);
}

const char *__cdecl krb5_get_error_message(krb5_context a1, krb5_error_code a2)
{
  return (const char *)MEMORY[0x24BE4C768](a1, *(_QWORD *)&a2);
}

krb5_error_code krb5_init_context(krb5_context *a1)
{
  return MEMORY[0x24BE4C810](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x24BDE0B28]();
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x24BDE0B30](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

void nw_connection_force_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0BA8](connection);
}

uint64_t nw_connection_read_buffer()
{
  return MEMORY[0x24BDE0C20]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

void nw_connection_set_better_path_available_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
  MEMORY[0x24BDE0C68](connection, handler);
}

uint64_t nw_connection_set_cancel_handler()
{
  return MEMORY[0x24BDE0C70]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x24BDE0C80]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x24BDE0CA0]();
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
  MEMORY[0x24BDE0CB8](connection, handler);
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x24BDE0CC0]();
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x24BDE0EC0](endpoint);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x24BDE0FB8](error);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x24BDE1558]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x24BDE1658]();
}

uint64_t nw_parameters_set_keepalive_enabled()
{
  return MEMORY[0x24BDE16C0]();
}

uint64_t nw_parameters_set_no_delay()
{
  return MEMORY[0x24BDE16E8]();
}

uint64_t nw_path_is_per_app_vpn()
{
  return MEMORY[0x24BDE19E0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x24BDB0260](__b1, __b2, __len);
}

