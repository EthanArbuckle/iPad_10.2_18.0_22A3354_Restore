void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22F6A6FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20)
{
  id *v20;
  uint64_t v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose((const void *)(v21 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_22F6A7314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20)
{
  id *v20;
  uint64_t v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose((const void *)(v21 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t PSGPBTypingSpeedReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_28;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_28;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
          goto LABEL_28;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_28;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_28;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_28;
        case 7u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_28:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 8u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 80) |= 1u;
          while (2)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v14 = v22++ >= 9;
                if (v14)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_53:
          v37 = 16;
          goto LABEL_62;
        case 9u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 80) |= 2u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                v14 = v28++ >= 9;
                if (v14)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_57:
          v37 = 20;
          goto LABEL_62;
        case 0xAu:
          v32 = 0;
          v33 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 80) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          break;
        v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v35 + 1;
        v23 |= (unint64_t)(v36 & 0x7F) << v32;
        if ((v36 & 0x80) == 0)
          goto LABEL_59;
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_61;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_59:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_61:
      v37 = 24;
LABEL_62:
      *(_DWORD *)(a1 + v37) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PSGPBImpressionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  void *v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  BOOL v87;
  uint64_t v88;
  uint64_t v89;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_89;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 88;
          goto LABEL_89;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 96;
          goto LABEL_89;
        case 6u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 148) |= 0x200u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_121:
          v87 = v22 != 0;
          v88 = 142;
          goto LABEL_162;
        case 7u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_WORD *)(a1 + 148) |= 0x800u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_125:
          v87 = v28 != 0;
          v88 = 144;
          goto LABEL_162;
        case 8u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_WORD *)(a1 + 148) |= 0x400u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_129:
          v87 = v34 != 0;
          v88 = 143;
          goto LABEL_162;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
          goto LABEL_89;
        case 0xAu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_89;
        case 0xBu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_89;
        case 0xCu:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 8u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_133:
          v89 = 56;
          goto LABEL_167;
        case 0xDu:
          v44 = 0;
          v45 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 4u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v40 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_137:
          v89 = 52;
          goto LABEL_167;
        case 0xEu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_89;
        case 0xFu:
          v49 = 0;
          v50 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x20u;
          while (2)
          {
            v51 = *v3;
            v52 = *(_QWORD *)(a2 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v52 + 1;
              v40 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_141;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_141:
          v89 = 64;
          goto LABEL_167;
        case 0x10u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 80;
          goto LABEL_89;
        case 0x11u:
          v54 = 0;
          v55 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x10u;
          while (2)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
              *(_QWORD *)(a2 + v56) = v57 + 1;
              v40 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                v14 = v55++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_145;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_145:
          v89 = 60;
          goto LABEL_167;
        case 0x12u:
          v59 = 0;
          v60 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x40u;
          while (2)
          {
            v61 = *v3;
            v62 = *(_QWORD *)(a2 + v61);
            if (v62 == -1 || v62 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v62);
              *(_QWORD *)(a2 + v61) = v62 + 1;
              v40 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                v14 = v60++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_149;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_149:
          v89 = 136;
          goto LABEL_167;
        case 0x13u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 128;
          goto LABEL_89;
        case 0x14u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 120;
          goto LABEL_89;
        case 0x15u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 112;
          goto LABEL_89;
        case 0x16u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 104;
LABEL_89:
          v64 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 0x17u:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          *(_WORD *)(a1 + 148) |= 0x80u;
          while (2)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            if (v69 == -1 || v69 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
              *(_QWORD *)(a2 + v68) = v69 + 1;
              v67 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                v14 = v66++ >= 9;
                if (v14)
                {
                  v67 = 0;
                  goto LABEL_153;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v67 = 0;
LABEL_153:
          v87 = v67 != 0;
          v88 = 140;
          goto LABEL_162;
        case 0x18u:
          v71 = 0;
          v72 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 2u;
          while (2)
          {
            v73 = *v3;
            v74 = *(_QWORD *)(a2 + v73);
            if (v74 == -1 || v74 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v74);
              *(_QWORD *)(a2 + v73) = v74 + 1;
              v40 |= (unint64_t)(v75 & 0x7F) << v71;
              if (v75 < 0)
              {
                v71 += 7;
                v14 = v72++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_157;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_157:
          v89 = 48;
          goto LABEL_167;
        case 0x19u:
          v76 = 0;
          v77 = 0;
          v78 = 0;
          *(_WORD *)(a1 + 148) |= 0x100u;
          while (2)
          {
            v79 = *v3;
            v80 = *(_QWORD *)(a2 + v79);
            if (v80 == -1 || v80 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v81 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v80);
              *(_QWORD *)(a2 + v79) = v80 + 1;
              v78 |= (unint64_t)(v81 & 0x7F) << v76;
              if (v81 < 0)
              {
                v76 += 7;
                v14 = v77++ >= 9;
                if (v14)
                {
                  v78 = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v78 = 0;
LABEL_161:
          v87 = v78 != 0;
          v88 = 141;
LABEL_162:
          *(_BYTE *)(a1 + v88) = v87;
          continue;
        case 0x1Au:
          v82 = 0;
          v83 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v84 = *v3;
        v85 = *(_QWORD *)(a2 + v84);
        if (v85 == -1 || v85 >= *(_QWORD *)(a2 + *v4))
          break;
        v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v85);
        *(_QWORD *)(a2 + v84) = v85 + 1;
        v40 |= (unint64_t)(v86 & 0x7F) << v82;
        if ((v86 & 0x80) == 0)
          goto LABEL_164;
        v82 += 7;
        v14 = v83++ >= 9;
        if (v14)
        {
          LODWORD(v40) = 0;
          goto LABEL_166;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_164:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v40) = 0;
LABEL_166:
      v89 = 16;
LABEL_167:
      *(_DWORD *)(a1 + v89) = v40;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_22F6B3D08(_Unwind_Exception *a1)
{
  PRERecordMeasurementState();
  _Unwind_Resume(a1);
}

void sub_22F6B4D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSGPBPredictionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  void *v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  BOOL v99;
  uint64_t v100;
  uint64_t v101;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_89;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 88;
          goto LABEL_89;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 96;
          goto LABEL_89;
        case 7u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 148) |= 0x200u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_135:
          v99 = v22 != 0;
          v100 = 142;
          goto LABEL_184;
        case 8u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_WORD *)(a1 + 148) |= 0x800u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_139:
          v99 = v28 != 0;
          v100 = 144;
          goto LABEL_184;
        case 9u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_WORD *)(a1 + 148) |= 0x400u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_143:
          v99 = v34 != 0;
          v100 = 143;
          goto LABEL_184;
        case 0xAu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
          goto LABEL_89;
        case 0xBu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_89;
        case 0xCu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_89;
        case 0xDu:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 8u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_147;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_147:
          v101 = 56;
          goto LABEL_189;
        case 0xEu:
          v44 = 0;
          v45 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 4u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v40 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_151;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_151:
          v101 = 52;
          goto LABEL_189;
        case 0xFu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_89;
        case 0x10u:
          v49 = 0;
          v50 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x20u;
          while (2)
          {
            v51 = *v3;
            v52 = *(_QWORD *)(a2 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v52 + 1;
              v40 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_155;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_155:
          v101 = 64;
          goto LABEL_189;
        case 0x11u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 80;
          goto LABEL_89;
        case 0x12u:
          v54 = 0;
          v55 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x10u;
          while (2)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
              *(_QWORD *)(a2 + v56) = v57 + 1;
              v40 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                v14 = v55++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_159;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_159:
          v101 = 60;
          goto LABEL_189;
        case 0x13u:
          v59 = 0;
          v60 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x40u;
          while (2)
          {
            v61 = *v3;
            v62 = *(_QWORD *)(a2 + v61);
            if (v62 == -1 || v62 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v62);
              *(_QWORD *)(a2 + v61) = v62 + 1;
              v40 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                v14 = v60++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_163;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_163:
          v101 = 136;
          goto LABEL_189;
        case 0x14u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 128;
          goto LABEL_89;
        case 0x15u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 120;
          goto LABEL_89;
        case 0x16u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 112;
          goto LABEL_89;
        case 0x17u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 104;
LABEL_89:
          v64 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 0x18u:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          *(_WORD *)(a1 + 148) |= 0x1000u;
          while (2)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            if (v69 == -1 || v69 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
              *(_QWORD *)(a2 + v68) = v69 + 1;
              v67 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                v14 = v66++ >= 9;
                if (v14)
                {
                  v67 = 0;
                  goto LABEL_167;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v67 = 0;
LABEL_167:
          v99 = v67 != 0;
          v100 = 145;
          goto LABEL_184;
        case 0x19u:
          v71 = 0;
          v72 = 0;
          v73 = 0;
          *(_WORD *)(a1 + 148) |= 0x2000u;
          while (2)
          {
            v74 = *v3;
            v75 = *(_QWORD *)(a2 + v74);
            if (v75 == -1 || v75 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v76 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v75);
              *(_QWORD *)(a2 + v74) = v75 + 1;
              v73 |= (unint64_t)(v76 & 0x7F) << v71;
              if (v76 < 0)
              {
                v71 += 7;
                v14 = v72++ >= 9;
                if (v14)
                {
                  v73 = 0;
                  goto LABEL_171;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v73 = 0;
LABEL_171:
          v99 = v73 != 0;
          v100 = 146;
          goto LABEL_184;
        case 0x1Au:
          v77 = 0;
          v78 = 0;
          v79 = 0;
          *(_WORD *)(a1 + 148) |= 0x80u;
          while (2)
          {
            v80 = *v3;
            v81 = *(_QWORD *)(a2 + v80);
            if (v81 == -1 || v81 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v82 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
              *(_QWORD *)(a2 + v80) = v81 + 1;
              v79 |= (unint64_t)(v82 & 0x7F) << v77;
              if (v82 < 0)
              {
                v77 += 7;
                v14 = v78++ >= 9;
                if (v14)
                {
                  v79 = 0;
                  goto LABEL_175;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v79 = 0;
LABEL_175:
          v99 = v79 != 0;
          v100 = 140;
          goto LABEL_184;
        case 0x1Bu:
          v83 = 0;
          v84 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 2u;
          while (2)
          {
            v85 = *v3;
            v86 = *(_QWORD *)(a2 + v85);
            if (v86 == -1 || v86 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v87 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v86);
              *(_QWORD *)(a2 + v85) = v86 + 1;
              v40 |= (unint64_t)(v87 & 0x7F) << v83;
              if (v87 < 0)
              {
                v83 += 7;
                v14 = v84++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_179;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_179:
          v101 = 48;
          goto LABEL_189;
        case 0x1Cu:
          v88 = 0;
          v89 = 0;
          v90 = 0;
          *(_WORD *)(a1 + 148) |= 0x100u;
          while (2)
          {
            v91 = *v3;
            v92 = *(_QWORD *)(a2 + v91);
            if (v92 == -1 || v92 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v93 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v92);
              *(_QWORD *)(a2 + v91) = v92 + 1;
              v90 |= (unint64_t)(v93 & 0x7F) << v88;
              if (v93 < 0)
              {
                v88 += 7;
                v14 = v89++ >= 9;
                if (v14)
                {
                  v90 = 0;
                  goto LABEL_183;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v90 = 0;
LABEL_183:
          v99 = v90 != 0;
          v100 = 141;
LABEL_184:
          *(_BYTE *)(a1 + v100) = v99;
          continue;
        case 0x1Du:
          v94 = 0;
          v95 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v96 = *v3;
        v97 = *(_QWORD *)(a2 + v96);
        if (v97 == -1 || v97 >= *(_QWORD *)(a2 + *v4))
          break;
        v98 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v97);
        *(_QWORD *)(a2 + v96) = v97 + 1;
        v40 |= (unint64_t)(v98 & 0x7F) << v94;
        if ((v98 & 0x80) == 0)
          goto LABEL_186;
        v94 += 7;
        v14 = v95++ >= 9;
        if (v14)
        {
          LODWORD(v40) = 0;
          goto LABEL_188;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_186:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v40) = 0;
LABEL_188:
      v101 = 16;
LABEL_189:
      *(_DWORD *)(a1 + v101) = v40;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_22F6B9194(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_22F6B9388(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22F6B9458(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PSGPBErrorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  void *v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 2u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 132) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_104;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_106;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_104:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_106:
          v77 = 16;
          goto LABEL_144;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 24;
          goto LABEL_102;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_102;
        case 5u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_102;
        case 6u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_WORD *)(a1 + 132) |= 0x80u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_110;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_110:
          v78 = v28 != 0;
          v79 = 126;
          goto LABEL_139;
        case 7u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_WORD *)(a1 + 132) |= 0x200u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_114;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_114:
          v78 = v34 != 0;
          v79 = 128;
          goto LABEL_139;
        case 8u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 132) |= 0x100u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_118;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_118:
          v78 = v40 != 0;
          v79 = 127;
          goto LABEL_139;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 64;
          goto LABEL_102;
        case 0xAu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 40;
          goto LABEL_102;
        case 0xBu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 8;
          goto LABEL_102;
        case 0xCu:
          v44 = 0;
          v45 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 132) |= 8u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v19 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_122:
          v77 = 56;
          goto LABEL_144;
        case 0xDu:
          v49 = 0;
          v50 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 132) |= 4u;
          while (2)
          {
            v51 = *v3;
            v52 = *(_QWORD *)(a2 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v52 + 1;
              v19 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_126:
          v77 = 52;
          goto LABEL_144;
        case 0xEu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 32;
          goto LABEL_102;
        case 0xFu:
          v54 = 0;
          v55 = 0;
          v56 = 0;
          *(_WORD *)(a1 + 132) |= 0x20u;
          while (2)
          {
            v57 = *v3;
            v58 = *(_QWORD *)(a2 + v57);
            if (v58 == -1 || v58 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
              *(_QWORD *)(a2 + v57) = v58 + 1;
              v56 |= (unint64_t)(v59 & 0x7F) << v54;
              if (v59 < 0)
              {
                v54 += 7;
                v14 = v55++ >= 9;
                if (v14)
                {
                  v56 = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v56 = 0;
LABEL_130:
          v78 = v56 != 0;
          v79 = 124;
          goto LABEL_139;
        case 0x10u:
          v60 = 0;
          v61 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 132) |= 2u;
          while (2)
          {
            v62 = *v3;
            v63 = *(_QWORD *)(a2 + v62);
            if (v63 == -1 || v63 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
              *(_QWORD *)(a2 + v62) = v63 + 1;
              v19 |= (unint64_t)(v64 & 0x7F) << v60;
              if (v64 < 0)
              {
                v60 += 7;
                v14 = v61++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_134:
          v77 = 48;
          goto LABEL_144;
        case 0x11u:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          *(_WORD *)(a1 + 132) |= 0x40u;
          while (2)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            if (v69 == -1 || v69 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
              *(_QWORD *)(a2 + v68) = v69 + 1;
              v67 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                v14 = v66++ >= 9;
                if (v14)
                {
                  v67 = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v67 = 0;
LABEL_138:
          v78 = v67 != 0;
          v79 = 125;
LABEL_139:
          *(_BYTE *)(a1 + v79) = v78;
          continue;
        case 0x12u:
          v71 = 0;
          v72 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 132) |= 0x10u;
          break;
        case 0x13u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 112;
          goto LABEL_102;
        case 0x14u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 104;
          goto LABEL_102;
        case 0x15u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 96;
          goto LABEL_102;
        case 0x16u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
LABEL_102:
          v76 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v73 = *v3;
        v74 = *(_QWORD *)(a2 + v73);
        if (v74 == -1 || v74 >= *(_QWORD *)(a2 + *v4))
          break;
        v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v74);
        *(_QWORD *)(a2 + v73) = v74 + 1;
        v19 |= (unint64_t)(v75 & 0x7F) << v71;
        if ((v75 & 0x80) == 0)
          goto LABEL_141;
        v71 += 7;
        v14 = v72++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_143;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_141:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_143:
      v77 = 120;
LABEL_144:
      *(_DWORD *)(a1 + v77) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PSGPBEngagementReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  void *v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  uint64_t v92;
  BOOL v93;
  uint64_t v94;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 2u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x40u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_126;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_128;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_126:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_128:
          v92 = 68;
          goto LABEL_178;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 24;
          goto LABEL_96;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
          goto LABEL_96;
        case 5u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 96;
          goto LABEL_96;
        case 6u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_WORD *)(a1 + 148) |= 0x400u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_132:
          v93 = v28 != 0;
          v94 = 142;
          goto LABEL_173;
        case 7u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_WORD *)(a1 + 148) |= 0x1000u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_136:
          v93 = v34 != 0;
          v94 = 144;
          goto LABEL_173;
        case 8u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x800u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_140:
          v93 = v40 != 0;
          v94 = 143;
          goto LABEL_173;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_96;
        case 0xAu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 40;
          goto LABEL_96;
        case 0xBu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 8;
          goto LABEL_96;
        case 0xCu:
          v44 = 0;
          v45 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 8u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v19 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_144:
          v92 = 56;
          goto LABEL_178;
        case 0xDu:
          v49 = 0;
          v50 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 4u;
          while (2)
          {
            v51 = *v3;
            v52 = *(_QWORD *)(a2 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v52 + 1;
              v19 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_148:
          v92 = 52;
          goto LABEL_178;
        case 0xEu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 32;
          goto LABEL_96;
        case 0xFu:
          v54 = 0;
          v55 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x20u;
          while (2)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
              *(_QWORD *)(a2 + v56) = v57 + 1;
              v19 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                v14 = v55++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_152:
          v92 = 64;
          goto LABEL_178;
        case 0x10u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_96;
        case 0x11u:
          v59 = 0;
          v60 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x10u;
          while (2)
          {
            v61 = *v3;
            v62 = *(_QWORD *)(a2 + v61);
            if (v62 == -1 || v62 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v62);
              *(_QWORD *)(a2 + v61) = v62 + 1;
              v19 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                v14 = v60++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_156:
          v92 = 60;
          goto LABEL_178;
        case 0x12u:
          v64 = 0;
          v65 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x80u;
          while (2)
          {
            v66 = *v3;
            v67 = *(_QWORD *)(a2 + v66);
            if (v67 == -1 || v67 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v67);
              *(_QWORD *)(a2 + v66) = v67 + 1;
              v19 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                v14 = v65++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_160:
          v92 = 136;
          goto LABEL_178;
        case 0x13u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 128;
          goto LABEL_96;
        case 0x14u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 120;
          goto LABEL_96;
        case 0x15u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 112;
          goto LABEL_96;
        case 0x16u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 104;
LABEL_96:
          v69 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        case 0x17u:
          v70 = 0;
          v71 = 0;
          v72 = 0;
          *(_WORD *)(a1 + 148) |= 0x100u;
          while (2)
          {
            v73 = *v3;
            v74 = *(_QWORD *)(a2 + v73);
            if (v74 == -1 || v74 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v74);
              *(_QWORD *)(a2 + v73) = v74 + 1;
              v72 |= (unint64_t)(v75 & 0x7F) << v70;
              if (v75 < 0)
              {
                v70 += 7;
                v14 = v71++ >= 9;
                if (v14)
                {
                  v72 = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v72 = 0;
LABEL_164:
          v93 = v72 != 0;
          v94 = 140;
          goto LABEL_173;
        case 0x18u:
          v76 = 0;
          v77 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 2u;
          while (2)
          {
            v78 = *v3;
            v79 = *(_QWORD *)(a2 + v78);
            if (v79 == -1 || v79 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v79);
              *(_QWORD *)(a2 + v78) = v79 + 1;
              v19 |= (unint64_t)(v80 & 0x7F) << v76;
              if (v80 < 0)
              {
                v76 += 7;
                v14 = v77++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_168:
          v92 = 48;
          goto LABEL_178;
        case 0x19u:
          v81 = 0;
          v82 = 0;
          v83 = 0;
          *(_WORD *)(a1 + 148) |= 0x200u;
          while (2)
          {
            v84 = *v3;
            v85 = *(_QWORD *)(a2 + v84);
            if (v85 == -1 || v85 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v85);
              *(_QWORD *)(a2 + v84) = v85 + 1;
              v83 |= (unint64_t)(v86 & 0x7F) << v81;
              if (v86 < 0)
              {
                v81 += 7;
                v14 = v82++ >= 9;
                if (v14)
                {
                  v83 = 0;
                  goto LABEL_172;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v83 = 0;
LABEL_172:
          v93 = v83 != 0;
          v94 = 141;
LABEL_173:
          *(_BYTE *)(a1 + v94) = v93;
          continue;
        case 0x1Au:
          v87 = 0;
          v88 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v89 = *v3;
        v90 = *(_QWORD *)(a2 + v89);
        if (v90 == -1 || v90 >= *(_QWORD *)(a2 + *v4))
          break;
        v91 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v90);
        *(_QWORD *)(a2 + v89) = v90 + 1;
        v19 |= (unint64_t)(v91 & 0x7F) << v87;
        if ((v91 & 0x80) == 0)
          goto LABEL_175;
        v87 += 7;
        v14 = v88++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_177;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_175:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_177:
      v92 = 16;
LABEL_178:
      *(_DWORD *)(a1 + v92) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PSGPBQueryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  void *v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 88) |= 0x20u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_86;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_88;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_86:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_88:
          v67 = v19 != 0;
          v68 = 82;
          goto LABEL_118;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 88) |= 0x80u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v26 = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_92:
          v67 = v26 != 0;
          v68 = 84;
          goto LABEL_118;
        case 3u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          *(_BYTE *)(a1 + 88) |= 0x40u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                v14 = v31++ >= 9;
                if (v14)
                {
                  v32 = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v32 = 0;
LABEL_96:
          v67 = v32 != 0;
          v68 = 83;
          goto LABEL_118;
        case 4u:
          PBReaderReadString();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = 56;
          goto LABEL_63;
        case 5u:
          PBReaderReadString();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = 32;
          goto LABEL_63;
        case 6u:
          PBReaderReadString();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = 8;
          goto LABEL_63;
        case 7u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 88) |= 4u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_100:
          v69 = 48;
          goto LABEL_113;
        case 8u:
          v44 = 0;
          v45 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 88) |= 2u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v40 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_104:
          v69 = 44;
          goto LABEL_113;
        case 9u:
          PBReaderReadString();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = 24;
          goto LABEL_63;
        case 0xAu:
          PBReaderReadString();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = 16;
          goto LABEL_63;
        case 0xBu:
          PBReaderReadString();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = 64;
          goto LABEL_63;
        case 0xCu:
          PBReaderReadString();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = 72;
LABEL_63:
          v49 = *(void **)(a1 + v37);
          *(_QWORD *)(a1 + v37) = v36;

          continue;
        case 0xDu:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_BYTE *)(a1 + 88) |= 8u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v14 = v51++ >= 9;
                if (v14)
                {
                  v52 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v52 = 0;
LABEL_108:
          v67 = v52 != 0;
          v68 = 80;
          goto LABEL_118;
        case 0xEu:
          v56 = 0;
          v57 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 88) |= 1u;
          while (2)
          {
            v58 = *v3;
            v59 = *(_QWORD *)(a2 + v58);
            if (v59 == -1 || v59 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
              *(_QWORD *)(a2 + v58) = v59 + 1;
              v40 |= (unint64_t)(v60 & 0x7F) << v56;
              if (v60 < 0)
              {
                v56 += 7;
                v14 = v57++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v40) = 0;
LABEL_112:
          v69 = 40;
LABEL_113:
          *(_DWORD *)(a1 + v69) = v40;
          continue;
        case 0xFu:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          *(_BYTE *)(a1 + 88) |= 0x10u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v64 = *v3;
        v65 = *(_QWORD *)(a2 + v64);
        if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v4))
          break;
        v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
        *(_QWORD *)(a2 + v64) = v65 + 1;
        v63 |= (unint64_t)(v66 & 0x7F) << v61;
        if ((v66 & 0x80) == 0)
          goto LABEL_115;
        v61 += 7;
        v14 = v62++ >= 9;
        if (v14)
        {
          v63 = 0;
          goto LABEL_117;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_115:
      if (*(_BYTE *)(a2 + *v5))
        v63 = 0;
LABEL_117:
      v67 = v63 != 0;
      v68 = 81;
LABEL_118:
      *(_BYTE *)(a1 + v68) = v67;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PSGPBTriggerReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  void *v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 2u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 124) |= 8u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_97;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_99;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_97:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_99:
          v72 = 112;
          goto LABEL_128;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_74;
        case 5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 16;
          goto LABEL_74;
        case 6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
          goto LABEL_74;
        case 7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_74;
        case 8u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_WORD *)(a1 + 124) |= 0x40u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_103:
          v73 = v28 != 0;
          v74 = 118;
          goto LABEL_133;
        case 9u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_WORD *)(a1 + 124) |= 0x100u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_107:
          v73 = v34 != 0;
          v74 = 120;
          goto LABEL_133;
        case 0xAu:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 124) |= 0x80u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_111;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_111:
          v73 = v40 != 0;
          v74 = 119;
          goto LABEL_133;
        case 0xBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_74;
        case 0xCu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 32;
          goto LABEL_74;
        case 0xDu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 8;
          goto LABEL_74;
        case 0xEu:
          v44 = 0;
          v45 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 124) |= 4u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v19 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_115:
          v72 = 48;
          goto LABEL_128;
        case 0xFu:
          v49 = 0;
          v50 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 124) |= 2u;
          while (2)
          {
            v51 = *v3;
            v52 = *(_QWORD *)(a2 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v52 + 1;
              v19 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_119:
          v72 = 44;
          goto LABEL_128;
        case 0x10u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 24;
          goto LABEL_74;
        case 0x11u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_74;
        case 0x12u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_74;
        case 0x13u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
LABEL_74:
          v54 = *(void **)(a1 + v24);
          *(_QWORD *)(a1 + v24) = v23;

          continue;
        case 0x14u:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          *(_WORD *)(a1 + 124) |= 0x10u;
          while (2)
          {
            v58 = *v3;
            v59 = *(_QWORD *)(a2 + v58);
            if (v59 == -1 || v59 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
              *(_QWORD *)(a2 + v58) = v59 + 1;
              v57 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v14 = v56++ >= 9;
                if (v14)
                {
                  v57 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v57 = 0;
LABEL_123:
          v73 = v57 != 0;
          v74 = 116;
          goto LABEL_133;
        case 0x15u:
          v61 = 0;
          v62 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 124) |= 1u;
          while (2)
          {
            v63 = *v3;
            v64 = *(_QWORD *)(a2 + v63);
            if (v64 == -1 || v64 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
              *(_QWORD *)(a2 + v63) = v64 + 1;
              v19 |= (unint64_t)(v65 & 0x7F) << v61;
              if (v65 < 0)
              {
                v61 += 7;
                v14 = v62++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_127:
          v72 = 40;
LABEL_128:
          *(_DWORD *)(a1 + v72) = v19;
          continue;
        case 0x16u:
          v66 = 0;
          v67 = 0;
          v68 = 0;
          *(_WORD *)(a1 + 124) |= 0x20u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v69 = *v3;
        v70 = *(_QWORD *)(a2 + v69);
        if (v70 == -1 || v70 >= *(_QWORD *)(a2 + *v4))
          break;
        v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
        *(_QWORD *)(a2 + v69) = v70 + 1;
        v68 |= (unint64_t)(v71 & 0x7F) << v66;
        if ((v71 & 0x80) == 0)
          goto LABEL_130;
        v66 += 7;
        v14 = v67++ >= 9;
        if (v14)
        {
          v68 = 0;
          goto LABEL_132;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_130:
      if (*(_BYTE *)(a2 + *v5))
        v68 = 0;
LABEL_132:
      v73 = v68 != 0;
      v74 = 117;
LABEL_133:
      *(_BYTE *)(a1 + v74) = v73;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x24BE4F978]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t PRERecordMeasurementState()
{
  return MEMORY[0x24BE79A10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

uint64_t pre_signpost_handle()
{
  return MEMORY[0x24BE79A18]();
}

uint64_t psg_default_log_handle()
{
  return MEMORY[0x24BE79AB0]();
}

