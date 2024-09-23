void encodeHeader(uint64_t a1, unint64_t a2, uint64_t (*a3)(uint64_t a1, char *a2, uint64_t a3), uint64_t (*a4)(uint64_t a1, char *a2, uint64_t a3), uint64_t *a5, int a6)
{
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  _OWORD v23[9];
  uint64_t v24;

  v24 = 0;
  memset(v23, 0, sizeof(v23));
  v22 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v11;
  v21 = v11;
  pb_ostream_from_buffer(a3, a4, (uint64_t (**)(uint64_t, char *, uint64_t))&v20);
  v17 = 0;
  if (a3)
    v18 = 1;
  else
    v18 = a6;
  if (a2 >= 4 && a1 && v18)
  {
    LODWORD(v23[0]) = *(unsigned __int16 *)(a1 + 1);
    BYTE4(v23[0]) = *(_BYTE *)(a1 + 3);
    if (a6)
    {
      if ((pb_get_encoded_size((uint64_t)a5, (uint64_t)&HIDRTBufferMessage_msg, (uint64_t)v23, v12, v13, v14, v15, v16) & 1) != 0)
        v17 = *a5;
      else
        v17 = 0;
    }
    else
    {
      pb_encode(&v20);
      v17 = *((_QWORD *)&v21 + 1);
      if (!v19)
        v17 = 0;
    }
  }
  *a5 = v17;
}

void encode(int *a1, unint64_t a2, uint64_t (*a3)(uint64_t a1, char *a2, uint64_t a3), uint64_t (*a4)(uint64_t a1, char *a2, uint64_t a3), uint64_t *a5, int a6, int a7)
{
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  __int128 *v22;
  int v23;
  int v24;
  _QWORD v25[2];
  __int128 v26;
  __int128 v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = 0;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v28 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26 = v13;
  v27 = v13;
  pb_ostream_from_buffer(a3, a4, (uint64_t (**)(uint64_t, char *, uint64_t))&v26);
  v19 = 0;
  v20 = 0xFFFFLL;
  if (!a7)
    v20 = a2;
  v25[0] = a1;
  v25[1] = v20;
  if (a3)
    v21 = 1;
  else
    v21 = a7;
  if (a1 && v21 && v20 >= 4)
  {
    if (!a6)
    {
      v23 = *a1;
      switch((*a1 >> 17) & 7)
      {
        case 0u:
          if ((v23 & 0x1FFFF) == 0x200)
          {
            *((_QWORD *)&v30 + 1) = encodeHostConnect;
            v22 = &v31;
          }
          else
          {
            *((_QWORD *)&v31 + 1) = encodeDeviceConnect;
            v22 = &v32;
          }
          goto LABEL_11;
        case 1u:
          *((_QWORD *)&v32 + 1) = encodeDeviceDisconnect;
          v22 = &v33;
          goto LABEL_11;
        case 2u:
          *((_QWORD *)&v33 + 1) = encodeInputReport;
          v22 = &v34;
          goto LABEL_11;
        case 3u:
          if ((v23 & 0x200000) != 0)
          {
            *((_QWORD *)&v35 + 1) = encodeSetReportResponse;
            v22 = &v36;
          }
          else
          {
            *((_QWORD *)&v34 + 1) = encodeSetReportRequest;
            v22 = &v35;
          }
          goto LABEL_11;
        case 4u:
          if ((v23 & 0x200000) != 0)
          {
            *((_QWORD *)&v37 + 1) = encodeGetReportResponse;
            v22 = (__int128 *)&v38;
          }
          else
          {
            *((_QWORD *)&v36 + 1) = encodeGetReportRequest;
            v22 = &v37;
          }
          goto LABEL_11;
        default:
          goto LABEL_20;
      }
    }
    *((_QWORD *)&v29 + 1) = encodeSizeOptimizedInputReport;
    v22 = &v30;
LABEL_11:
    *(_QWORD *)v22 = v25;
    if (a7)
    {
      if ((pb_get_encoded_size((uint64_t)a5, (uint64_t)&HIDRTBufferMessage_msg, (uint64_t)&v29, v14, v15, v16, v17, v18) & 1) != 0)
        v19 = *a5;
      else
LABEL_20:
        v19 = 0;
    }
    else
    {
      pb_encode(&v26);
      v19 = *((_QWORD *)&v27 + 1);
      if (!v24)
        v19 = 0;
    }
  }
  *a5 = v19;
}

void encodeSizeOptimizedInputReport(_QWORD *a1, uint64_t a2, unsigned int ***a3)
{
  unsigned int **v3;
  unsigned int *v4;
  unint64_t v5;
  char v7;
  char v8;
  int v9;
  int v10;

  v3 = *a3;
  v4 = **a3;
  v5 = ((unint64_t)*v4 >> 7) & 0x3FF;
  if ((unint64_t)(*a3)[1] >= v5)
  {
    v3[1] = (unsigned int *)(v5 - 5);
    v7 = *((_BYTE *)v4 + 3);
    v8 = *((_BYTE *)v4 + 4);
    *(_WORD *)((char *)v4 + 3) = 0;
    *((_BYTE *)v4 + 3) = HIBYTE(*v4) & 0x80 | *v4 & 0x7F;
    pb_encode_tag_for_field(a1, a2);
    if (v9)
    {
      pb_encode_string(a1, (uint64_t)v4 + 3, (unint64_t)v3[1] + 2);
      if (v10)
      {
        *((_BYTE *)v4 + 3) = v7;
        *((_BYTE *)v4 + 4) = v8;
      }
    }
  }
}

void encodeHostConnect(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;

  v9 = 0;
  pb_encode_tag_for_field(a1, a2);
  if (v8)
    pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferHostConnect_msg, (uint64_t)&v9, v3, v4, v5, v6, v7);
}

void encodeDeviceConnect(_QWORD *a1, uint64_t a2, _QWORD **a3)
{
  _QWORD *v3;
  _DWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _QWORD v12[3];

  v12[0] = 0;
  v3 = *a3;
  v4 = (_DWORD *)**a3;
  if ((*a3)[1] >= (((unint64_t)*v4 >> 7) & 0x3FF))
  {
    LODWORD(v12[0]) = *v4 & 0x7F;
    v12[1] = encodeData;
    v12[2] = v3;
    *v3 = v4 + 1;
    v3[1] = (((unint64_t)*v4 >> 7) & 0x3FF) - 4;
    pb_encode_tag_for_field(a1, a2);
    if (v11)
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceConnect_msg, (uint64_t)v12, v6, v7, v8, v9, v10);
  }
}

void encodeDeviceDisconnect(_QWORD *a1, uint64_t a2, unsigned int ***a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;

  if ((unint64_t)(*a3)[1] >= (((unint64_t)***a3 >> 7) & 0x3FF))
  {
    v10 = ***a3 & 0x7F;
    pb_encode_tag_for_field(a1, a2);
    if (v9)
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceDisconnect_msg, (uint64_t)&v10, v4, v5, v6, v7, v8);
  }
}

void encodeInputReport(_QWORD *a1, uint64_t a2, unsigned int ***a3)
{
  unsigned int **v3;
  unsigned int *v4;
  unint64_t v5;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _QWORD v19[4];

  v19[0] = 0;
  v3 = *a3;
  v4 = **a3;
  v5 = *v4;
  if ((unint64_t)(*a3)[1] >= ((v5 >> 7) & 0x3FF))
  {
    LODWORD(v19[0]) = *v4 & 0x7F;
    if ((v5 & 0x100000) != 0)
      v7 = *(_QWORD *)((char *)v4 + 5);
    else
      v7 = 0;
    v19[1] = v7;
    v19[2] = encodeData;
    v19[3] = v3;
    if ((v5 & 0x100000) != 0)
      v8 = (char *)v4 + 13;
    else
      v8 = (char *)v4 + 5;
    *v3 = (unsigned int *)v8;
    v9 = *v4;
    v10 = (v9 >> 7) & 0x3FF;
    v11 = (v9 & 0x100000) == 0;
    v12 = -13;
    if (v11)
      v12 = -5;
    v3[1] = (unsigned int *)(v12 + v10);
    pb_encode_tag_for_field(a1, a2);
    if (v18)
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceInputReport_msg, (uint64_t)v19, v13, v14, v15, v16, v17);
  }
}

void encodeSetReportResponse(_QWORD *a1, uint64_t a2, unsigned int ***a3)
{
  unsigned int *v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v12 = 0;
  v3 = **a3;
  v4 = *v3;
  if ((unint64_t)(*a3)[1] >= ((v4 >> 7) & 0x3FF))
  {
    LODWORD(v12) = *v3 & 0x7F;
    if ((v4 & 0x400000) != 0)
    {
      if ((v4 & 0x1FF80) < 0x401)
        return;
      HIDWORD(v12) = *(unsigned int *)((char *)v3 + 5);
    }
    pb_encode_tag_for_field(a1, a2);
    if (v11)
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceSetReportResponse_msg, (uint64_t)&v12, v6, v7, v8, v9, v10);
  }
}

void encodeSetReportRequest(_QWORD *a1, uint64_t a2, unsigned int ***a3)
{
  unsigned int **v3;
  unsigned int *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _DWORD v13[2];
  void (*v14)(_QWORD *, uint64_t, uint64_t *);
  unsigned int **v15;

  v3 = *a3;
  v4 = **a3;
  if ((unint64_t)(*a3)[1] >= (((unint64_t)*v4 >> 7) & 0x3FF))
  {
    v6 = *((unsigned __int8 *)v4 + 4);
    v13[0] = *v4 & 0x7F;
    v13[1] = v6;
    v14 = encodeData;
    v15 = v3;
    *v3 = (unsigned int *)((char *)v4 + 5);
    v3[1] = (unsigned int *)((((unint64_t)*v4 >> 7) & 0x3FF) - 5);
    pb_encode_tag_for_field(a1, a2);
    if (v12)
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceSetReportRequest_msg, (uint64_t)v13, v7, v8, v9, v10, v11);
  }
}

