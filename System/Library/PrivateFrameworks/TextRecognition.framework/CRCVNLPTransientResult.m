@implementation CRCVNLPTransientResult

- (char)initWithActivationMatrix:(void *)a3 decodingLocale:(__int128 *)a4 activationsBuffer:
{
  id v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  const char *v12;
  SEL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v23;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = v7;
    v10 = v8;
    v23.receiver = a1;
    v23.super_class = (Class)CRCVNLPTransientResult;
    v11 = (char *)objc_msgSendSuper2(&v23, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_setProperty_atomic(v11, v12, v9, 360);
      objc_setProperty_atomic(a1, v13, v10, 368);

      v14 = *a4;
      v15 = a4[1];
      *(_OWORD *)(a1 + 40) = a4[2];
      *(_OWORD *)(a1 + 24) = v15;
      *(_OWORD *)(a1 + 8) = v14;
      v16 = a4[3];
      v17 = a4[4];
      v18 = a4[5];
      *(_OWORD *)(a1 + 104) = a4[6];
      *(_OWORD *)(a1 + 88) = v18;
      *(_OWORD *)(a1 + 72) = v17;
      *(_OWORD *)(a1 + 56) = v16;
      v19 = a4[7];
      v20 = a4[8];
      v21 = a4[9];
      *((_QWORD *)a1 + 21) = *((_QWORD *)a4 + 20);
      *(_OWORD *)(a1 + 152) = v21;
      *(_OWORD *)(a1 + 136) = v20;
      *(_OWORD *)(a1 + 120) = v19;
    }
    else
    {

    }
  }

  return a1;
}

- (double)modernizedActivationMatrix
{
  uint64_t v4;
  SEL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  id v10;

  if (self)
  {
    v10 = objc_getProperty(self, (SEL)self, 360, 1);
    v4 = objc_msgSend(v10, "timestepCount");
    v6 = objc_msgSend(objc_getProperty(self, v5, 360, 1), "observationCount");
    v7 = *((_QWORD *)self + 1);
    if (*((_BYTE *)self + 344))
      v8 = *((_QWORD *)self + 22);
    else
      v8 = 0;
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v6;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_QWORD *)(a1 + 64) = v7;
    *(_QWORD *)(a1 + 72) = v8;

  }
  else
  {
    result = 0.0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageRecognitionActiveSem, 0);
  objc_storeStrong((id *)&self->_decodingLocale, 0);
  objc_storeStrong((id *)&self->_activationMatrix, 0);
  objc_storeStrong((id *)&self->_greedyDecodingResult, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 176) = 0;
  *((_BYTE *)self + 344) = 0;
  return self;
}

@end
