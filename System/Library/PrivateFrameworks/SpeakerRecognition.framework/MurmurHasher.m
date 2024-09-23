@implementation MurmurHasher

+ ($7DEDF3842AEFB7F1E6DF5AF62E424A02)hash128WithKey:(const void *)a3 length:(unint64_t)a4 seed:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned __int8 *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v5 = a5;
  if (a4 >= 0x10)
  {
    v7 = a4 >> 4;
    v8 = (char *)a3 + 8;
    v6 = a5;
    do
    {
      v6 = 5
         * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *(v8 - 1)) | ((0x87C37B91114253D5 * *(v8 - 1)) >> 33))) ^ v6, 37)+ v5)+ 1390208809;
      v5 = 5
         * (v6
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v8) | ((unint64_t)(0x4CF5AD432745937FLL * *v8) >> 31))) ^ v5, 33))+ 944331445;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  else
  {
    v6 = a5;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = (unsigned __int8 *)a3 + (a4 & 0xFFFFFFFFFFFFFFF0);
  switch(a4 & 0xF)
  {
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      goto LABEL_14;
    case 8uLL:
      goto LABEL_13;
    case 9uLL:
      goto LABEL_12;
    case 0xAuLL:
      goto LABEL_11;
    case 0xBuLL:
      goto LABEL_10;
    case 0xCuLL:
      goto LABEL_9;
    case 0xDuLL:
      goto LABEL_8;
    case 0xEuLL:
      goto LABEL_7;
    case 0xFuLL:
      v9 = (unint64_t)v22[14] << 48;
LABEL_7:
      v10 = v9 | ((unint64_t)v22[13] << 40);
LABEL_8:
      v11 = v10 ^ ((unint64_t)v22[12] << 32);
LABEL_9:
      v12 = v11 ^ ((unint64_t)v22[11] << 24);
LABEL_10:
      v13 = v12 ^ ((unint64_t)v22[10] << 16);
LABEL_11:
      v14 = v13 ^ ((unint64_t)v22[9] << 8);
LABEL_12:
      v5 ^= 0x87C37B91114253D5
          * ((0x4E8B26FE00000000 * (v14 ^ v22[8])) | ((0x4CF5AD432745937FLL * (v14 ^ v22[8])) >> 31));
LABEL_13:
      v15 = (unint64_t)v22[7] << 56;
LABEL_14:
      v16 = v15 | ((unint64_t)v22[6] << 48);
LABEL_15:
      v17 = v16 ^ ((unint64_t)v22[5] << 40);
LABEL_16:
      v18 = v17 ^ ((unint64_t)v22[4] << 32);
LABEL_17:
      v19 = v18 ^ ((unint64_t)v22[3] << 24);
LABEL_18:
      v20 = v19 ^ ((unint64_t)v22[2] << 16);
LABEL_19:
      v21 = v20 ^ ((unint64_t)v22[1] << 8);
LABEL_20:
      v6 ^= 0x4CF5AD432745937FLL
          * ((0x88A129EA80000000 * (v21 ^ *v22)) | ((0x87C37B91114253D5 * (v21 ^ *v22)) >> 33));
      break;
    default:
      break;
  }
  v23 = v5 ^ a4;
  v24 = v23 + (v6 ^ a4);
  v25 = v24 + v23;
  v26 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) >> 33));
  v27 = v26 ^ (v26 >> 33);
  v28 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v25 ^ (v25 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v25 ^ (v25 >> 33))) >> 33));
  v29 = v28 ^ (v28 >> 33);
  v30 = v29 + v27;
  v31 = v29 + v27 + v29;
  result.var1 = v31;
  result.var0 = v30;
  return result;
}

@end