void encodeGetReportResponse(_QWORD *a1, uint64_t a2, unsigned int ***a3)
{
  unsigned int **v3;
  unsigned int *v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void (*v14)(_QWORD *, uint64_t, uint64_t *);
  unsigned int **v15;

  v13 = 0;
  v14 = 0;
  v15 = 0;
  v3 = *a3;
  v4 = **a3;
  v5 = *v4;
  if ((unint64_t)(*a3)[1] >= ((v5 >> 7) & 0x3FF))
  {
    LODWORD(v13) = *v4 & 0x7F;
    if ((v5 & 0x400000) != 0)
    {
      if ((v5 & 0x1FF80) >= 0x401)
        HIDWORD(v13) = *(unsigned int *)((char *)v4 + 5);
    }
    else
    {
      v14 = encodeData;
      v15 = v3;
      *v3 = (unsigned int *)((char *)v4 + 5);
      v3[1] = (unsigned int *)((((unint64_t)*v4 >> 7) & 0x3FF) - 5);
    }
    pb_encode_tag_for_field(a1, a2);
    if (v12)
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceGetReportResponse_msg, (uint64_t)&v13, v7, v8, v9, v10, v11);
  }
}

void encodeGetReportRequest(_QWORD *a1, uint64_t a2, unsigned int ***a3)
{
  unsigned int *v3;
  unint64_t v4;
  BOOL v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _DWORD v14[3];

  v3 = **a3;
  v4 = ((unint64_t)*v3 >> 7) & 0x3FF;
  if ((_DWORD)v4)
    v5 = (unint64_t)(*a3)[1] >= v4;
  else
    v5 = 0;
  if (v5)
  {
    v7 = *((unsigned __int8 *)v3 + 4);
    v14[0] = *v3 & 0x7F;
    v14[1] = v7;
    v14[2] = *((unsigned __int8 *)v3 + 5);
    pb_encode_tag_for_field(a1, a2);
    if (v13)
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceGetReportRequest_msg, (uint64_t)v14, v8, v9, v10, v11, v12);
  }
}

void decodeHeader(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  __int128 v7;
  int v8;
  _OWORD v9[2];
  _OWORD v10[9];
  uint64_t v11;

  v11 = 0;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[1] = v7;
  memset(v10, 0, sizeof(v10));
  v9[0] = v7;
  pb_istream_from_buffer(a1, a2, v9);
  if (a1 && a3 && a4 >= 5)
  {
    pb_decode((uint64_t)v9, (uint64_t)&HIDRTBufferMessage_msg, (uint64_t)v10);
    if (v8)
    {
      *(_BYTE *)a3 = 1;
      *(_WORD *)(a3 + 1) = v10[0];
      *(_BYTE *)(a3 + 3) = BYTE4(v10[0]);
    }
  }
}

void decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, int a6)
{
  __int128 v11;
  uint64_t v12;
  int v13;
  int v14;
  _QWORD v15[3];
  __int128 v16;
  _OWORD v17[2];
  _QWORD v18[19];

  v18[0] = 0;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17[0] = v11;
  v17[1] = v11;
  pb_istream_from_buffer(a1, a2, v17);
  v12 = 0;
  v15[0] = 0;
  v15[1] = a3;
  v15[2] = a4;
  v16 = xmmword_219618000;
  BYTE8(v16) = a6;
  if (a3)
    v13 = 1;
  else
    v13 = a6;
  if (a1)
  {
    if (v13)
    {
      v18[1] = decodeSizeOptimizedReport;
      v18[2] = v15;
      v18[3] = decodeHostConnect;
      v18[4] = v15;
      v18[5] = decodeDeviceConnect;
      v18[6] = v15;
      v18[7] = decodeDeviceDisconnect;
      v18[8] = v15;
      v18[9] = decodeInputReport;
      v18[10] = v15;
      v18[11] = decodeSetReportRequest;
      v18[12] = v15;
      v18[13] = decodeSetReportResponse;
      v18[14] = v15;
      v18[15] = decodeGetReportRequest;
      v18[16] = v15;
      v18[17] = decodeGetReportResponse;
      v18[18] = v15;
      pb_decode((uint64_t)v17, (uint64_t)&HIDRTBufferMessage_msg, (uint64_t)v18);
      v12 = v16;
      if (!v14)
        v12 = 0;
    }
  }
  *a5 = v12;
}

void decodeSizeOptimizedReport(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  unsigned int v8;

  v3 = *a3;
  v4 = *(_QWORD *)(*a3 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)v3 = v5 + 3;
  *(_QWORD *)(v3 + 24) += v5 + 3;
  if (!*(_BYTE *)(v3 + 32) && *(_QWORD *)(v3 + 16) >= v5 + 3)
  {
    pb_read(a1, v4 + 3, v5);
    if (v6)
    {
      v7 = *(_QWORD *)(v3 + 16) - *(_QWORD *)v3;
      *(_QWORD *)(v3 + 8) += *(_QWORD *)v3;
      *(_QWORD *)(v3 + 16) = v7;
      v8 = *(_DWORD *)v4 & 0xFFFFFF80 | *(_BYTE *)(v4 + 3) & 0x7F;
      *(_DWORD *)v4 = v8;
      *(_DWORD *)v4 = v8 & 0xFF80007F | ((*(_DWORD *)v3 & 0x3FF) << 7) | 0x40000;
      *(_BYTE *)(v4 + 4) = 0;
    }
  }
}

void decodeHostConnect(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  int v6;
  char v7;

  v7 = 0;
  v3 = *a3;
  v4 = *(unsigned int **)(*a3 + 8);
  v5 = *(_QWORD *)(*a3 + 16) - 4;
  *(_QWORD *)(v3 + 8) = v4 + 1;
  *(_QWORD *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferHostConnect_msg, (uint64_t)&v7);
  if (v6)
  {
    *(_QWORD *)(v3 + 24) += 4;
    if (!*(_BYTE *)(v3 + 32))
      *v4 = *v4 & 0xFF800000 | 0x200;
  }
}

void decodeDeviceConnect(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  _QWORD v8[3];

  v3 = *a3;
  v4 = *(unsigned int **)(*a3 + 8);
  v8[0] = 0;
  v8[1] = decodeData;
  v8[2] = v3;
  v5 = *(_QWORD *)(v3 + 16) - 4;
  *(_QWORD *)(v3 + 8) = v4 + 1;
  *(_QWORD *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceConnect_msg, (uint64_t)v8);
  if (v6)
  {
    *(_QWORD *)(v3 + 24) += 4;
    if (!*(_BYTE *)(v3 + 32))
    {
      v7 = *v4 & 0xFFFFFF80 | v8[0] & 0x7F;
      *v4 = v7;
      *v4 = ((*(_DWORD *)v3 << 7) + 512) & 0x1FF80 | v7 & 0xFF80007F;
    }
  }
}

void decodeDeviceDisconnect(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  int v6;
  int v7;

  v7 = 0;
  v3 = *a3;
  v4 = *(unsigned int **)(*a3 + 8);
  v5 = *(_QWORD *)(*a3 + 16) - 4;
  *(_QWORD *)(v3 + 8) = v4 + 1;
  *(_QWORD *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceDisconnect_msg, (uint64_t)&v7);
  if (v6)
  {
    *(_QWORD *)(v3 + 24) += 4;
    if (!*(_BYTE *)(v3 + 32))
      *v4 = *v4 & 0xFF800000 | v7 & 0x7F | 0x20200;
  }
}

void decodeInputReport(_OWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  v4 = *a3;
  v5 = *(_QWORD *)(*a3 + 8);
  v6 = a1[1];
  v13[0] = *a1;
  v13[1] = v6;
  pb_decode((uint64_t)v13, (uint64_t)&HIDRTBufferDeviceInputReport_msg, (uint64_t)&v14);
  if (v7)
  {
    *(_QWORD *)&v15 = decodeData;
    *((_QWORD *)&v15 + 1) = v4;
    if (*((_QWORD *)&v14 + 1))
      v8 = 13;
    else
      v8 = 5;
    v9 = *(_QWORD *)(v4 + 16) - v8;
    *(_QWORD *)(v4 + 8) += v8;
    *(_QWORD *)(v4 + 16) = v9;
    pb_decode((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceInputReport_msg, (uint64_t)&v14);
    if (v10)
    {
      *(_QWORD *)(v4 + 24) += v8;
      if (!*(_BYTE *)(v4 + 32))
      {
        v11 = *(_DWORD *)v5 & 0xFFFFFF80 | v14 & 0x7F;
        *(_DWORD *)v5 = v11;
        v12 = *((_QWORD *)&v14 + 1);
        *(_DWORD *)v5 = v11 & 0xFF80007F | ((((unsigned __int16)*(_DWORD *)v4 + (_WORD)v8) & 0x3FF) << 7) | ((*((_QWORD *)&v14 + 1) != 0) << 20) | 0x40000;
        *(_BYTE *)(v5 + 4) = 0;
        if (v12)
          *(_QWORD *)(v5 + 5) = v12;
      }
    }
  }
}

void decodeSetReportRequest(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  _QWORD v8[3];

  v3 = *a3;
  v4 = *(_QWORD *)(*a3 + 8);
  v8[0] = 0;
  v8[1] = decodeData;
  v8[2] = v3;
  v5 = *(_QWORD *)(v3 + 16) - 5;
  *(_QWORD *)(v3 + 8) = v4 + 5;
  *(_QWORD *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceSetReportRequest_msg, (uint64_t)v8);
  if (v6)
  {
    *(_QWORD *)(v3 + 24) += 5;
    if (!*(_BYTE *)(v3 + 32))
    {
      v7 = *(_DWORD *)v4 & 0xFFFFFF80 | v8[0] & 0x7F;
      *(_DWORD *)v4 = v7;
      *(_DWORD *)v4 = v7 & 0xFF80007F | ((*(_DWORD *)v3 << 7) + 640) & 0x1FF80 | 0x60000;
      *(_BYTE *)(v4 + 4) = BYTE4(v8[0]);
    }
  }
}

uint64_t decodeSetReportResponse(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v14;

  v14 = 0;
  v3 = *a3;
  v4 = *(_QWORD *)(*a3 + 8);
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceSetReportResponse_msg, (uint64_t)&v14);
  v6 = v5;
  if ((_DWORD)v5)
  {
    v7 = HIDWORD(v14);
    v8 = 4 * (HIDWORD(v14) != 0);
    v9 = *(_QWORD *)(v3 + 16);
    v10 = *(_QWORD *)(v3 + 8) + v8 + 5;
    *(_QWORD *)v3 = v8;
    *(_QWORD *)(v3 + 8) = v10;
    v11 = *(_QWORD *)(v3 + 24) + v8 + 5;
    *(_QWORD *)(v3 + 16) = v9 - (v8 + 5);
    *(_QWORD *)(v3 + 24) = v11;
    if (!*(_BYTE *)(v3 + 32))
    {
      v12 = *(_DWORD *)v4 & 0xFFFFFF80 | v14 & 0x7F;
      *(_DWORD *)v4 = v12;
      *(_DWORD *)v4 = v12 & 0xFF80007F | ((*(_DWORD *)v3 << 7) + 640) & 0x1FF80 | ((v7 != 0) << 22) | 0x260000;
      *(_BYTE *)(v4 + 4) = 2;
      memcpy((void *)(v4 + 5), (char *)&v14 + 4, *(_QWORD *)v3);
    }
  }
  return v6;
}

void decodeGetReportRequest(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;
  uint64_t v8;
  int v9;

  v9 = 0;
  v8 = 0;
  v3 = *a3;
  v4 = *(_QWORD *)(*a3 + 8);
  v5 = *(_QWORD *)(*a3 + 16) - 6;
  *(_QWORD *)(v3 + 8) = v4 + 6;
  *(_QWORD *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceGetReportRequest_msg, (uint64_t)&v8);
  if (v6)
  {
    *(_QWORD *)(v3 + 24) += 6;
    if (!*(_BYTE *)(v3 + 32))
    {
      *(_DWORD *)v4 = *(_DWORD *)v4 & 0xFF800000 | v8 & 0x7F | 0x80300;
      v7 = v9;
      *(_BYTE *)(v4 + 4) = BYTE4(v8);
      *(_BYTE *)(v4 + 5) = v7;
    }
  }
}

void decodeGetReportResponse(_OWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  _OWORD v16[2];
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t *);
  uint64_t v19;

  v18 = 0;
  v19 = 0;
  v17 = 0;
  v4 = *a3;
  v5 = *(_QWORD *)(*a3 + 8);
  v6 = a1[1];
  v16[0] = *a1;
  v16[1] = v6;
  pb_decode((uint64_t)v16, (uint64_t)&HIDRTBufferDeviceGetReportResponse_msg, (uint64_t)&v17);
  if (v7)
  {
    v8 = HIDWORD(v17);
    v9 = 4 * (HIDWORD(v17) != 0);
    v10 = v9 + 5;
    v11 = *(_QWORD *)(v4 + 16);
    v12 = *(_QWORD *)(v4 + 8) + v9 + 5;
    *(_QWORD *)v4 = v9;
    *(_QWORD *)(v4 + 8) = v12;
    *(_QWORD *)(v4 + 16) = v11 - (v9 + 5);
    if (!v8)
    {
      v18 = decodeData;
      v19 = v4;
      pb_decode((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceGetReportResponse_msg, (uint64_t)&v17);
      if (!v13)
        return;
      v10 = 5;
    }
    *(_QWORD *)(v4 + 24) += v10;
    if (!*(_BYTE *)(v4 + 32))
    {
      v14 = HIDWORD(v17);
      if (HIDWORD(v17))
      {
        memcpy((void *)(v5 + 5), (char *)&v17 + 4, *(_QWORD *)v4);
        v14 = 0x400000;
      }
      v15 = *(_DWORD *)v5 & 0xFFFFFF80 | v17 & 0x7F;
      *(_DWORD *)v5 = v15;
      *(_DWORD *)v5 = v15 & 0xFF80007F | ((*(_DWORD *)v4 << 7) + 640) & 0x1FF80 | v14 | 0x280000;
      *(_BYTE *)(v5 + 4) = 2;
    }
  }
}

void encodeData(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  int v5;

  v4 = *a3;
  pb_encode_tag_for_field(a1, a2);
  if (v5)
    pb_encode_string(a1, *(_QWORD *)v4, *(_QWORD *)(v4 + 8));
}

void decodeData(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;

  v3 = *a3;
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)v3 = v4;
  *(_QWORD *)(v3 + 24) += v4;
  if (!*(_BYTE *)(v3 + 32) && *(_QWORD *)(v3 + 16) >= v4)
  {
    pb_read(a1, *(_QWORD *)(v3 + 8), v4);
    if (v5)
    {
      v6 = *(_QWORD *)(v3 + 16) - *(_QWORD *)v3;
      *(_QWORD *)(v3 + 8) += *(_QWORD *)v3;
      *(_QWORD *)(v3 + 16) = v6;
    }
  }
}

uint64_t HIDAccesorySessionEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSObject *v8;

  if ((_DWORD)a3)
  {
    RemoteHIDLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      HIDAccesorySessionEventCallback_cold_1();

  }
  return objc_msgSend(a4, "btSessionEventHandler:event:result:", a1, a2, a3);
}

void HIDAccessoryEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;

  v9 = a5;
  v8 = (void *)MEMORY[0x219A30234]();
  objc_msgSend(v9, "btAccessoryEventHandler:event:state:", a3, a2, a4);
  objc_autoreleasePoolPop(v8);

}

void HIDAccesoryServiceEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  RemoteHIDLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 67109888;
      v16 = a3;
      v17 = 1024;
      v18 = a4;
      v19 = 1024;
      v20 = a5;
      v21 = 2048;
      v22 = a6;
      _os_log_error_impl(&dword_21960D000, v13, OS_LOG_TYPE_ERROR, "HIDAccesoryServiceEventCallback eventType:%d event:%d result:%d data:%p", (uint8_t *)&v15, 0x1Eu);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 67109888;
      v16 = a3;
      v17 = 1024;
      v18 = a4;
      v19 = 1024;
      v20 = 0;
      v21 = 2048;
      v22 = a6;
      _os_log_impl(&dword_21960D000, v13, OS_LOG_TYPE_INFO, "HIDAccesoryServiceEventCallback eventType:%d event:%d result:%d data:%p", (uint8_t *)&v15, 0x1Eu);
    }

    v13 = a6;
    v14 = (void *)MEMORY[0x219A30234]();
    -[NSObject btServiceEventHandler:services:eventType:event:result:](v13, "btServiceEventHandler:services:eventType:event:result:", a1, a2, a3, a4, 0);
    objc_autoreleasePoolPop(v14);
  }

}

void HIDAccesoryCustomMessageCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v10;
  id v11;

  v11 = a6;
  v10 = (void *)MEMORY[0x219A30234]();
  objc_msgSend(v11, "btDeviceMessageHandler:type:data:size:", a2, a3, a4, a5);
  objc_autoreleasePoolPop(v10);

}

void sub_2196116E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_219612A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219612BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_219612F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id RemoteHIDLog()
{
  if (RemoteHIDLog_onceToken != -1)
    dispatch_once(&RemoteHIDLog_onceToken, &__block_literal_global);
  return (id)RemoteHIDLog_log;
}

id RemoteHIDLogPackets()
{
  if (RemoteHIDLogPackets_onceToken != -1)
    dispatch_once(&RemoteHIDLogPackets_onceToken, &__block_literal_global_3);
  return (id)RemoteHIDLogPackets_log;
}

BOOL pb_field_iter_begin(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  memset(a1, 0, 0x40uLL);
  *a1 = a2;
  a1[1] = a3;
  return load_descriptor_values((uint64_t)a1);
}

BOOL load_descriptor_values(uint64_t a1)
{
  unsigned int v1;
  uint64_t *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  _DWORD *v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;
  int v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v1 = *(unsigned __int16 *)(a1 + 16);
  v2 = *(uint64_t **)a1;
  v3 = *(unsigned __int16 *)(*(_QWORD *)a1 + 32);
  if (v1 < v3)
  {
    v4 = *v2;
    v5 = *(unsigned __int16 *)(a1 + 18);
    v6 = *(_DWORD *)(*v2 + 4 * v5);
    *(_BYTE *)(a1 + 30) = BYTE1(v6);
    if ((v6 & 3) == 2)
    {
      LODWORD(v7) = *(_DWORD *)(v4 + 4 * (v5 + 1));
      v8 = *(_DWORD *)(v4 + 4 * (v5 + 2));
      v9 = *(_DWORD *)(v4 + 4 * (v5 + 3));
      *(_WORD *)(a1 + 28) = HIWORD(v6);
      *(_WORD *)(a1 + 24) = (v7 >> 2) & 0xFFC0 | (v6 >> 2);
    }
    else if ((v6 & 3) == 1)
    {
      v10 = *(_DWORD *)(v4 + 4 * v5 + 4);
      *(_WORD *)(a1 + 28) = HIWORD(v6) & 0xFFF;
      *(_WORD *)(a1 + 24) = (v10 >> 22) & 0x3C0 | (v6 >> 2);
      LODWORD(v7) = v6 >> 28;
      v8 = (unsigned __int16)v10;
      v9 = HIWORD(v10) & 0xFFF;
    }
    else if ((v6 & 3) != 0)
    {
      v7 = (_DWORD *)(v4 + 4 * v5);
      v11 = v7[1];
      v8 = v7[2];
      v9 = v7[3];
      *(_WORD *)(a1 + 28) = v7[4];
      *(_WORD *)(a1 + 24) = (v11 >> 2) & 0xFFC0 | (v6 >> 2);
      LOBYTE(v7) = v11;
    }
    else
    {
      *(_WORD *)(a1 + 28) = 1;
      *(_WORD *)(a1 + 24) = v6 >> 2;
      LODWORD(v7) = HIBYTE(v6) & 0xF;
      v8 = BYTE2(v6);
      v9 = v6 >> 28;
    }
    v12 = BYTE1(v6);
    *(_WORD *)(a1 + 26) = v9;
    v13 = *(_QWORD *)(a1 + 8);
    if (v13)
    {
      v14 = (_QWORD *)(v13 + v8);
      v15 = v6 & 0x3000;
      v16 = (char *)(a1 + 28);
      if ((v12 & 0x40 | 0x80) != 0x80)
        v16 = 0;
      *(_QWORD *)(a1 + 32) = v14;
      if (v15 == 0x2000)
        v17 = v16;
      else
        v17 = 0;
      if ((_BYTE)v7)
        v17 = (char *)v14 - (char)v7;
      *(_QWORD *)(a1 + 48) = v17;
      if ((v12 & 0xC0) == 0x80)
        *(_QWORD *)(a1 + 40) = *v14;
      else
        *(_QWORD *)(a1 + 40) = v14;
    }
    else
    {
      *(_QWORD *)(a1 + 32) = 0;
      *(_QWORD *)(a1 + 48) = 0;
    }
    if ((v12 & 0xE) == 8)
      v18 = *(_QWORD *)(v2[1] + 8 * *(unsigned __int16 *)(a1 + 22));
    else
      v18 = 0;
    *(_QWORD *)(a1 + 56) = v18;
  }
  return v1 < v3;
}

void pb_field_iter_begin_extension(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  _DWORD **v5;

  v4 = a2 + 1;
  v5 = *(_DWORD ***)(*a2 + 16);
  if ((**v5 & 0xC000) != 0x8000)
    v4 = (_QWORD *)*v4;
  pb_field_iter_begin(a1, (uint64_t)v5, (uint64_t)v4);
  a1[6] = a2 + 3;
  OUTLINED_FUNCTION_1_0();
}

void pb_field_iter_next(_WORD *a1)
{
  advance_iterator(a1);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
}

double advance_iterator(_WORD *a1)
{
  unsigned __int16 v1;
  uint64_t v2;
  int v3;
  __int16 v4;
  __int16 v5;
  double result;

  v1 = a1[8] + 1;
  a1[8] = v1;
  if (*(unsigned __int16 *)(*(_QWORD *)a1 + 32) <= v1)
  {
    result = 0.0;
    *((_QWORD *)a1 + 2) = 0;
  }
  else
  {
    v2 = (unsigned __int16)a1[9];
    v3 = *(_DWORD *)(**(_QWORD **)a1 + 4 * v2);
    a1[9] = v2 + (1 << (v3 & 3));
    v4 = a1[10];
    if ((v3 & 0x3000) == 0)
      ++v4;
    a1[10] = v4;
    if ((v3 & 0xE00) == 0x800)
      v5 = a1[11] + 1;
    else
      v5 = a1[11];
    a1[11] = v5;
  }
  return result;
}

uint64_t pb_field_iter_find(unsigned __int16 *a1, unsigned int a2)
{
  unsigned int v2;
  int v6;
  unsigned int v7;

  v2 = a1[12];
  if (v2 == a2)
    return 1;
  if (*(unsigned __int16 *)(*(_QWORD *)a1 + 36) >= a2)
  {
    v6 = a1[8];
    if (v2 > a2)
      a1[8] = *(_WORD *)(*(_QWORD *)a1 + 32);
    while (1)
    {
      advance_iterator(a1);
      OUTLINED_FUNCTION_2_0();
      if (((a2 ^ (v7 >> 2)) & 0x3F) == 0)
      {
        OUTLINED_FUNCTION_0_0();
        if (a1[12] == a2 && (a1[15] & 0xF) != 0xA)
          break;
      }
      if (a1[8] == v6)
      {
        OUTLINED_FUNCTION_0_0();
        return 0;
      }
    }
    return 1;
  }
  return 0;
}

void pb_field_iter_find_extension(uint64_t a1)
{
  int v2;
  __int16 v3;

  if ((*(_BYTE *)(a1 + 30) & 0xF) == 0xA)
  {
LABEL_6:
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
    v2 = *(unsigned __int16 *)(a1 + 16);
    while (1)
    {
      advance_iterator((_WORD *)a1);
      OUTLINED_FUNCTION_2_0();
      if ((v3 & 0xF00) == 0xA00)
        break;
      if (*(unsigned __int16 *)(a1 + 16) == v2)
      {
        OUTLINED_FUNCTION_0_0();
        goto LABEL_6;
      }
    }
    load_descriptor_values(a1);
  }
}

uint64_t pb_default_field_callback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (**v3)(uint64_t, uint64_t, _QWORD);
  uint64_t (*v4)(uint64_t, uint64_t, _QWORD);
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);

  if (*(_WORD *)(a3 + 26) == 16)
  {
    v3 = *(uint64_t (***)(uint64_t, uint64_t, _QWORD))(a3 + 40);
    if (v3)
    {
      if (a1)
      {
        v4 = *v3;
        if (*v3)
        {
          v5 = v3 + 1;
          return v4(a1, a3, v5);
        }
      }
      if (a2)
      {
        v4 = *v3;
        if (*v3)
        {
          v5 = v3 + 1;
          a1 = a2;
          return v4(a1, a3, v5);
        }
      }
    }
  }
  return 1;
}

BOOL OUTLINED_FUNCTION_0_0()
{
  uint64_t v0;

  return load_descriptor_values(v0);
}

uint64_t (*pb_ostream_from_buffer@<X0>(uint64_t (*result)(uint64_t a1, char *a2, uint64_t a3)@<X0>, uint64_t (*a2)(uint64_t a1, char *a2, uint64_t a3)@<X1>, uint64_t (**a3)(uint64_t a1, char *a2, uint64_t a3)@<X8>))(uint64_t a1, char *a2, uint64_t a3)
{
  *a3 = buf_write;
  a3[1] = result;
  a3[3] = 0;
  a3[4] = 0;
  a3[2] = a2;
  return result;
}

uint64_t buf_write(uint64_t a1, char *a2, uint64_t a3)
{
  _BYTE *v3;
  char v4;

  v3 = *(_BYTE **)(a1 + 8);
  for (*(_QWORD *)(a1 + 8) = &v3[a3]; a3; --a3)
  {
    v4 = *a2++;
    *v3++ = v4;
  }
  return 1;
}

void pb_write(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;

  if (a3
    && *a1
    && ((v5 = a1[3], v6 = __CFADD__(v5, a3), v7 = v5 + a3, v6)
     || v7 > a1[2]
     || (((uint64_t (*)(_QWORD *, uint64_t, uint64_t))*a1)(a1, a2, a3) & 1) == 0))
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_4_1(v8);
  }
  else
  {
    a1[3] += a3;
  }
}

void pb_encode(_QWORD *a1)
{
  _QWORD *i;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  int v6;
  int v7;
  char v8;
  uint64_t v9;
  _WORD v10[15];
  char v11;
  _QWORD *v12;
  _BYTE v13[64];

  if (pb_field_iter_begin_const(v10))
  {
    do
    {
      if ((v11 & 0xF) == 0xA)
      {
        for (i = v12; ; i = v3 + 2)
        {
          v3 = (_QWORD *)*i;
          if (!*i)
            break;
          if (*(_QWORD *)(*v3 + 8))
          {
            v4 = OUTLINED_FUNCTION_2_1();
            if ((v5(v4) & 1) == 0)
              return;
          }
          else
          {
            if ((pb_field_iter_begin_extension_const(v13, v3) & 1) == 0)
            {
              OUTLINED_FUNCTION_1_1();
              OUTLINED_FUNCTION_4_1(v9);
              return;
            }
            encode_field(a1, (uint64_t)v13);
            if (!v6)
              return;
          }
        }
      }
      else
      {
        encode_field(a1, (uint64_t)v10);
        if (!v7)
          return;
      }
      pb_field_iter_next(v10);
    }
    while ((v8 & 1) != 0);
  }
}

void encode_field(_QWORD *a1, uint64_t a2)
{
  unsigned int v4;
  _BYTE *v5;
  _QWORD *v6;
  char v7;
  uint64_t (*v8)(_QWORD, _QWORD *, uint64_t);
  uint64_t v9;
  _WORD *v10;
  unsigned int v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned int i;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  int v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  char v27;
  int v28;
  unsigned int j;
  _QWORD *v30;
  uint64_t v31;
  int v32;
  char v33;
  int v34;
  _OWORD v35[2];
  uint64_t v36;

  v4 = *(unsigned __int8 *)(a2 + 30);
  if ((v4 & 0x30) == 0x10)
  {
    v5 = *(_BYTE **)(a2 + 48);
    if (v5)
    {
      if (!*v5)
        return;
    }
    else if (v4 <= 0x3F && pb_check_proto3_default_value(a2))
    {
      return;
    }
  }
  else if ((v4 & 0x30) == 0x30 && **(unsigned __int16 **)(a2 + 48) != *(unsigned __int16 *)(a2 + 24))
  {
    return;
  }
  v6 = *(_QWORD **)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 30);
  if (!v6)
  {
    if ((*(_BYTE *)(a2 + 30) & 0x30) != 0)
      return;
    goto LABEL_16;
  }
  if ((v7 & 0xC0) == 0x40)
  {
    v8 = *(uint64_t (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)a2 + 24);
    if (!v8 || (v8(0, a1, a2) & 1) != 0)
      return;
    goto LABEL_16;
  }
  if ((v7 & 0x30) != 0x20)
  {
    v12 = (_QWORD *)OUTLINED_FUNCTION_2_1();
    encode_basic_field(v12, v13);
    return;
  }
  v10 = *(_WORD **)(a2 + 48);
  v11 = (unsigned __int16)*v10;
  if (*v10)
  {
    if ((v7 & 0xC0) != 0x80 && v11 > *(unsigned __int16 *)(a2 + 28))
    {
LABEL_16:
      OUTLINED_FUNCTION_7_1();
LABEL_17:
      OUTLINED_FUNCTION_4_1(v9);
      return;
    }
    if ((v7 & 0xEu) >= 6)
    {
      for (i = 0; i < v11; ++i)
      {
        if ((*(_BYTE *)(a2 + 30) & 0xCE) == 0x86)
        {
          *(_QWORD *)(a2 + 40) = *v6;
          v17 = (_QWORD *)OUTLINED_FUNCTION_2_1();
          if (v19)
          {
            encode_basic_field(v17, v18);
          }
          else
          {
            pb_encode_tag_for_field(v17, v18);
            if ((v24 & 1) == 0)
            {
              *(_QWORD *)(a2 + 40) = v6;
              return;
            }
            pb_encode_varint(a1, 0);
          }
          *(_QWORD *)(a2 + 40) = v6;
          if ((v20 & 1) == 0)
            return;
        }
        else
        {
          v21 = (_QWORD *)OUTLINED_FUNCTION_2_1();
          encode_basic_field(v21, v22);
          if (!v23)
            return;
          v6 = *(_QWORD **)(a2 + 40);
        }
        v6 = (_QWORD *)((char *)v6 + *(unsigned __int16 *)(a2 + 26));
        *(_QWORD *)(a2 + 40) = v6;
      }
    }
    else
    {
      pb_encode_tag(a1, 2u, *(unsigned __int16 *)(a2 + 24));
      if (!v14)
        return;
      v15 = *(_BYTE *)(a2 + 30) & 0xF;
      if (v15 != 5 && v15 != 4)
      {
        v25 = 0;
        v36 = 0;
        memset(v35, 0, sizeof(v35));
        v26 = *(_QWORD *)(a2 + 40);
        while (1)
        {
          if (v25 >= v11)
          {
            *(_QWORD *)(a2 + 40) = v26;
            goto LABEL_48;
          }
          pb_enc_varint(v35, a2);
          if ((v27 & 1) == 0)
            break;
          OUTLINED_FUNCTION_6_0();
          ++v25;
        }
        OUTLINED_FUNCTION_7_1();
        goto LABEL_17;
      }
LABEL_48:
      OUTLINED_FUNCTION_8_0();
      if (v28)
      {
        if (*a1)
        {
          for (j = 0; j < v11; ++j)
          {
            v30 = (_QWORD *)OUTLINED_FUNCTION_2_1();
            if (v32 == 4)
            {
              pb_enc_fixed(v30, v31);
              if ((v33 & 1) == 0)
                return;
            }
            else
            {
              pb_enc_varint(v30, v31);
              if (!v34)
                return;
            }
            OUTLINED_FUNCTION_6_0();
          }
        }
        else
        {
          OUTLINED_FUNCTION_5_1();
        }
      }
    }
  }
}

void pb_encode_ex(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  char v10;

  if ((a4 & 2) != 0)
  {
    pb_encode_submessage((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  }
  else if ((a4 & 4) != 0)
  {
    v10 = 0;
    pb_encode(a1);
    if (v9)
      pb_write(a1, (uint64_t)&v10, 1);
  }
  else
  {
    pb_encode(a1);
  }
}

void pb_encode_submessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  if ((OUTLINED_FUNCTION_3_1(a1, a2, a3, a4, a5, a6, a7, a8, v16, v17, v18) & 1) == 0)
  {
    v11 = v18;
LABEL_7:
    v8[4] = v11;
    return;
  }
  v9 = *((_QWORD *)&v17 + 1);
  OUTLINED_FUNCTION_8_0();
  if (!v10)
    return;
  if (!*v8)
  {
    OUTLINED_FUNCTION_5_1();
    return;
  }
  if (v8[3] + *((_QWORD *)&v17 + 1) > v8[2])
  {
    OUTLINED_FUNCTION_1_1();
    v12 = "stream full";
    goto LABEL_12;
  }
  v13 = v8[1];
  *(_QWORD *)&v16 = *v8;
  *((_QWORD *)&v16 + 1) = v13;
  v18 = 0;
  v17 = *((unint64_t *)&v17 + 1);
  pb_encode(&v16);
  v14 = *((_QWORD *)&v17 + 1);
  v15 = v8[3] + *((_QWORD *)&v17 + 1);
  v8[1] = *((_QWORD *)&v16 + 1);
  v11 = v18;
  v8[3] = v15;
  v8[4] = v11;
  if (v14 != v9)
  {
    v12 = "submsg size changed";
LABEL_12:
    if (!v11)
      v11 = (uint64_t)v12;
    goto LABEL_7;
  }
}

uint64_t pb_get_encoded_size(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  result = OUTLINED_FUNCTION_3_1(a1, a2, a3, a4, a5, a6, a7, a8, v10, v11, v13);
  if ((_DWORD)result)
    *v8 = v12;
  return result;
}

void pb_encode_varint(_QWORD *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  unint64_t v4;
  char v5;
  unsigned int v6;
  _BYTE v7[10];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a2 > 0x7F)
  {
    i = 0;
    v4 = HIDWORD(a2);
    while (i != 4)
    {
      if (!(_DWORD)v4 && a2 < 0x80)
      {
        v5 = a2 & 0x7F;
        goto LABEL_14;
      }
      v7[i++] = a2 | 0x80;
      LODWORD(a2) = a2 >> 7;
    }
    v5 = a2 & 0x7F;
    if ((_DWORD)v4)
    {
      v5 |= 16 * (v4 & 7);
      v6 = v4 >> 3;
      for (i = 4; v6; v6 >>= 7)
      {
        v7[i++] = v5 | 0x80;
        v5 = v6 & 0x7F;
      }
    }
    else
    {
      i = 4;
    }
LABEL_14:
    v2 = i + 1;
    v7[i] = v5;
  }
  else
  {
    v7[0] = a2;
    v2 = 1;
  }
  pb_write(a1, (uint64_t)v7, v2);
}

void pb_encode_svarint(_QWORD *a1, uint64_t a2)
{
  pb_encode_varint(a1, (2 * a2) ^ (a2 >> 63));
}

void pb_encode_fixed32(_QWORD *a1, int *a2)
{
  int v2;

  v2 = *a2;
  pb_write(a1, (uint64_t)&v2, 4);
}

void pb_encode_fixed64(_QWORD *a1, _QWORD *a2)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v2[0] = *a2;
  pb_write(a1, (uint64_t)v2, 8);
}

void pb_encode_tag(_QWORD *a1, unsigned int a2, unsigned int a3)
{
  pb_encode_varint(a1, a2 | (8 * a3));
}

void pb_encode_tag_for_field(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_BYTE *)(a2 + 30) & 0xF;
  if (v2 < 0xC && ((0xBFFu >> v2) & 1) != 0)
    pb_encode_tag(a1, dword_2196180E0[v2], *(unsigned __int16 *)(a2 + 24));
  else
    OUTLINED_FUNCTION_0_1((uint64_t)a1, a1[4]);
}

void pb_encode_string(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  int v6;

  pb_encode_varint(a1, a3);
  if (v6)
    pb_write(a1, a2, a3);
}

BOOL pb_check_proto3_default_value(uint64_t a1)
{
  int v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);

  v1 = *(unsigned __int8 *)(a1 + 30);
  switch(v1 & 0xC0)
  {
    case 128:
      v2 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 40);
      return v2 == 0;
    case 64:
      if ((v1 & 0xF) == 0xA
        || (v2 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24),
            v2 == pb_default_field_callback))
      {
        v2 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(a1 + 40);
      }
      return v2 == 0;
    case 0:
      __asm { BR              X11 }
      break;
  }
  return 0;
}

void encode_basic_field(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(uint64_t);
  unsigned __int16 *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t i;
  _QWORD *v23;
  uint64_t v24;

  if (*(_QWORD *)(a2 + 40))
  {
    pb_encode_tag_for_field(a1, a2);
    if (v9)
    {
      v10 = *(unsigned __int8 *)(a2 + 30);
      switch(v10 & 0xF)
      {
        case 0u:
          pb_encode_varint(a1, **(_BYTE **)(a2 + 40) != 0);
          return;
        case 1u:
        case 2u:
        case 3u:
          v11 = (_QWORD *)OUTLINED_FUNCTION_2_1();
          pb_enc_varint(v11, v12);
          return;
        case 4u:
        case 5u:
          v13 = (_QWORD *)OUTLINED_FUNCTION_2_1();
          pb_enc_fixed(v13, v14);
          return;
        case 6u:
          v19 = *(unsigned __int16 **)(a2 + 40);
          if (!v19)
          {
            v23 = a1;
            v21 = 0;
            v20 = 0;
            goto LABEL_37;
          }
          v20 = *v19;
          if (v10 > 0x3F || (unint64_t)*(unsigned __int16 *)(a2 + 26) - 2 >= v20)
          {
            v21 = (uint64_t)(v19 + 1);
            goto LABEL_36;
          }
          goto LABEL_38;
        case 7u:
          v21 = *(_QWORD *)(a2 + 40);
          if ((v10 & 0xC0) == 0x80)
          {
            v20 = -1;
          }
          else
          {
            if (!*(_WORD *)(a2 + 26))
              goto LABEL_38;
            v20 = *(unsigned __int16 *)(a2 + 26) - 1;
          }
          if (v21)
          {
            for (i = 0; v20 != i; ++i)
            {
              if (!*(_BYTE *)(v21 + i))
              {
                v20 = i;
                goto LABEL_36;
              }
            }
            if (*(_BYTE *)(v21 + v20))
            {
LABEL_38:
              OUTLINED_FUNCTION_1_1();
              OUTLINED_FUNCTION_4_1(v24);
              return;
            }
          }
          else
          {
            v20 = 0;
          }
LABEL_36:
          v23 = a1;
LABEL_37:
          pb_encode_string(v23, v21, v20);
          break;
        case 8u:
        case 9u:
          v15 = *(_QWORD *)(a2 + 56);
          if (!v15)
            goto LABEL_38;
          if ((v10 & 0xF) != 9)
            goto LABEL_13;
          v16 = *(_QWORD *)(a2 + 48);
          if (!v16 || !*(_QWORD *)(v16 - 16))
            goto LABEL_13;
          v17 = OUTLINED_FUNCTION_2_1();
          if (v18(v17))
          {
            v15 = *(_QWORD *)(a2 + 56);
LABEL_13:
            pb_encode_submessage((uint64_t)a1, v15, *(_QWORD *)(a2 + 40), v4, v5, v6, v7, v8);
          }
          return;
        case 0xBu:
          v21 = *(_QWORD *)(a2 + 40);
          v20 = *(unsigned __int16 *)(a2 + 26);
          goto LABEL_36;
        default:
          goto LABEL_38;
      }
    }
  }
}

void pb_enc_varint(_QWORD *a1, uint64_t a2)
{
  int v2;
  unint64_t v3;

  v2 = *(_BYTE *)(a2 + 30) & 0xF;
  if (v2 == 2)
  {
    switch(*(_WORD *)(a2 + 26))
    {
      case 1:
        v3 = **(unsigned __int8 **)(a2 + 40);
        goto LABEL_4;
      case 2:
        v3 = **(unsigned __int16 **)(a2 + 40);
        goto LABEL_4;
      case 4:
        v3 = **(unsigned int **)(a2 + 40);
        goto LABEL_4;
      case 8:
        v3 = **(_QWORD **)(a2 + 40);
        goto LABEL_4;
      default:
        goto LABEL_7;
    }
  }
  switch(*(_WORD *)(a2 + 26))
  {
    case 1:
      v3 = **(char **)(a2 + 40);
      goto LABEL_14;
    case 2:
      v3 = **(__int16 **)(a2 + 40);
      goto LABEL_14;
    case 4:
      v3 = **(int **)(a2 + 40);
      goto LABEL_14;
    case 8:
      v3 = **(_QWORD **)(a2 + 40);
LABEL_14:
      if (v2 == 3)
        pb_encode_svarint(a1, v3);
      else
LABEL_4:
        pb_encode_varint(a1, v3);
      break;
    default:
LABEL_7:
      OUTLINED_FUNCTION_0_1((uint64_t)a1, a1[4]);
      break;
  }
}

void pb_enc_fixed(_QWORD *a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int16 *)(a2 + 26);
  if (v2 == 8)
  {
    pb_encode_fixed64(a1, *(_QWORD **)(a2 + 40));
  }
  else if (v2 == 4)
  {
    pb_encode_fixed32(a1, *(int **)(a2 + 40));
  }
  else
  {
    OUTLINED_FUNCTION_0_1((uint64_t)a1, a1[4]);
  }
}

uint64_t OUTLINED_FUNCTION_0_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  if (!a2)
    a2 = v2;
  *(_QWORD *)(a1 + 32) = a2;
  return 0;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, uint64_t a11)
{
  a11 = 0;
  a9 = 0u;
  a10 = 0u;
  return pb_encode(&a9);
}

void OUTLINED_FUNCTION_4_1(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  if (!a1)
    a1 = v1;
  *(_QWORD *)(v2 + 32) = a1;
}

void OUTLINED_FUNCTION_5_1()
{
  _QWORD *v0;
  uint64_t v1;

  pb_write(v0, 0, v1);
}

void OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) += *(unsigned __int16 *)(v0 + 26);
}

void OUTLINED_FUNCTION_8_0()
{
  _QWORD *v0;
  unint64_t v1;

  pb_encode_varint(v0, v1);
}

void pb_read(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v5;
  _BYTE v6[16];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = a3;
    if (a2 || *(uint64_t (**)(uint64_t, _BYTE *, uint64_t))a1 == buf_read)
    {
      if (*(_QWORD *)(a1 + 16) >= a3 && ((*(uint64_t (**)(uint64_t))a1)(a1) & 1) != 0)
      {
        *(_QWORD *)(a1 + 16) -= v3;
      }
      else
      {
        OUTLINED_FUNCTION_0_2();
        OUTLINED_FUNCTION_2_2();
        *(_QWORD *)(a1 + 24) = v5;
      }
    }
    else
    {
      while (v3 >= 0x11)
      {
        if (!pb_read(a1, v6, 16))
          return;
        v3 -= 16;
      }
      pb_read(a1, v6, v3);
    }
  }
}

uint64_t buf_read(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  char *v3;
  char v4;

  v3 = *(char **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = &v3[a3];
  if (a2 && a3)
  {
    do
    {
      v4 = *v3++;
      *a2++ = v4;
      --a3;
    }
    while (a3);
  }
  return 1;
}

uint64_t pb_istream_from_buffer@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = buf_read;
  a3[1] = result;
  a3[2] = a2;
  a3[3] = 0;
  return result;
}

void pb_decode_varint32(uint64_t a1, uint64_t a2)
{
  pb_decode_varint32_eof(a1, a2, 0);
}

void pb_decode_varint32_eof(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  int *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned __int8 v16;
  int v17;
  int v18;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[7];
  unsigned __int8 v24;

  OUTLINED_FUNCTION_14_0();
  pb_readbyte(v6, (uint64_t)&v24);
  if ((v7 & 1) != 0)
  {
    v15 = v24;
    if ((char)v24 < 0)
    {
      v15 = v24 & 0x7F;
      v16 = 7;
      while (1)
      {
        OUTLINED_FUNCTION_13_0(v7, v8, v9, v10, v11, v12, v13, v14, v22, *(int *)v23, *(__int16 *)&v23[4], v23[6], v24);
        if (!(_DWORD)v7)
          break;
        v17 = v16;
        if (v16 < 0x20u)
        {
          v15 |= (v24 & 0x7F) << v16;
        }
        else
        {
          if (v16 >= 0x3Fu)
            v18 = 1;
          else
            v18 = 255;
          v20 = v15 < 0 && v18 == v24;
          if ((v24 & 0x7F) == 0)
            v20 = 1;
          if (v16 > 0x3Fu || !v20)
            goto LABEL_28;
        }
        v16 += 7;
        if ((v24 & 0x80) == 0)
        {
          if (v17 == 28 && (v24 & 0x70) != 0)
          {
LABEL_28:
            OUTLINED_FUNCTION_0_2();
            OUTLINED_FUNCTION_2_2();
            *(_QWORD *)(v3 + 24) = v21;
            return;
          }
          goto LABEL_3;
        }
      }
    }
    else
    {
LABEL_3:
      *v4 = v15;
    }
  }
  else if (a3 && !*(_QWORD *)(v3 + 16))
  {
    *a3 = 1;
  }
}

void pb_decode_varint()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_14_0();
  v10 = 0;
  v11 = 0;
  while (1)
  {
    v12 = v10;
    if (v10 >= 0x40u)
      break;
    OUTLINED_FUNCTION_13_0(v2, v3, v4, v5, v6, v7, v8, v9, v14, v15, SWORD2(v15), SBYTE6(v15), SHIBYTE(v15));
    if (!(_DWORD)v2)
      return;
    v11 |= (unint64_t)(HIBYTE(v15) & 0x7F) << v12;
    v10 = v12 + 7;
    if ((v15 & 0x8000000000000000) == 0)
    {
      *v1 = v11;
      return;
    }
  }
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2();
  *(_QWORD *)(v0 + 24) = v13;
}

void pb_readbyte(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)(a1 + 16) && ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))a1)(a1, a2, 1) & 1) != 0)
  {
    --*(_QWORD *)(a1 + 16);
  }
  else
  {
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_2_2();
    *(_QWORD *)(a1 + 24) = v3;
  }
}

void pb_decode_tag(uint64_t a1, int *a2, unsigned int *a3, _BYTE *a4)
{
  int v6;
  char v7;
  unsigned int v8;

  *a4 = 0;
  *a2 = 0;
  *a3 = 0;
  pb_decode_varint32_eof(a1, (uint64_t)&v8, a4);
  if (v6)
  {
    v7 = v8;
    *a3 = v8 >> 3;
    *a2 = v7 & 7;
  }
  OUTLINED_FUNCTION_1_2();
}

void pb_skip_field(uint64_t a1, int a2)
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  char v6;
  unsigned int v7;

  switch(a2)
  {
    case 0:
      do
        OUTLINED_FUNCTION_10_0(a1, (uint64_t)&v6);
      while ((_DWORD)a1 && v6 < 0);
      goto LABEL_9;
    case 1:
      v3 = 8;
      goto LABEL_11;
    case 2:
      pb_decode_varint32(a1, (uint64_t)&v7);
      if (v4)
        pb_read(a1, 0, v7);
      goto LABEL_9;
    case 5:
      v3 = 4;
LABEL_11:
      pb_read(a1, 0, v3);
      break;
    default:
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_2_2();
      *(_QWORD *)(a1 + 24) = v5;
LABEL_9:
      OUTLINED_FUNCTION_1_2();
      break;
  }
}

void pb_make_string_substream()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  int v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;

  OUTLINED_FUNCTION_14_0();
  pb_decode_varint32(v2, (uint64_t)&v7);
  if (v3)
  {
    v4 = *(_OWORD *)(v0 + 16);
    *v1 = *(_OWORD *)v0;
    v1[1] = v4;
    v5 = v7;
    if (*((_QWORD *)v1 + 2) >= (unint64_t)v7)
    {
      *((_QWORD *)v1 + 2) = v7;
      *(_QWORD *)(v0 + 16) -= v5;
    }
    else
    {
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_2_2();
      *(_QWORD *)(v0 + 24) = v6;
    }
  }
  OUTLINED_FUNCTION_1_2();
}

void pb_close_string_substream()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  int v4;

  OUTLINED_FUNCTION_14_0();
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3 || (pb_read(v1, 0, v3), v4))
  {
    *(_QWORD *)(v0 + 8) = *(_QWORD *)(v1 + 8);
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 24);
  }
}

uint64_t pb_decode_ex(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  if ((a4 & 2) != 0)
  {
    OUTLINED_FUNCTION_7_2();
    if ((v6 & 1) == 0)
      return 0;
    OUTLINED_FUNCTION_8_1((uint64_t)&v10);
    v5 = v7;
    OUTLINED_FUNCTION_6_1();
    if (!v8)
      return 0;
  }
  else
  {
    OUTLINED_FUNCTION_8_1(a1);
    return v4;
  }
  return v5;
}

void pb_decode_inner(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD **v15;
  unsigned int v16;
  int v17;
  char v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD **v29;
  uint64_t (*v30)(uint64_t, _QWORD **, uint64_t, uint64_t);
  char v31;
  int v32;
  uint64_t v33;
  unsigned int v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  char v43;
  unsigned int v44;
  unsigned int v45;
  unsigned __int16 v46[8];
  unsigned __int16 v47;
  unsigned __int16 v48;
  unsigned __int16 v49;
  unsigned __int16 v50;
  char v51;
  _QWORD *v52;
  unsigned __int16 *v53;
  uint64_t v54;
  unsigned __int16 v55;
  _QWORD v56[3];
  unsigned __int16 v57;

  v55 = 0;
  v54 = 0;
  v6 = pb_field_iter_begin(v46, a2, a3);
  if ((a4 & 1) == 0 && v6)
  {
    pb_message_set_to_defaults((uint64_t)v46, v7, v8, v9, v10, v11, v12, v13);
    if ((v14 & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
LABEL_74:
      OUTLINED_FUNCTION_2_2();
      *(_QWORD *)(a1 + 24) = v41;
      return;
    }
  }
  v42 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0xFFFF;
  while (*(_QWORD *)(a1 + 16))
  {
    pb_decode_tag(a1, (int *)&v44, &v45, &v43);
    if ((v18 & 1) == 0)
    {
      if (!v43)
        return;
      break;
    }
    v19 = v45;
    if (!v45)
    {
      if ((a4 & 4) == 0)
      {
LABEL_55:
        OUTLINED_FUNCTION_2_2();
        *(_QWORD *)(a1 + 24) = v33;
        return;
      }
      break;
    }
    if (pb_field_iter_find(v46, v45) && (v51 & 0xF) != 0xA)
    {
      if ((v51 & 0x30) == 0x20 && v53 == &v50)
      {
        if (v17 != v47)
        {
          if (v17 != 0xFFFF && v55 != v42)
            goto LABEL_55;
          v55 = 0;
          v42 = v50;
          v17 = v47;
        }
        v53 = &v55;
      }
      if ((v51 & 0x30) == 0 && v48 <= 0x3Fu)
        *(_DWORD *)((char *)&v54 + (((unint64_t)v48 >> 3) & 0x1FFC)) |= 1 << v48;
      decode_field(a1, v44, (unsigned __int8 *)v46);
      if ((v24 & 1) == 0)
        return;
    }
    else
    {
      if (!v16)
      {
        pb_field_iter_find_extension((uint64_t)v46);
        if (v20)
        {
          v15 = (_QWORD **)*v52;
          v21 = v49;
        }
        else
        {
          v21 = 0;
        }
        if (v15)
          v16 = v21;
        else
          v16 = -1;
      }
      v25 = v44;
      if (v19 < v16)
        goto LABEL_36;
      v27 = *(_QWORD *)(a1 + 16);
      v28 = v27;
      v29 = v15;
      if (v15)
      {
        while (v27 == v28)
        {
          v30 = (uint64_t (*)(uint64_t, _QWORD **, uint64_t, uint64_t))**v29;
          if (v30)
          {
            if ((v30(a1, v29, v19, v25) & 1) == 0)
              return;
          }
          else
          {
            pb_field_iter_begin_extension(v56, v29);
            if ((v31 & 1) == 0)
              goto LABEL_55;
            if ((_DWORD)v19 == v57)
            {
              if (v56[1])
              {
                *((_BYTE *)v29 + 24) = 1;
                decode_field(a1, v25, (unsigned __int8 *)v56);
                if (!v32)
                  return;
              }
            }
          }
          v29 = (_QWORD **)v29[2];
          v28 = *(_QWORD *)(a1 + 16);
          if (!v29)
            break;
        }
      }
      if (v27 == v28)
      {
        LODWORD(v25) = v44;
LABEL_36:
        pb_skip_field(a1, v25);
        if ((v26 & 1) == 0)
          return;
      }
    }
  }
  if (v17 != 0xFFFF && v55 != v42)
    goto LABEL_73;
  if (*(_WORD *)(*(_QWORD *)v46 + 34))
  {
    v35 = *(unsigned __int16 *)(*(_QWORD *)v46 + 34) >= 0x40u ? 64 : *(unsigned __int16 *)(*(_QWORD *)v46 + 34);
    v36 = v35 >> 5;
    v37 = (int *)&v54;
    v38 = v36;
    while (v38)
    {
      v39 = *v37++;
      --v38;
      if (v39 != -1)
        goto LABEL_73;
    }
    v40 = v35 & 0x1F;
    if (v40)
    {
      if (*((_DWORD *)&v54 + v36) != 0xFFFFFFFF >> -(char)v40)
      {
LABEL_73:
        OUTLINED_FUNCTION_0_2();
        goto LABEL_74;
      }
    }
  }
}

void pb_decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  pb_decode_inner(a1, a2, a3, 0);
}

void pb_decode_BOOL(uint64_t a1, BOOL *a2)
{
  int v3;
  int v4;

  pb_decode_varint32(a1, (uint64_t)&v4);
  if (v3)
    *a2 = v4 != 0;
  OUTLINED_FUNCTION_1_2();
}

void pb_decode_svarint(uint64_t a1, unint64_t *a2)
{
  int v3;
  unint64_t v4;

  pb_decode_varint();
  if (v3)
    *a2 = -(uint64_t)(v4 & 1) ^ (v4 >> 1);
  OUTLINED_FUNCTION_1_2();
}

void pb_decode_fixed32(uint64_t a1, _DWORD *a2)
{
  int v3;
  int v4;

  pb_read(a1, (uint64_t)&v4, 4uLL);
  if (v3)
    *a2 = v4;
  OUTLINED_FUNCTION_1_2();
}

void pb_decode_fixed64(uint64_t a1, _QWORD *a2)
{
  int v3;
  uint64_t v4;

  pb_read(a1, (uint64_t)&v4, 8uLL);
  if (v3)
    *a2 = v4;
  OUTLINED_FUNCTION_1_2();
}

void pb_message_set_to_defaults(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  _BYTE *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[8];

  v29 = 0u;
  v30 = 0u;
  v28 = 0;
  if (*(_QWORD *)(*(_QWORD *)a1 + 16))
  {
    *((_QWORD *)&v29 + 1) = *(_QWORD *)(*(_QWORD *)a1 + 16);
    v30 = 0xFFFFFFFFFFFFFFFFLL;
    OUTLINED_FUNCTION_5_2(a1, a2, a3, a4, a5, a6, a7, a8, v27, SWORD2(v27), SBYTE6(v27), SHIBYTE(v27), 0, 0, (char)buf_read);
    if (!v9)
      return;
  }
  while (1)
  {
    v10 = *(_BYTE *)(a1 + 30);
    if ((v10 & 0xF) == 0xA)
      break;
    if ((v10 & 0xC0) == 0x80)
    {
      **(_QWORD **)(a1 + 32) = 0;
      if ((v10 & 0x20) != 0)
        goto LABEL_24;
    }
    else if ((*(_BYTE *)(a1 + 30) & 0xC0) == 0)
    {
      v13 = v10 & 0x30;
      if (v13 == 48 || v13 == 32)
      {
LABEL_24:
        **(_WORD **)(a1 + 48) = 0;
        goto LABEL_25;
      }
      if (v13 == 16)
      {
        v14 = *(_BYTE **)(a1 + 48);
        if (v14)
          *v14 = 0;
      }
      if ((v10 & 0xE) == 8
        && ((v15 = *(_QWORD *)(a1 + 56), *(_QWORD *)(v15 + 16)) || *(_QWORD *)(v15 + 24) || **(_QWORD **)(v15 + 8)))
      {
        if (pb_field_iter_begin(v31, v15, *(_QWORD *)(a1 + 40)) && !pb_message_set_to_defaults(v31))
          return;
      }
      else
      {
        memset(*(void **)(a1 + 40), 0, *(unsigned __int16 *)(a1 + 26));
      }
    }
LABEL_25:
    if (HIDWORD(v28) && HIDWORD(v28) == *(unsigned __int16 *)(a1 + 24))
    {
      decode_field((uint64_t)&v29, v28, (unsigned __int8 *)a1);
      if (!(_DWORD)v16)
        return;
      OUTLINED_FUNCTION_5_2(v16, v17, v18, v19, v20, v21, v22, v23, v27, SWORD2(v27), SBYTE6(v27), SHIBYTE(v27), v28, HIDWORD(v28), v29);
      if (!v24)
        return;
      v25 = *(_BYTE **)(a1 + 48);
      if (v25)
        *v25 = 0;
    }
    pb_field_iter_next((_WORD *)a1);
    if ((v26 & 1) == 0)
      return;
  }
  v11 = **(_QWORD **)(a1 + 40);
  if (!v11)
    goto LABEL_25;
  while (1)
  {
    pb_field_iter_begin_extension(v31, (_QWORD *)v11);
    if (v12)
    {
      *(_BYTE *)(v11 + 24) = 0;
      if (!pb_message_set_to_defaults(v31))
        break;
    }
    v11 = *(_QWORD *)(v11 + 16);
    if (!v11)
      goto LABEL_25;
  }
}

void decode_field(uint64_t a1, int a2, unsigned __int8 *a3)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  _BYTE v12[10];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3[30];
  if ((v4 & 0xC0) == 0x80)
    goto LABEL_17;
  if ((v4 & 0xC0) != 0x40)
  {
    if ((v4 & 0xC0) == 0)
      __asm { BR              X11 }
    goto LABEL_17;
  }
  if (!*(_QWORD *)(*(_QWORD *)a3 + 24))
  {
    pb_skip_field(a1, a2);
    return;
  }
  switch(a2)
  {
    case 2:
      OUTLINED_FUNCTION_7_2();
      if (!(_DWORD)v5)
        return;
      v6 = v11;
      while (1)
      {
        v5 = OUTLINED_FUNCTION_3_2(v5);
        if ((v5 & 1) == 0)
          break;
        if (v11)
          v7 = v11 >= v6;
        else
          v7 = 1;
        v6 = v11;
        if (v7)
        {
          OUTLINED_FUNCTION_6_1();
          return;
        }
      }
      goto LABEL_17;
    case 5:
      pb_read(a1, (uint64_t)v12, 4uLL);
      if ((a1 & 1) != 0)
        goto LABEL_33;
      break;
    case 1:
      pb_read(a1, (uint64_t)v12, 8uLL);
      if ((_DWORD)a1)
LABEL_33:
        OUTLINED_FUNCTION_3_2(a1);
      break;
    case 0:
      v9 = 0;
      while (v9 != 10)
      {
        OUTLINED_FUNCTION_10_0(a1, (uint64_t)&v12[v9]);
        if (!(_DWORD)a1)
          return;
        v10 = (char)v12[v9++];
        if ((v10 & 0x80000000) == 0)
          goto LABEL_33;
      }
      OUTLINED_FUNCTION_0_2();
      goto LABEL_18;
    default:
LABEL_17:
      OUTLINED_FUNCTION_0_2();
LABEL_18:
      OUTLINED_FUNCTION_2_2();
      *(_QWORD *)(a1 + 24) = v8;
      return;
  }
}

void decode_basic_field(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  int v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD *, uint64_t, uint64_t);
  int v13;
  int v14;
  unint64_t v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  unsigned int v26;
  BOOL v27;
  int v28;
  uint64_t v30;
  uint64_t v31;
  _WORD *v32;
  _DWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  _QWORD v37[4];

  v4 = *(_BYTE *)(a3 + 30) & 0xF;
  switch(*(_BYTE *)(a3 + 30) & 0xF)
  {
    case 0:
      if ((_DWORD)a2 && (_DWORD)a2 != 255)
        goto LABEL_38;
      pb_decode_BOOL(a1, *(BOOL **)(a3 + 40));
      return;
    case 1:
    case 2:
    case 3:
      if ((_DWORD)a2 && (_DWORD)a2 != 255)
        goto LABEL_38;
      if (v4 != 2)
      {
        if (v4 == 3)
        {
          pb_decode_svarint(a1, &v36);
          if (!v22)
            return;
          v23 = *(unsigned __int16 *)(a3 + 26);
        }
        else
        {
          OUTLINED_FUNCTION_12_0();
          if (!v24)
            return;
          v23 = *(unsigned __int16 *)(a3 + 26);
          v25 = v37[0];
          if (v23 == 8)
          {
LABEL_78:
            **(_QWORD **)(a3 + 40) = v25;
            return;
          }
          v36 = SLODWORD(v37[0]);
        }
        switch(v23)
        {
          case 1:
            v7 = v36;
            **(_BYTE **)(a3 + 40) = v36;
            v9 = (char)v7;
            goto LABEL_75;
          case 2:
            v7 = v36;
            **(_WORD **)(a3 + 40) = v36;
            v9 = (__int16)v7;
            goto LABEL_75;
          case 4:
            v7 = v36;
            **(_DWORD **)(a3 + 40) = v36;
            v9 = (int)v7;
LABEL_75:
            if (v9 != v7)
              goto LABEL_76;
            return;
          case 8:
            v25 = v36;
            goto LABEL_78;
          default:
LABEL_76:
            OUTLINED_FUNCTION_0_2();
            break;
        }
        goto LABEL_39;
      }
      OUTLINED_FUNCTION_12_0();
      if (v6)
      {
        switch(*(_WORD *)(a3 + 26))
        {
          case 1:
            OUTLINED_FUNCTION_11_0();
            *v8 = v7;
            v9 = v7;
            goto LABEL_75;
          case 2:
            OUTLINED_FUNCTION_11_0();
            *v32 = v7;
            v9 = (unsigned __int16)v7;
            goto LABEL_75;
          case 4:
            OUTLINED_FUNCTION_11_0();
            *v33 = v7;
            v9 = v7;
            goto LABEL_75;
          case 8:
            OUTLINED_FUNCTION_11_0();
            *v35 = v34;
            break;
          default:
            goto LABEL_76;
        }
      }
      return;
    case 4:
      if ((_DWORD)a2 != 5 && (_DWORD)a2 != 255)
        goto LABEL_38;
      pb_decode_fixed32(a1, *(_DWORD **)(a3 + 40));
      return;
    case 5:
      if ((_DWORD)a2 != 1 && (_DWORD)a2 != 255)
        goto LABEL_38;
      pb_decode_fixed64(a1, *(_QWORD **)(a3 + 40));
      return;
    case 6:
      if ((_DWORD)a2 != 2)
        goto LABEL_38;
      OUTLINED_FUNCTION_4_2(a1, a2);
      if (!v14)
        return;
      v15 = LODWORD(v37[0]);
      if (LODWORD(v37[0]) >= 0x10000
        || (*(_BYTE *)(a3 + 30) & 0xC0) == 0x80
        || (unint64_t)LODWORD(v37[0]) + 2 > *(unsigned __int16 *)(a3 + 26))
      {
        goto LABEL_38;
      }
      v16 = *(_WORD **)(a3 + 40);
      *v16 = v37[0];
      v17 = (uint64_t)(v16 + 1);
      goto LABEL_65;
    case 7:
      if ((_DWORD)a2 != 2)
        goto LABEL_38;
      v18 = *(_QWORD *)(a3 + 40);
      OUTLINED_FUNCTION_4_2(a1, a2);
      if (!v19)
        return;
      v15 = LODWORD(v37[0]);
      if (LODWORD(v37[0]) == -1
        || (*(_BYTE *)(a3 + 30) & 0xC0) == 0x80
        || LODWORD(v37[0]) >= *(unsigned __int16 *)(a3 + 26))
      {
        goto LABEL_38;
      }
      *(_BYTE *)(v18 + LODWORD(v37[0])) = 0;
      v31 = a1;
      v17 = v18;
      goto LABEL_72;
    case 8:
    case 9:
      if ((_DWORD)a2 != 2)
        goto LABEL_38;
      OUTLINED_FUNCTION_7_2();
      if (!v10)
        return;
      if (!*(_QWORD *)(a3 + 56))
        goto LABEL_38;
      if ((*(_BYTE *)(a3 + 30) & 0xF) == 9 && (v11 = *(_QWORD *)(a3 + 48)) != 0)
      {
        v12 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v11 - 16);
        if (v12)
        {
          v13 = v12(v37, a3, v11 - 8);
          LOBYTE(v12) = v37[2] == 0;
          goto LABEL_51;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
      v13 = 1;
LABEL_51:
      if ((v12 & 1) == 0 && v13)
      {
        v26 = *(unsigned __int8 *)(a3 + 30);
        v27 = v26 >= 0x40;
        v28 = v26 & 0x30;
        v30 = !v27 && v28 != 32;
        pb_decode_inner(v37, *(_QWORD *)(a3 + 56), *(_QWORD *)(a3 + 40), v30);
      }
      OUTLINED_FUNCTION_6_1();
      return;
    case 0xB:
      if ((_DWORD)a2 != 2)
        goto LABEL_38;
      OUTLINED_FUNCTION_4_2(a1, a2);
      if (!v20)
        return;
      if (LODWORD(v37[0]) >= 0x10000)
        goto LABEL_38;
      if (LODWORD(v37[0]))
      {
        v15 = *(unsigned __int16 *)(a3 + 26);
        if (LODWORD(v37[0]) == (_DWORD)v15)
        {
          v17 = *(_QWORD *)(a3 + 40);
LABEL_65:
          v31 = a1;
LABEL_72:
          pb_read(v31, v17, v15);
        }
        else
        {
LABEL_38:
          OUTLINED_FUNCTION_0_2();
LABEL_39:
          OUTLINED_FUNCTION_2_2();
          *(_QWORD *)(a1 + 24) = v21;
        }
      }
      else
      {
        OUTLINED_FUNCTION_9_0();
      }
      return;
    default:
      goto LABEL_38;
  }
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t))(*(_QWORD *)v1 + 24))(va, 0, v1);
}

void OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  pb_decode_varint32(v2, (uint64_t)va);
}

void OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12, int a13, unsigned int a14, char a15)
{
  pb_decode_tag((uint64_t)&a15, &a13, &a14, &a12);
}

void OUTLINED_FUNCTION_6_1()
{
  pb_close_string_substream();
}

void OUTLINED_FUNCTION_7_2()
{
  pb_make_string_substream();
}

void OUTLINED_FUNCTION_8_1(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;

  pb_decode_inner(a1, v3, v2, v1);
}

void *OUTLINED_FUNCTION_9_0()
{
  uint64_t v0;

  return memset(*(void **)(v0 + 40), 0, *(unsigned __int16 *)(v0 + 26));
}

void OUTLINED_FUNCTION_10_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  pb_read(v2, a2, 1uLL);
}

void OUTLINED_FUNCTION_12_0()
{
  pb_decode_varint();
}

void OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  uint64_t v13;

  pb_readbyte(v13, (uint64_t)&a13);
}

void HIDAccesorySessionEventCallback_cold_1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_21960D000, v1, OS_LOG_TYPE_ERROR, "HIDAccesorySessionEventCallback event:%d result:%d", v2, 0xEu);
  OUTLINED_FUNCTION_7();
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return MEMORY[0x24BE66C80]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x24BE66CB8]();
}

uint64_t BTAccessoryManagerGetFeatureCapability()
{
  return MEMORY[0x24BE66D00]();
}

uint64_t BTAccessoryManagerGetTimeSyncId()
{
  return MEMORY[0x24BE66D88]();
}

uint64_t BTAccessoryManagerRegisterCustomMessageClient()
{
  return MEMORY[0x24BE66DB0]();
}

uint64_t BTAccessoryManagerRemoteTimeSyncEnable()
{
  return MEMORY[0x24BE66DC0]();
}

uint64_t BTAccessoryManagerSendCustomMessage()
{
  return MEMORY[0x24BE66DD8]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x24BE66E50]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x24BE66E88]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x24BE66E98]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x24BE66FC0]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x24BE66FD8]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x24BE67098]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x24BE670B0]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x24BE670B8]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x24BDD7EC8](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

