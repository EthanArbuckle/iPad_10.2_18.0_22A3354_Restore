void sub_19B89E180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B89EED4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

FactorLevel *FactorLevel::level_as_string_val(FactorLevel *this)
{
  FactorLevel *v1;
  unsigned int v2;
  BOOL v3;
  uint64_t v4;

  v1 = &this[-*(int *)this->var0];
  v2 = *(unsigned __int16 *)v1->var0;
  if (v2 >= 7
    && *(_WORD *)v1[6].var0
    && (v2 >= 9 ? (v3 = this[*(unsigned __int16 *)v1[6].var0].var0[0] == 2) : (v3 = 0),
        v3 && (v4 = *(unsigned __int16 *)v1[8].var0) != 0))
  {
    return &this[v4 + *(unsigned int *)this[v4].var0];
  }
  else
  {
    return 0;
  }
}

id TRIValidateFactorPackId(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  void *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString<TRIFactorPackId> * _Nullable TRIValidateFactorPackId(NSString * _Nonnull __strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("TRIStrongTypingProtocols.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

  }
  if ((objc_msgSend(v1, "triIsPathSafePlausibleUniqueId") & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v1;
      _os_log_error_impl(&dword_19B89C000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for a factor pack ID: %@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

id TRIValidateRampId(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  void *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString<TRIRampId> * _Nullable TRIValidateRampId(NSString * _Nonnull __strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("TRIStrongTypingProtocols.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rampId"));

  }
  if ((objc_msgSend(v1, "triIsPathSafePlausibleUniqueId") & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v1;
      _os_log_error_impl(&dword_19B89C000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for a ramp ID: %@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

void sub_19B8A00C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8A1708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL apple::aiml::flatbuffers2::Verifier::VerifyVectorOfTables<FactorMetadataKeyValue>(apple::aiml::flatbuffers2::Verifier *a1, FactorMetadataKeyValue *a2)
{
  unint64_t v4;
  FactorMetadataKeyValue *v5;
  _BOOL8 result;

  if (!a2)
    return 1;
  if (!*(_DWORD *)a2->var0)
    return 1;
  v4 = 0;
  v5 = a2 + 4;
  do
  {
    result = FactorMetadataKeyValue::Verify(&v5[*(unsigned int *)v5->var0], a1);
    if (!result)
      break;
    ++v4;
    v5 += 4;
  }
  while (v4 < *(unsigned int *)a2->var0);
  return result;
}

BOOL FactorLevel::Verify(FactorLevel *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  _BOOL8 result;
  FactorLevel *v5;
  uint64_t v6;
  FactorLevel *v7;
  FactorLevel *v8;
  unsigned int v9;
  unint64_t v10;
  TrialManagedAsset *v11;
  unint64_t v12;
  TrialManagedAsset *v13;
  unint64_t v14;
  unint64_t v15;
  FactorMetadataKeyValue *v16;
  uint64_t v17;
  uint64_t v18;
  FactorLevel *v19;
  unsigned int v20;
  unint64_t v21;
  FactorLevel *v22;
  FactorLevel *v23;
  uint64_t v24;
  FactorLevel *v25;
  FactorLevel *v26;
  uint64_t v27;
  FactorLevel *v28;
  FactorLevel *v29;
  uint64_t v30;
  unint64_t v31;

  result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (!result)
    return result;
  result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 4u);
  if (!result)
    return result;
  v5 = &this[-*(int *)this->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (v6 = *(unsigned __int16 *)v5[4].var0) != 0)
    v7 = &this[v6 + *(unsigned int *)this[v6].var0];
  else
    v7 = 0;
  result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v7->var0);
  if (!result)
    return result;
  v8 = &this[-*(int *)this->var0];
  v9 = *(unsigned __int16 *)v8->var0;
  if (v9 >= 7)
  {
    if (*(_WORD *)v8[6].var0)
    {
      result = 0;
      v10 = *((_QWORD *)a2 + 1);
      if (v10 < 2 || v10 - 1 < (unint64_t)this[*(unsigned __int16 *)v8[6].var0 - *(_QWORD *)a2].var0)
        return result;
    }
  }
  result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 8u);
  if (!result)
    return result;
  if (v9 < 9)
  {
    if (v9 < 7)
      goto LABEL_33;
  }
  else if (*(_WORD *)v8[8].var0)
  {
    v11 = (TrialManagedAsset *)&this[*(unsigned __int16 *)v8[8].var0
                                   + *(unsigned int *)this[*(unsigned __int16 *)v8[8].var0].var0];
    goto LABEL_18;
  }
  v11 = 0;
LABEL_18:
  if (*(_WORD *)v8[6].var0)
  {
    switch(this[*(unsigned __int16 *)v8[6].var0].var0[0])
    {
      case 1u:
        result = 0;
        v15 = *((_QWORD *)a2 + 1);
        if (v15 < 2)
          return result;
        v13 = &v11[-*(_QWORD *)a2];
        v14 = v15 - 1;
        goto LABEL_24;
      case 2u:
        if (apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v11->var0))
          break;
        return 0;
      case 3u:
      case 4u:
        result = 0;
        v12 = *((_QWORD *)a2 + 1);
        if (v12 < 9)
          return result;
        v13 = &v11[-*(_QWORD *)a2];
        v14 = v12 - 8;
LABEL_24:
        if (v14 < (unint64_t)v13)
          return result;
        break;
      case 5u:
        if (!v11 || TrialManagedAsset::Verify(v11, a2))
          break;
        return 0;
      case 6u:
        if (!v11)
          break;
        result = MobileAssetReference::Verify((MobileAssetReference *)v11, a2);
        if (result)
          break;
        return result;
      default:
        break;
    }
  }
LABEL_33:
  result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 0xAu);
  if (!result)
    return result;
  v16 = 0;
  v17 = *(int *)this->var0;
  if (*(unsigned __int16 *)this[-v17].var0 >= 0xBu)
  {
    if (!*(_WORD *)this[-v17 + 10].var0)
      goto LABEL_38;
    result = apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString(a2, this[*(unsigned __int16 *)this[-v17 + 10].var0+ *(unsigned int *)this[*(unsigned __int16 *)this[-v17 + 10].var0].var0].var0, 4uLL, 0);
    if (!result)
      return result;
    v16 = 0;
    v17 = *(int *)this->var0;
    if (*(unsigned __int16 *)this[-v17].var0 >= 0xBu)
    {
LABEL_38:
      v18 = *(unsigned __int16 *)this[-v17 + 10].var0;
      if (v18)
        v16 = (FactorMetadataKeyValue *)&this[v18 + *(unsigned int *)this[v18].var0];
      else
        v16 = 0;
    }
  }
  result = apple::aiml::flatbuffers2::Verifier::VerifyVectorOfTables<FactorMetadataKeyValue>(a2, v16);
  if (result)
  {
    v19 = &this[-*(int *)this->var0];
    v20 = *(unsigned __int16 *)v19->var0;
    if (v20 < 0xD
      || !*(_WORD *)v19[12].var0
      || (result = 0, v21 = *((_QWORD *)a2 + 1), v21 >= 5)
      && v21 - 4 >= (unint64_t)this[*(unsigned __int16 *)v19[12].var0 - *(_QWORD *)a2].var0)
    {
      result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0xEu);
      if (result)
      {
        v22 = v20 >= 0xF && *(_WORD *)v19[14].var0
            ? &this[*(unsigned __int16 *)v19[14].var0 + *(unsigned int *)this[*(unsigned __int16 *)v19[14].var0].var0]
            : 0;
        result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v22->var0);
        if (result)
        {
          result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0x10u);
          if (result)
          {
            v23 = &this[-*(int *)this->var0];
            if (*(unsigned __int16 *)v23->var0 >= 0x11u && (v24 = *(unsigned __int16 *)v23[16].var0) != 0)
              v25 = &this[v24 + *(unsigned int *)this[v24].var0];
            else
              v25 = 0;
            result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v25->var0);
            if (result)
            {
              result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0x12u);
              if (result)
              {
                v26 = &this[-*(int *)this->var0];
                if (*(unsigned __int16 *)v26->var0 >= 0x13u && (v27 = *(unsigned __int16 *)v26[18].var0) != 0)
                  v28 = &this[v27 + *(unsigned int *)this[v27].var0];
                else
                  v28 = 0;
                result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v28->var0);
                if (result)
                {
                  v29 = &this[-*(int *)this->var0];
                  if (*(unsigned __int16 *)v29->var0 < 0x15u
                    || (v30 = *(unsigned __int16 *)v29[20].var0) == 0
                    || (result = 0, v31 = *((_QWORD *)a2 + 1), v31 >= 5)
                    && v31 - 4 >= (unint64_t)this[v30 - *(_QWORD *)a2].var0)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL FactorMetadataKeyValue::Verify(FactorMetadataKeyValue *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  _BOOL8 result;
  FactorMetadataKeyValue *v5;
  uint64_t v6;
  FactorMetadataKeyValue *v7;
  FactorMetadataKeyValue *v8;
  uint64_t v9;
  FactorMetadataKeyValue *v10;

  result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (result)
  {
    result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 4u);
    if (result)
    {
      v5 = &this[-*(int *)this->var0];
      if (*(unsigned __int16 *)v5->var0 >= 5u && (v6 = *(unsigned __int16 *)v5[4].var0) != 0)
        v7 = &this[v6 + *(unsigned int *)this[v6].var0];
      else
        v7 = 0;
      result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v7->var0);
      if (result)
      {
        result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 6u);
        if (result)
        {
          v8 = &this[-*(int *)this->var0];
          if (*(unsigned __int16 *)v8->var0 >= 7u && (v9 = *(unsigned __int16 *)v8[6].var0) != 0)
            v10 = &this[v9 + *(unsigned int *)this[v9].var0];
          else
            v10 = 0;
          result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v10->var0);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL apple::aiml::flatbuffers2::Verifier::VerifyString(apple::aiml::flatbuffers2::Verifier *a1, const unsigned __int8 *a2)
{
  _BOOL8 result;
  unint64_t v4;
  unint64_t v6;

  if (!a2)
    return 1;
  v6 = 0;
  result = apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString(a1, a2, 1uLL, &v6);
  if (result)
  {
    v4 = *((_QWORD *)a1 + 1);
    return v4 >= 2 && v4 - 1 >= v6 && *(_BYTE *)(*(_QWORD *)a1 + v6) == 0;
  }
  return result;
}

BOOL apple::aiml::flatbuffers2::Table::VerifyOffsetRequired(apple::aiml::flatbuffers2::Table *this, const apple::aiml::flatbuffers2::Verifier *a2, unsigned int a3)
{
  unsigned __int16 *v3;
  uint64_t v4;

  v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  return *v3 > a3
      && (v4 = *(unsigned __int16 *)((char *)v3 + a3)) != 0
      && apple::aiml::flatbuffers2::Verifier::VerifyOffset(a2, (unint64_t)this + v4 - *(_QWORD *)a2) != 0;
}

uint64_t apple::aiml::flatbuffers2::Verifier::VerifyOffset(apple::aiml::flatbuffers2::Verifier *this, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;

  if ((a2 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v2 = *((_QWORD *)this + 1);
  if (v2 < 5 || v2 - 4 < a2)
    return 0;
  v4 = *(unsigned int *)(*(_QWORD *)this + a2);
  if ((int)v4 < 1)
    return 0;
  if (v2 - 1 >= v4 + a2)
    return v4;
  return 0;
}

BOOL apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString(apple::aiml::flatbuffers2::Verifier *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  v4 = (unint64_t)&a2[-*(_QWORD *)this];
  if ((v4 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v5 = *((_QWORD *)this + 1);
  if (v5 < 5 || v5 - 4 < v4)
    return 0;
  v7 = *(unsigned int *)a2;
  if (0x7FFFFFFF / a3 <= v7)
    return 0;
  v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    v5 = *((_QWORD *)this + 1);
  }
  v9 = v5 > v8;
  v10 = v5 - v8;
  return v9 && v10 >= v4;
}

BOOL apple::aiml::flatbuffers2::Verifier::VerifyTableStart(apple::aiml::flatbuffers2::Verifier *this, const unsigned __int8 *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;

  v2 = *(_QWORD *)this;
  v3 = (unint64_t)&a2[-*(_QWORD *)this];
  if ((v3 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v4 = *((_QWORD *)this + 1);
  v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5)
    return 0;
  v6 = *(int *)a2;
  v7 = *((_DWORD *)this + 5);
  v8 = *((_DWORD *)this + 4) + 1;
  *((_DWORD *)this + 4) = v8;
  v9 = *((_DWORD *)this + 6) + 1;
  *((_DWORD *)this + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)this + 7))
    return 0;
  v10 = v3 - v6;
  if ((v10 & 1) != 0)
  {
    v11 = 0;
    if (*((_BYTE *)this + 40) || v4 - 2 < v10)
      return v11;
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((_BYTE *)this + 40))
    return 0;
  v5 = v4 >= v12;
  v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL apple::aiml::flatbuffers2::Table::VerifyOffset(apple::aiml::flatbuffers2::Table *this, const apple::aiml::flatbuffers2::Verifier *a2, unsigned int a3)
{
  unsigned __int16 *v3;
  uint64_t v4;

  v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  return *v3 <= a3
      || (v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || apple::aiml::flatbuffers2::Verifier::VerifyOffset(a2, (unint64_t)this + v4 - *(_QWORD *)a2) != 0;
}

BOOL MobileAssetReference::Verify(MobileAssetReference *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  _BOOL8 result;
  MobileAssetReference *v5;
  uint64_t v6;
  MobileAssetReference *v7;
  MobileAssetReference *v8;
  uint64_t v9;
  MobileAssetReference *v10;
  MobileAssetReference *v11;
  uint64_t v12;
  MobileAssetReference *v13;
  MobileAssetReference *v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  MobileAssetReference *v19;

  result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (result)
  {
    result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 4u);
    if (result)
    {
      v5 = &this[-*(int *)this->var0];
      if (*(unsigned __int16 *)v5->var0 >= 5u && (v6 = *(unsigned __int16 *)v5[4].var0) != 0)
        v7 = &this[v6 + *(unsigned int *)this[v6].var0];
      else
        v7 = 0;
      result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v7->var0);
      if (result)
      {
        result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 6u);
        if (result)
        {
          v8 = &this[-*(int *)this->var0];
          if (*(unsigned __int16 *)v8->var0 >= 7u && (v9 = *(unsigned __int16 *)v8[6].var0) != 0)
            v10 = &this[v9 + *(unsigned int *)this[v9].var0];
          else
            v10 = 0;
          result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v10->var0);
          if (result)
          {
            result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 8u);
            if (result)
            {
              v11 = &this[-*(int *)this->var0];
              if (*(unsigned __int16 *)v11->var0 >= 9u && (v12 = *(unsigned __int16 *)v11[8].var0) != 0)
                v13 = &this[v12 + *(unsigned int *)this[v12].var0];
              else
                v13 = 0;
              result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v13->var0);
              if (result)
              {
                v14 = &this[-*(int *)this->var0];
                v15 = *(unsigned __int16 *)v14->var0;
                if (v15 < 0xB
                  || (!*(_WORD *)v14[10].var0
                   || (result = 0, v16 = *((_QWORD *)a2 + 1), v16 >= 2)
                   && v16 - 1 >= (unint64_t)this[*(unsigned __int16 *)v14[10].var0 - *(_QWORD *)a2].var0)
                  && (v15 < 0xD
                   || (!*(_WORD *)v14[12].var0
                    || (result = 0, v17 = *((_QWORD *)a2 + 1), v17 >= 2)
                    && v17 - 1 >= (unint64_t)this[*(unsigned __int16 *)v14[12].var0 - *(_QWORD *)a2].var0)
                   && (v15 < 0xF
                    || !*(_WORD *)v14[14].var0
                    || (result = 0, v18 = *((_QWORD *)a2 + 1), v18 >= 9)
                    && v18 - 8 >= (unint64_t)this[*(unsigned __int16 *)v14[14].var0 - *(_QWORD *)a2].var0)))
                {
                  result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0x10u);
                  if (result)
                  {
                    if (v15 >= 0x11 && *(_WORD *)v14[16].var0)
                      v19 = &this[*(unsigned __int16 *)v14[16].var0
                                + *(unsigned int *)this[*(unsigned __int16 *)v14[16].var0].var0];
                    else
                      v19 = 0;
                    result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v19->var0);
                    if (result)
                    {
                      --*((_DWORD *)a2 + 4);
                      return 1;
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
  return result;
}

id TRILogCategory_ClientFramework()
{
  if (_MergedGlobals_19 != -1)
    dispatch_once(&_MergedGlobals_19, &__block_literal_global_24);
  return (id)qword_1ECED7F50;
}

void sub_19B8A5A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8A7BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8A8EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B8A9448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8A97AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19B8AA8F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AC2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19B8AC86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  if (v12)
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  _Unwind_Resume(a1);
}

void sub_19B8ACB58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL CloudKitTreatmentRecordAsset::Verify(CloudKitTreatmentRecordAsset *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  _BOOL8 result;
  CloudKitTreatmentRecordAsset *v5;
  unsigned int v6;
  unint64_t v7;
  CloudKitTreatmentRecordAsset *v8;
  CloudKitTreatmentRecordAsset *v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (result)
  {
    v5 = &this[-*(int *)this->var0];
    v6 = *(unsigned __int16 *)v5->var0;
    if (v6 < 5
      || !*(_WORD *)v5[4].var0
      || (result = 0, v7 = *((_QWORD *)a2 + 1), v7 >= 2)
      && v7 - 1 >= (unint64_t)this[*(unsigned __int16 *)v5[4].var0 - *(_QWORD *)a2].var0)
    {
      result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 6u);
      if (result)
      {
        if (v6 >= 7 && *(_WORD *)v5[6].var0)
          v8 = &this[*(unsigned __int16 *)v5[6].var0 + *(unsigned int *)this[*(unsigned __int16 *)v5[6].var0].var0];
        else
          v8 = 0;
        result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v8->var0);
        if (result)
        {
          v9 = &this[-*(int *)this->var0];
          v10 = *(unsigned __int16 *)v9->var0;
          if (v10 < 9
            || (!*(_WORD *)v9[8].var0
             || (result = 0, v11 = *((_QWORD *)a2 + 1), v11 >= 5)
             && v11 - 4 >= (unint64_t)this[*(unsigned __int16 *)v9[8].var0 - *(_QWORD *)a2].var0)
            && (v10 < 0xB
             || (v12 = *(unsigned __int16 *)v9[10].var0) == 0
             || (result = 0, v13 = *((_QWORD *)a2 + 1), v13 >= 2)
             && v13 - 1 >= (unint64_t)this[v12 - *(_QWORD *)a2].var0))
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL TrialManagedAsset::Verify(TrialManagedAsset *this, apple::aiml::flatbuffers2::Verifier *a2)
{
  _BOOL8 result;
  TrialManagedAsset *v5;
  uint64_t v6;
  TrialManagedAsset *v7;
  TrialManagedAsset *v8;
  unsigned int v9;
  unint64_t v10;
  TrialManagedAsset *v11;
  TrialManagedAsset *v12;
  unsigned int v13;
  unint64_t v14;
  CloudKitTreatmentRecordAsset *v15;
  int v16;
  TrialManagedAsset *v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  TrialManagedAsset *v21;
  TrialManagedAsset *v22;
  uint64_t v23;
  unint64_t v24;

  result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a2, this->var0);
  if (!result)
    return result;
  result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 4u);
  if (!result)
    return result;
  v5 = &this[-*(int *)this->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (v6 = *(unsigned __int16 *)v5[4].var0) != 0)
    v7 = &this[v6 + *(unsigned int *)this[v6].var0];
  else
    v7 = 0;
  result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v7->var0);
  if (!result)
    return result;
  v8 = &this[-*(int *)this->var0];
  v9 = *(unsigned __int16 *)v8->var0;
  if (v9 >= 7)
  {
    if (*(_WORD *)v8[6].var0)
    {
      result = 0;
      v10 = *((_QWORD *)a2 + 1);
      if (v10 < 2 || v10 - 1 < (unint64_t)this[*(unsigned __int16 *)v8[6].var0 - *(_QWORD *)a2].var0)
        return result;
    }
  }
  result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 8u);
  if (!result)
    return result;
  v11 = v9 >= 9 && *(_WORD *)v8[8].var0
      ? &this[*(unsigned __int16 *)v8[8].var0 + *(unsigned int *)this[*(unsigned __int16 *)v8[8].var0].var0]
      : 0;
  result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v11->var0);
  if (!result)
    return result;
  v12 = &this[-*(int *)this->var0];
  v13 = *(unsigned __int16 *)v12->var0;
  if (v13 >= 0xB)
  {
    if (*(_WORD *)v12[10].var0)
    {
      result = 0;
      v14 = *((_QWORD *)a2 + 1);
      if (v14 < 2 || v14 - 1 < (unint64_t)this[*(unsigned __int16 *)v12[10].var0 - *(_QWORD *)a2].var0)
        return result;
    }
  }
  result = apple::aiml::flatbuffers2::Table::VerifyOffsetRequired((apple::aiml::flatbuffers2::Table *)this, a2, 0xCu);
  if (!result)
    return result;
  if (v13 < 0xD)
  {
    v15 = 0;
    if (v13 < 0xB)
      goto LABEL_31;
  }
  else if (*(_WORD *)v12[12].var0)
  {
    v15 = (CloudKitTreatmentRecordAsset *)&this[*(unsigned __int16 *)v12[12].var0
                                              + *(unsigned int *)this[*(unsigned __int16 *)v12[12].var0].var0];
  }
  else
  {
    v15 = 0;
  }
  if (*(_WORD *)v12[10].var0)
  {
    v16 = this[*(unsigned __int16 *)v12[10].var0].var0[0];
    goto LABEL_32;
  }
LABEL_31:
  v16 = 0;
LABEL_32:
  result = VerifyCloudKitAssetSource(a2, v15, v16);
  if (result)
  {
    v17 = &this[-*(int *)this->var0];
    v18 = *(unsigned __int16 *)v17->var0;
    if (v18 < 0xF
      || (!*(_WORD *)v17[14].var0
       || (result = 0, v19 = *((_QWORD *)a2 + 1), v19 >= 2)
       && v19 - 1 >= (unint64_t)this[*(unsigned __int16 *)v17[14].var0 - *(_QWORD *)a2].var0)
      && (v18 < 0x11
       || !*(_WORD *)v17[16].var0
       || (result = 0, v20 = *((_QWORD *)a2 + 1), v20 >= 9)
       && v20 - 8 >= (unint64_t)this[*(unsigned __int16 *)v17[16].var0 - *(_QWORD *)a2].var0))
    {
      result = apple::aiml::flatbuffers2::Table::VerifyOffset((apple::aiml::flatbuffers2::Table *)this, a2, 0x12u);
      if (result)
      {
        if (v18 >= 0x13 && *(_WORD *)v17[18].var0)
          v21 = &this[*(unsigned __int16 *)v17[18].var0 + *(unsigned int *)this[*(unsigned __int16 *)v17[18].var0].var0];
        else
          v21 = 0;
        result = apple::aiml::flatbuffers2::Verifier::VerifyString(a2, v21->var0);
        if (result)
        {
          v22 = &this[-*(int *)this->var0];
          if (*(unsigned __int16 *)v22->var0 < 0x15u
            || (v23 = *(unsigned __int16 *)v22[20].var0) == 0
            || (result = 0, v24 = *((_QWORD *)a2 + 1), v24 >= 2)
            && v24 - 1 >= (unint64_t)this[v23 - *(_QWORD *)a2].var0)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<FactorLevel>>::KeyCompare<char const*>(const char **a1, unsigned int *a2)
{
  int *v2;
  unsigned __int16 *v3;
  uint64_t v4;
  char *v5;

  v2 = (int *)((char *)a2 + *a2);
  v3 = (unsigned __int16 *)((char *)v2 - *v2);
  if (*v3 >= 5u && (v4 = v3[2]) != 0)
    v5 = (char *)v2 + v4 + *(unsigned int *)((char *)v2 + v4);
  else
    v5 = 0;
  return -strcmp(v5 + 4, *a1);
}

__CFString *makeNSString(NSString *a1, AFBBufRef *a2, const char *a3)
{
  NSString *v5;
  AFBBufRef *v6;
  __CFString *v7;
  uint64_t v9;
  id v10;

  v5 = a1;
  v6 = a2;
  -[AFBBufRef retainBuf](v6, "retainBuf");
  v7 = (__CFString *)CFStringCreateWithCStringNoCopy(0, a3, 0x8000100u, (CFAllocatorRef)-[AFBBufRef deallocator](v6, "deallocator"));
  if (!v7)
  {
    -[AFBBufRef releaseBuf](v6, "releaseBuf");
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to decode null-terminated string as UTF-8"), v5);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CFCEC0], v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }

  return v7;
}

void sub_19B8AD300(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL VerifyCloudKitAssetSource(apple::aiml::flatbuffers2::Verifier *a1, CloudKitTreatmentRecordAsset *this, int a3)
{
  _BOOL8 result;

  if (a3 == 2)
  {
    if (this)
    {
      result = apple::aiml::flatbuffers2::Verifier::VerifyTableStart(a1, this->var0);
      if (!(_DWORD)result)
        return result;
      --*((_DWORD *)a1 + 4);
    }
  }
  else if (a3 == 1 && this)
  {
    return CloudKitTreatmentRecordAsset::Verify(this, a1);
  }
  return 1;
}

id TRIValidateFactorPackSetId(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  void *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString<TRIFactorPackSetId> * _Nullable TRIValidateFactorPackSetId(NSString * _Nonnull __strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("TRIStrongTypingProtocols.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  }
  if ((objc_msgSend(v1, "triIsPathSafePlausibleUniqueId") & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v1;
      _os_log_error_impl(&dword_19B89C000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for a factor pack set ID: %@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

void sub_19B8AE380(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AE418(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AE4D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AE700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AE798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AE87C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AE914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AEA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_19B8AEB48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AEC2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AED4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AEF0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AEFA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AF210(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AF33C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AF45C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AF5C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AF6FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AF7C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AF858(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AF8EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AFA18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8AFAA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8B1338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B1648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B1AF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B1DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B2424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_19B8B27B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B2AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19B8B2DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B3168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B34E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B3860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B3C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B3F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19B8B40DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8B42AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

unint64_t TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor()
{
  void *v1;

  if (!atomic_load(&TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_descriptor))
  {
    v1 = (void *)objc_msgSend(MEMORY[0x1E0DC0F38], "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:", CFSTR("TRIPersistedNetworkBehavior_DiscretionaryBehavior"), "Discretionary", &TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_values, 3, TRIPersistedNetworkBehavior_DiscretionaryBehavior_IsValidValue, &unk_19B9169FC);
    while (!__ldaxr(&TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_descriptor))
        return atomic_load(&TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPersistedNetworkBehavior_DiscretionaryBehavior_EnumDescriptor_descriptor);
}

BOOL TRIPersistedNetworkBehavior_DiscretionaryBehavior_IsValidValue(int a1)
{
  return (a1 - 1) < 3;
}

unint64_t TRIPurgeabilityLevel_EnumDescriptor()
{
  void *v1;

  if (!atomic_load(&TRIPurgeabilityLevel_EnumDescriptor_descriptor))
  {
    v1 = (void *)objc_msgSend(MEMORY[0x1E0DC0F38], "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPurgeabilityLevel"), "LowDisk", &TRIPurgeabilityLevel_EnumDescriptor_values, 4, TRIPurgeabilityLevel_IsValidValue);
    while (!__ldaxr(&TRIPurgeabilityLevel_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPurgeabilityLevel_EnumDescriptor_descriptor))
        return atomic_load(&TRIPurgeabilityLevel_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPurgeabilityLevel_EnumDescriptor_descriptor);
}

BOOL TRIPurgeabilityLevel_IsValidValue(unsigned int a1)
{
  return a1 < 4;
}

void sub_19B8B6CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_19B8B7138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_19B8B761C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_19B8B8AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_19B8BAAB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id *v11;
  id *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  if (a2 == 1)
  {
    v14 = objc_begin_catch(exception_object);
    v15 = *MEMORY[0x1E0DC1018];
    a10 = *MEMORY[0x1E0DC1010];
    a11 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &a10, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "containsObject:", v17);

    if (v18)
    {
      if (!*v12)
      {
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, 0);
        objc_msgSend(*(id *)(v13 + 8), "streamError");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21)
          v23 = (void *)v21;
        else
          v23 = v20;
        objc_storeStrong(v12, v23);

      }
      if (v11)
        objc_storeStrong(v11, *v12);

      objc_end_catch();
      JUMPOUT(0x19B8BAA18);
    }
    objc_exception_throw(objc_retainAutorelease(v14));
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8BAFB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  if (a2 == 1)
  {
    v13 = objc_begin_catch(exception_object);
    v14 = *MEMORY[0x1E0DC1018];
    a10 = *MEMORY[0x1E0DC1010];
    a11 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &a10, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "containsObject:", v16);

    if (v17)
    {
      v18 = (id *)(v12 + 24);
      if (!*(_QWORD *)(v12 + 24))
      {
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, 0);
        objc_msgSend(*(id *)(v12 + 8), "streamError");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21)
          v23 = (void *)v21;
        else
          v23 = v20;
        objc_storeStrong(v18, v23);

      }
      if (v11)
        objc_storeStrong(v11, *v18);

      objc_end_catch();
      JUMPOUT(0x19B8BAF80);
    }
    objc_exception_throw(objc_retainAutorelease(v13));
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8BB294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *TRIFBCloudKitContainerStringForValue(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E3BFEF50[(char)a1];
}

uint64_t TRIFBCloudKitContainerIsValidValue(int a1)
{
  _BOOL4 v1;

  v1 = a1 == 1 || a1 == 0;
  return a1 == 2 || v1;
}

__CFString *TRIFBCloudKitAssetSourceStringForValue(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E3BFEF68[(char)a1];
}

uint64_t TRIFBCloudKitAssetSourceIsValidValue(int a1)
{
  _BOOL4 v1;

  v1 = a1 == 1 || a1 == 0;
  return a1 == 2 || v1;
}

const __CFString *TRIFBFilesystemAssetTypeStringForValue(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("TRIFBFilesystemAssetType_FILE");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("TRIFBFilesystemAssetType_DIR");
}

BOOL TRIFBFilesystemAssetTypeIsValidValue(unsigned int a1)
{
  return a1 < 2;
}

__CFString *TRIFBLevelStringForValue(unsigned int a1)
{
  if (a1 > 6)
    return 0;
  else
    return off_1E3BFEF80[(char)a1];
}

uint64_t TRIFBLevelIsValidValue(int a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

__CFString *TRIFBSourceStringForValue(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E3BFEFB8[(char)a1];
}

uint64_t TRIFBSourceIsValidValue(int a1)
{
  _BOOL4 v1;

  v1 = a1 == 1 || a1 == 0;
  return a1 == 2 || v1;
}

void sub_19B8BD2F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8BD410(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8BD670(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8BD794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8BD930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8BD9FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8BDB3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(apple::aiml::flatbuffers2::FlatBufferBuilder *this, int a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int16 v8;
  unsigned __int16 *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  unsigned int *v21;
  _DWORD *v22;

  if (!*((_BYTE *)this + 70))
    __assert_rtn("EndTable", "flatbuffers.h", 1450, "nested");
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align(this, 4uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space(this, 4uLL);
  v4 = *((_QWORD *)this + 6);
  *(_DWORD *)(v4 - 4) = 0;
  v4 -= 4;
  *((_QWORD *)this + 6) = v4;
  v5 = *((_QWORD *)this + 4) - v4 + *((_QWORD *)this + 5);
  if ((unsigned __int16)(*((_WORD *)this + 34) + 2) <= 4u)
    v6 = 4;
  else
    v6 = (unsigned __int16)(*((_WORD *)this + 34) + 2);
  *((_WORD *)this + 34) = v6;
  apple::aiml::flatbuffers2::vector_downward::ensure_space(this, v6);
  v7 = (void *)(*((_QWORD *)this + 6) - v6);
  *((_QWORD *)this + 6) = v7;
  bzero(v7, v6);
  v8 = v5 - a2;
  if ((v5 - a2) >= 0x10000)
    __assert_rtn("EndTable", "flatbuffers.h", 1465, "table_object_size < 0x10000");
  v9 = (unsigned __int16 *)*((_QWORD *)this + 6);
  if (!v9)
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  v9[1] = v8;
  *v9 = *((_WORD *)this + 34);
  v10 = *((_QWORD *)this + 7);
  if (!v10)
    __assert_rtn("scratch_end", "flatbuffers.h", 1026, "scratch_");
  v11 = *((unsigned int *)this + 16);
  v12 = v10 - 8 * v11;
  if ((_DWORD)v11)
  {
    v13 = (int *)(v10 - 8 * v11);
    do
    {
      v14 = *((unsigned __int16 *)v13 + 2);
      if (*(unsigned __int16 *)((char *)v9 + v14))
        __assert_rtn("EndTable", "flatbuffers.h", 1476, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
      v15 = *v13;
      v13 += 2;
      *(unsigned __int16 *)((char *)v9 + v14) = v5 - v15;
    }
    while ((unint64_t)v13 < v10);
  }
  *((_QWORD *)this + 7) = v12;
  *((_DWORD *)this + 16) = 0;
  *((_WORD *)this + 34) = 0;
  v17 = *((_QWORD *)this + 4);
  v16 = *((_QWORD *)this + 5);
  LODWORD(v18) = v17 - (_DWORD)v9 + v16;
  if (*((_BYTE *)this + 81))
  {
    if (!v16)
      __assert_rtn("scratch_data", "flatbuffers.h", 1021, "buf_");
    if (v16 < v12)
    {
      v19 = *v9;
      v20 = v16 + v17;
      v21 = (unsigned int *)*((_QWORD *)this + 5);
      while (1)
      {
        v18 = *v21;
        if ((_DWORD)v19 == *(unsigned __int16 *)(v20 - v18) && !memcmp((const void *)(v20 - v18), v9, v19))
          break;
        if ((unint64_t)++v21 >= v12)
        {
          LODWORD(v18) = v17 - (_DWORD)v9 + v16;
          goto LABEL_21;
        }
      }
      v9 = (unsigned __int16 *)((char *)v9 + (v17 - (_DWORD)v9 + v16 - v5));
      *((_QWORD *)this + 6) = v9;
    }
  }
LABEL_21:
  if ((_DWORD)v18 == (_DWORD)v17 + (_DWORD)v16 - (_DWORD)v9)
  {
    apple::aiml::flatbuffers2::vector_downward::ensure_space(this, 4uLL);
    v22 = (_DWORD *)*((_QWORD *)this + 7);
    *v22 = v18;
    *((_QWORD *)this + 7) = v22 + 1;
    v17 = *((_QWORD *)this + 4);
    v16 = *((_QWORD *)this + 5);
  }
  *(_DWORD *)(v16 + v17 - v5) = v18 - v5;
  *((_BYTE *)this + 70) = 0;
  return v5;
}

void sub_19B8BDEEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8BDEBCLL);
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_19B8BE108(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8BE2C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8BE294);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8BE460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8BE430);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8BE888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8BEA8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::Offset<void>>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, unint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v18;

  if (a2)
  {
    if (a2 >> 62)
      std::vector<apple::aiml::flatbuffers2::Offset<void>>::__throw_length_error[abi:ne180100]();
    v6 = (char *)operator new(4 * a2);
    bzero(v6, 4 * a2);
    v7 = 0;
    v8 = &v6[4 * a2];
    do
    {
      v18 = v7;
      v9 = *(_QWORD *)(a3 + 24);
      if (!v9)
        std::__throw_bad_function_call[abi:ne180100]();
      *(_DWORD *)&v6[4 * v7++] = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v9 + 48))(v9, &v18);
    }
    while (a2 != v7);
  }
  else
  {
    v8 = 0;
    v6 = 0;
  }
  v10 = v8 - v6;
  if (v8 == v6)
    v11 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<void>,std::allocator<apple::aiml::flatbuffers2::Offset<void>>>(std::vector<apple::aiml::flatbuffers2::Offset<void>> const&)::t;
  else
    v11 = v6;
  v12 = v10 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, v10 >> 2, 4uLL);
  if (v6 != v8)
  {
    v13 = v11 - 4;
    v14 = v12;
    do
    {
      v15 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(a1, *(_DWORD *)&v13[4 * v14]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a1, v15);
      --v14;
    }
    while (v14);
  }
  v16 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, v12);
  if (v6)
    operator delete(v6);
  return v16;
}

void sub_19B8BED14(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_19B8BEF80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double apple::aiml::flatbuffers2::FlatBufferBuilder::Release(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  if (!*(_BYTE *)(a2 + 71))
    __assert_rtn("Finished", "flatbuffers.h", 1319, "finished");
  v2 = *(unsigned __int8 *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)this = *(_QWORD *)a2;
  *((_BYTE *)this + 8) = v2;
  *((_QWORD *)this + 2) = v4;
  *((_QWORD *)this + 3) = v3;
  *((_QWORD *)this + 4) = v5;
  *((_QWORD *)this + 5) = (v3 + v4 - v5);
  if (v2)
  {
    *(_QWORD *)a2 = 0;
    *(_BYTE *)(a2 + 8) = 0;
  }
  result = 0.0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  return result;
}

void sub_19B8BF240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::GetBufferPointer(apple::aiml::flatbuffers2::FlatBufferBuilder *this)
{
  uint64_t result;

  if (!*((_BYTE *)this + 71))
    __assert_rtn("Finished", "flatbuffers.h", 1319, "finished");
  result = *((_QWORD *)this + 6);
  if (!result)
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  return result;
}

void sub_19B8BF394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8BF4EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8BF58C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8BF730(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8BF804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8BFA80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8BFC54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C0000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C0248(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C0378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C0468(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C0588(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C06C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C0800(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C0BE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8C0E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8C0FD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C111C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C13B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8C1570(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C172C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8C16FCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8C1938(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C1B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C1DC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C1F8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8C1F5CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8C2128(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8C20F8);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8C2334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C24F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8C24C0);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8C29DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C2C04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C2FB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C31F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C32C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C33BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C3480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C353C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C3648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C3774(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C3834(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C3954(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C3A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C3B00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C3C20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C3D0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C3DCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C3EEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C40B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C41BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C4554(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8C4708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8C48A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C4B0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C4D28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8C4EF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C511C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C5348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C5504(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8C54D4);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8C56A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8C5670);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8C583C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8C580CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8C5A48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C6014(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C6260(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C660C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C6854(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C6924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C69E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C6AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C6BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C6CE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C6DA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C6EC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C6FB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C7070(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C7190(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C73DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8C747C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8C7508(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C76A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C77F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C7930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8C7AE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C7D0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C8218(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C8588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_19B8C87DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8C8A3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C8C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8C8D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C8E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8C8EEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C900C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C9144(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C91EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C934C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C9444(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C959C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C96D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C9780(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C98B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C9958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C9B84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C9D70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C9EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8C9FF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CA104(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CA71C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8CA884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8CAA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8CABCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CAD70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CB158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8CB358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CB598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CB7E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CBA30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CBC7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CBEC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CC114(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CC360(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CC51C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8CC4ECLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8CC728(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CC954(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CCB80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CCD3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(exception_object);
    a10 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12));
    a11 = (uint64_t)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 3, v14);
    objc_msgSend(*(id *)(v11 + 8), "setError:", v16);

    __cxa_end_catch();
    JUMPOUT(0x19B8CCD0CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B8CD2E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CD67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__538(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__539(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_19B8CD90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8CDB6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CDDB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CDE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CDF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8CE8F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

FastFactorLevels *FastFactorLevels::source_as_treatment_id(FastFactorLevels *this)
{
  FastFactorLevels *v1;
  unsigned int v2;
  BOOL v3;
  uint64_t v4;

  v1 = &this[-*(int *)this->var0];
  v2 = *(unsigned __int16 *)v1->var0;
  if (v2 >= 7
    && *(_WORD *)v1[6].var0
    && (v2 >= 9 ? (v3 = this[*(unsigned __int16 *)v1[6].var0].var0[0] == 1) : (v3 = 0),
        v3 && (v4 = *(unsigned __int16 *)v1[8].var0) != 0))
  {
    return &this[v4 + *(unsigned int *)this[v4].var0];
  }
  else
  {
    return 0;
  }
}

void sub_19B8CEA38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CEB90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CEC80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CEDD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CEEA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CEFC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CF144(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CF58C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8CF698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8CF764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19B8CF834(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8CFA64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19B8CFC40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8CFE80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D00CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D0304(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D0544(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D0B10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D0D5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D1108(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D1350(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D1420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8D14E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8D15A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8D1664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8D1728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19B8D1844(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D18A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D1AC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D1B7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D1DB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D1F24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D21C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedBool>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, a2, 1uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space(a1, a2);
  v6 = *((_QWORD *)a1 + 6) - a2;
  *((_QWORD *)a1 + 6) = v6;
  if (a2)
  {
    v7 = 0;
    do
    {
      v8 = *(_QWORD *)(a3 + 24);
      v10 = v6 + v7;
      v11 = v7;
      if (!v8)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v8 + 48))(v8, &v11, &v10);
      ++v7;
    }
    while (a2 != v7);
  }
  return apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, a2);
}

void sub_19B8D2544(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D2788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D27EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D29FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D2AB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D2CE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D2E50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D30F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedInt64>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v6 = 8 * a2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, a2 & 0x1FFFFFFFFFFFFFFFLL, 8uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space(a1, v6);
  v7 = *((_QWORD *)a1 + 6) - 8 * a2;
  *((_QWORD *)a1 + 6) = v7;
  if (a2)
  {
    v8 = 0;
    do
    {
      v9 = *(_QWORD *)(a3 + 24);
      v11 = v7;
      v12 = v8;
      if (!v9)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v9 + 48))(v9, &v12, &v11);
      v7 += 8;
      ++v8;
    }
    while (a2 != v8);
  }
  return apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, a2);
}

void sub_19B8D3478(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D36C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D3730(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D3940(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D39F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D3C2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D3D94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D4038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19B8D4314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested(uint64_t this)
{
  if (*(_BYTE *)(this + 70))
    __assert_rtn("NotNested", "flatbuffers.h", 1432, "!nested");
  if (*(_DWORD *)(this + 64))
    __assert_rtn("NotNested", "flatbuffers.h", 1434, "!num_field_loc");
  return this;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::Align(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unint64_t a2)
{
  if (*((_QWORD *)this + 9) < a2)
    *((_QWORD *)this + 9) = a2;
  return apple::aiml::flatbuffers2::vector_downward::fill(this, (a2 - 1) & -(uint64_t)(*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10)));
}

unint64_t apple::aiml::flatbuffers2::vector_downward::fill(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unint64_t result;
  uint64_t v5;

  result = apple::aiml::flatbuffers2::vector_downward::ensure_space(this, a2);
  *((_QWORD *)this + 6) -= a2;
  if (a2)
  {
    v5 = 0;
    do
      *(_BYTE *)(*((_QWORD *)this + 6) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t apple::aiml::flatbuffers2::vector_downward::ensure_space(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned __int8 *v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v15)(apple::aiml::flatbuffers2::DefaultAllocator *__hidden);

  v2 = *((_QWORD *)this + 6);
  v3 = *((_QWORD *)this + 7);
  if (v2 < v3 || (v6 = (unsigned __int8 *)*((_QWORD *)this + 5), v7 = v3 - (_DWORD)v6, v3 < (unint64_t)v6))
    __assert_rtn("ensure_space", "flatbuffers.h", 988, "cur_ >= scratch_ && scratch_ >= buf_");
  v8 = *((_QWORD *)this + 4);
  if (v2 - v3 < a2)
  {
    v9 = v8 - v2 + (_DWORD)v6;
    if (v8)
      v10 = v8 >> 1;
    else
      v10 = *((_QWORD *)this + 2);
    if (v10 <= a2)
      v10 = a2;
    v11 = (v8 + *((_QWORD *)this + 3) + v10 - 1) & -*((_QWORD *)this + 3);
    *((_QWORD *)this + 4) = v11;
    v12 = *(_QWORD *)this;
    if (v6)
    {
      if (v12)
      {
        v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 32))(v12);
      }
      else
      {
        v15 = &off_1E3BFDEB8;
        v13 = (uint64_t)apple::aiml::flatbuffers2::Allocator::reallocate_downward((apple::aiml::flatbuffers2::Allocator *)&v15, v6, v8, v11, v9, (v3 - (_DWORD)v6));
      }
    }
    else if (v12)
    {
      v13 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v12 + 16))(v12, v11);
    }
    else
    {
      v13 = operator new[]();
    }
    LODWORD(v6) = v13;
    v8 = *((_QWORD *)this + 4);
    v2 = v13 + v8 - v9;
    *((_QWORD *)this + 5) = v13;
    *((_QWORD *)this + 6) = v2;
    *((_QWORD *)this + 7) = v13 + v7;
  }
  if ((v8 - v2 + (_DWORD)v6) >= 0x7FFFFFFF)
    __assert_rtn("ensure_space", "flatbuffers.h", 992, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
  return a2;
}

char *apple::aiml::flatbuffers2::Allocator::reallocate_downward(apple::aiml::flatbuffers2::Allocator *this, unsigned __int8 *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  char *v12;

  if (a4 <= a3)
    __assert_rtn("reallocate_downward", "flatbuffers.h", 687, "new_size > old_size");
  v12 = (char *)(*(uint64_t (**)(apple::aiml::flatbuffers2::Allocator *, unint64_t))(*(_QWORD *)this + 16))(this, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(apple::aiml::flatbuffers2::Allocator *, unsigned __int8 *, unint64_t))(*(_QWORD *)this + 24))(this, a2, a3);
  return v12;
}

void apple::aiml::flatbuffers2::DefaultAllocator::~DefaultAllocator(apple::aiml::flatbuffers2::DefaultAllocator *this)
{
  JUMPOUT(0x1A1AC6820);
}

uint64_t apple::aiml::flatbuffers2::DefaultAllocator::allocate(apple::aiml::flatbuffers2::DefaultAllocator *this)
{
  return operator new[]();
}

void apple::aiml::flatbuffers2::DefaultAllocator::deallocate(apple::aiml::flatbuffers2::DefaultAllocator *this, unsigned __int8 *a2)
{
  if (a2)
    JUMPOUT(0x1A1AC6808);
}

apple::aiml::flatbuffers2::vector_downward *apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(apple::aiml::flatbuffers2::vector_downward *this, uint64_t a2, int a3)
{
  char v3;
  apple::aiml::flatbuffers2::vector_downward *v5;
  _BYTE *v6;
  uint64_t v7;
  unsigned int v8;

  v3 = a3;
  v5 = this;
  if (a3 || *((_BYTE *)this + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align(this, 1uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v5, 1uLL);
    v6 = (_BYTE *)(*((_QWORD *)v5 + 6) - 1);
    *((_QWORD *)v5 + 6) = v6;
    *v6 = v3;
    v7 = (*((_DWORD *)v5 + 8) - *((_DWORD *)v5 + 12) + *((_DWORD *)v5 + 10));
    this = (apple::aiml::flatbuffers2::vector_downward *)apple::aiml::flatbuffers2::vector_downward::ensure_space(v5, 8uLL);
    **((_QWORD **)v5 + 7) = v7 | (a2 << 32);
    *((_QWORD *)v5 + 7) += 8;
    ++*((_DWORD *)v5 + 16);
    v8 = *((unsigned __int16 *)v5 + 34);
    if (v8 <= a2)
      LOWORD(v8) = a2;
    *((_WORD *)v5 + 34) = v8;
  }
  return this;
}

apple::aiml::flatbuffers2::FlatBufferBuilder *apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(apple::aiml::flatbuffers2::FlatBufferBuilder *result, uint64_t a2, unsigned int a3)
{
  unint64_t v4;
  int v5;

  if (a3)
  {
    v4 = (unint64_t)result;
    v5 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(result, a3);
    return (apple::aiml::flatbuffers2::FlatBufferBuilder *)apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(v4, a2, v5);
  }
  return result;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(unint64_t result, uint64_t a2, int a3)
{
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;

  v4 = result;
  if (a3 || *(_BYTE *)(result + 80))
  {
    v5 = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>(result, a3);
    result = apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)v4, 8uLL);
    **(_QWORD **)(v4 + 56) = v5 | (unint64_t)(a2 << 32);
    *(_QWORD *)(v4 + 56) += 8;
    ++*(_DWORD *)(v4 + 64);
    v6 = *(unsigned __int16 *)(v4 + 68);
    if (v6 <= a2)
      LOWORD(v6) = a2;
    *(_WORD *)(v4 + 68) = v6;
  }
  return result;
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unsigned int a2)
{
  unsigned int v4;
  BOOL v5;
  unsigned int v6;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align(this, 4uLL);
  if (!a2
    || (v4 = *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10), v5 = v4 >= a2, v6 = v4 - a2, !v5))
  {
    __assert_rtn("ReferTo", "flatbuffers.h", 1419, "off && off <= GetSize()");
  }
  return v6 + 4;
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>(uint64_t a1, int a2)
{
  uint64_t v4;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 4uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 4uLL);
  v4 = *(_QWORD *)(a1 + 48);
  *(_DWORD *)(v4 - 4) = a2;
  v4 -= 4;
  *(_QWORD *)(a1 + 48) = v4;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

void apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(apple::aiml::flatbuffers2::DetachedBuffer *this)
{
  uint64_t v2;
  _OWORD *v3;
  uint64_t v4;

  v3 = (_OWORD *)((char *)this + 16);
  v2 = *((_QWORD *)this + 2);
  if (v2)
  {
    v4 = *(_QWORD *)this;
    if (*(_QWORD *)this)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
    else
      MEMORY[0x1A1AC6808](v2, 0x1000C8077774924);
  }
  if (*((_BYTE *)this + 8) && *(_QWORD *)this)
    (*(void (**)(_QWORD))(**(_QWORD **)this + 8))(*(_QWORD *)this);
  *(_QWORD *)this = 0;
  *((_BYTE *)this + 8) = 0;
  *v3 = 0u;
  v3[1] = 0u;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  unsigned int v9;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 8uLL);
  apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 8uLL);
  v6 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(v6 - 8) = a3;
  v6 -= 8;
  *(_QWORD *)(a1 + 48) = v6;
  v7 = (*(_DWORD *)(a1 + 32) - v6 + *(_DWORD *)(a1 + 40));
  result = apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 8uLL);
  **(_QWORD **)(a1 + 56) = v7 | (a2 << 32);
  *(_QWORD *)(a1 + 56) += 8;
  ++*(_DWORD *)(a1 + 64);
  v9 = *(unsigned __int16 *)(a1 + 68);
  if (v9 <= a2)
    LOWORD(v9) = a2;
  *(_WORD *)(a1 + 68) = v9;
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *,false>(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6;
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  FactorMetadataKeyValue *v23;
  uint64_t v24;
  uint64_t v25;
  const FactorMetadataKeyValue *v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int *v38;
  BOOL v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int *v52;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int *v61;
  int64_t v62;
  int64_t v63;
  int64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int *v67;
  unsigned int *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL4 v74;
  unsigned int *v75;
  uint64_t v76;
  const FactorMetadataKeyValue *v77;
  uint64_t v78;
  const FactorMetadataKeyValue *v79;
  int64_t v80;
  uint64_t v81;
  _BOOL4 v82;
  uint64_t v83;
  unsigned int *v84;
  unsigned int *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  unsigned int *v98;
  uint64_t v99;
  unint64_t v100;
  unsigned int *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int *v109;
  unsigned int *v110;
  unsigned int *v111;
  unint64_t v112;
  uint64_t v113;
  unsigned int *v114;
  uint64_t v115;
  unsigned int v116;
  int64_t v118;
  unsigned int *v120;
  unsigned int *v121;
  unsigned int *v122;

  v6 = a3;
  v8 = (unsigned int *)result;
LABEL_2:
  v114 = a2 - 1;
  v110 = a2 - 3;
  v111 = a2 - 2;
  v9 = v8;
  v120 = a2;
  while (2)
  {
    v8 = v9;
    v10 = (char *)a2 - (char *)v9;
    v11 = a2 - v9;
    switch(v11)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v49 = *(a2 - 1);
        v50 = *(_QWORD *)(*(_QWORD *)v6 + 40) + *(_QWORD *)(*(_QWORD *)v6 + 32);
        v51 = *v8;
        result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v50 - v49), (const FactorMetadataKeyValue *)(v50 - v51));
        if ((_DWORD)result)
        {
          *v8 = v49;
          *(a2 - 1) = v51;
        }
        return result;
      case 3:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v8 + 1, v114, *(_QWORD *)(*(_QWORD *)v6 + 32), *(_QWORD *)(*(_QWORD *)v6 + 40));
      case 4:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v8 + 1, v8 + 2, v114, v6);
      case 5:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v8 + 1, v8 + 2, v8 + 3, v114, v6);
      default:
        v122 = v8;
        if (v10 <= 95)
        {
          v52 = v8 + 1;
          v54 = v8 == a2 || v52 == a2;
          if ((a5 & 1) != 0)
          {
            if (!v54)
            {
              v55 = 0;
              v56 = *(_QWORD *)(*(_QWORD *)v6 + 40) + *(_QWORD *)(*(_QWORD *)v6 + 32);
              v57 = v8;
              do
              {
                v59 = *v57;
                v58 = v57[1];
                v57 = v52;
                result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v56 - v58), (const FactorMetadataKeyValue *)(v56 - v59));
                if ((_DWORD)result)
                {
                  v60 = v55;
                  while (1)
                  {
                    *(unsigned int *)((char *)v122 + v60 + 4) = v59;
                    if (!v60)
                      break;
                    v59 = *(unsigned int *)((char *)v122 + v60 - 4);
                    result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v56 - v58), (const FactorMetadataKeyValue *)(v56 - v59));
                    v60 -= 4;
                    if ((result & 1) == 0)
                    {
                      v61 = (unsigned int *)((char *)v122 + v60 + 4);
                      goto LABEL_77;
                    }
                  }
                  v61 = v122;
LABEL_77:
                  *v61 = v58;
                }
                v52 = v57 + 1;
                v55 += 4;
              }
              while (v57 + 1 != a2);
            }
          }
          else if (!v54)
          {
            v106 = *(_QWORD *)(*(_QWORD *)v6 + 40) + *(_QWORD *)(*(_QWORD *)v6 + 32);
            do
            {
              v108 = *v8;
              v107 = v8[1];
              v8 = v52;
              result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v106 - v107), (const FactorMetadataKeyValue *)(v106 - v108));
              if ((_DWORD)result)
              {
                v109 = v8;
                do
                {
                  *v109 = v108;
                  v108 = *(v109 - 2);
                  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v106 - v107), (const FactorMetadataKeyValue *)(v106 - v108));
                  --v109;
                }
                while ((result & 1) != 0);
                *v109 = v107;
              }
              v52 = v8 + 1;
            }
            while (v8 + 1 != a2);
          }
          return result;
        }
        if (!a4)
        {
          if (v8 != a2)
          {
            v112 = v10;
            v113 = v11;
            v62 = (unint64_t)(v11 - 2) >> 1;
            v63 = v62;
            do
            {
              v64 = v63;
              if (v62 >= v63)
              {
                v65 = *(_QWORD *)a3;
                v118 = v64;
                v66 = (2 * v64) | 1;
                v67 = v122;
                v68 = &v122[v66];
                v69 = 2 * v64 + 2;
                if (v69 >= v11)
                {
                  LODWORD(v73) = *v68;
                  v72 = *(_QWORD *)(v65 + 32);
                  v71 = *(_QWORD *)(v65 + 40);
                }
                else
                {
                  v70 = *v68;
                  v72 = *(_QWORD *)(v65 + 32);
                  v71 = *(_QWORD *)(v65 + 40);
                  v73 = v68[1];
                  v74 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v71 + v72 - v70), (const FactorMetadataKeyValue *)(v71 + v72 - v73));
                  if (v74)
                    ++v68;
                  else
                    LODWORD(v73) = v70;
                  v67 = v122;
                  if (v74)
                    v66 = v69;
                }
                v64 = v118;
                v75 = &v67[v118];
                v76 = v71 + v72;
                v115 = *v75;
                v77 = (const FactorMetadataKeyValue *)(v76 - v115);
                result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v76 - v73), (const FactorMetadataKeyValue *)(v76 - v115));
                if ((result & 1) == 0)
                {
                  do
                  {
                    *v75 = v73;
                    v75 = v68;
                    if (v62 < v66)
                      break;
                    v78 = (2 * v66) | 1;
                    v68 = &v122[v78];
                    v66 = 2 * v66 + 2;
                    if (v66 >= v11)
                    {
                      LODWORD(v73) = *v68;
                      v66 = v78;
                    }
                    else
                    {
                      v73 = *v68;
                      v79 = v77;
                      v80 = v62;
                      v81 = v68[1];
                      v82 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v76 - v73), (const FactorMetadataKeyValue *)(v76 - v81));
                      if (v82)
                        LODWORD(v73) = v81;
                      v62 = v80;
                      v77 = v79;
                      v11 = v113;
                      if (v82)
                        ++v68;
                      else
                        v66 = v78;
                    }
                    result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v76 - v73), v77);
                  }
                  while (!(_DWORD)result);
                  v64 = v118;
                  *v75 = v115;
                }
              }
              v63 = v64 - 1;
            }
            while (v64);
            v83 = v112 >> 2;
            v84 = v120;
            v85 = v122;
            v86 = (uint64_t *)a3;
            do
            {
              v121 = v84;
              v87 = 0;
              v116 = *v85;
              v88 = *v86;
              v89 = v83 - 2;
              if (v83 < 2)
                v89 = v83 - 1;
              v90 = v89 >> 1;
              do
              {
                v91 = &v85[v87 + 1];
                v92 = (2 * v87) | 1;
                v93 = 2 * v87 + 2;
                if (v93 >= v83)
                {
                  v97 = *v91;
                  v87 = (2 * v87) | 1;
                }
                else
                {
                  v94 = *v91;
                  v95 = *(_QWORD *)(v88 + 40) + *(_QWORD *)(v88 + 32);
                  v96 = v91[1];
                  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v95 - v94), (const FactorMetadataKeyValue *)(v95 - v96));
                  if ((_DWORD)result)
                    v97 = v96;
                  else
                    v97 = v94;
                  if ((_DWORD)result)
                  {
                    ++v91;
                    v87 = v93;
                  }
                  else
                  {
                    v87 = v92;
                  }
                }
                *v85 = v97;
                v85 = v91;
              }
              while (v87 <= v90);
              v98 = v121 - 1;
              if (v91 == v121 - 1)
              {
                v84 = v121 - 1;
                *v91 = v116;
              }
              else
              {
                *v91 = *v98;
                v84 = v121 - 1;
                *v98 = v116;
                v99 = (char *)v91 - (char *)v122 + 4;
                if (v99 >= 5)
                {
                  v100 = (((unint64_t)v99 >> 2) - 2) >> 1;
                  v101 = &v122[v100];
                  v102 = *v101;
                  v103 = *(_QWORD *)(*(_QWORD *)a3 + 40) + *(_QWORD *)(*(_QWORD *)a3 + 32);
                  v104 = *v91;
                  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v103 - v102), (const FactorMetadataKeyValue *)(v103 - v104));
                  if ((_DWORD)result)
                  {
                    do
                    {
                      *v91 = v102;
                      v91 = v101;
                      if (!v100)
                        break;
                      v100 = (v100 - 1) >> 1;
                      v101 = &v122[v100];
                      v102 = *v101;
                      result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v103 - v102), (const FactorMetadataKeyValue *)(v103 - v104));
                    }
                    while ((result & 1) != 0);
                    *v91 = v104;
                  }
                }
              }
              v105 = v83-- <= 2;
              v86 = (uint64_t *)a3;
              v85 = v122;
            }
            while (!v105);
          }
          return result;
        }
        v12 = (unint64_t)v11 >> 1;
        v13 = &v8[(unint64_t)v11 >> 1];
        v14 = *(_QWORD *)(*(_QWORD *)v6 + 32);
        v15 = *(_QWORD *)(*(_QWORD *)v6 + 40);
        if ((unint64_t)v10 < 0x201)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v13, v8, v114, v14, v15);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v13, v114, v14, v15);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8 + 1, v13 - 1, v111, *(_QWORD *)(*(_QWORD *)v6 + 32), *(_QWORD *)(*(_QWORD *)v6 + 40));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8 + 2, &v8[v12 + 1], v110, *(_QWORD *)(*(_QWORD *)v6 + 32), *(_QWORD *)(*(_QWORD *)v6 + 40));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v13 - 1, v13, &v8[v12 + 1], *(_QWORD *)(*(_QWORD *)v6 + 32), *(_QWORD *)(*(_QWORD *)v6 + 40));
          v16 = *v8;
          *v8 = *v13;
          *v13 = v16;
        }
        --a4;
        v17 = *(_QWORD *)v6;
        v18 = *v8;
        if ((a5 & 1) == 0)
        {
          v21 = *(_QWORD *)(v17 + 32);
          v20 = *(_QWORD *)(v17 + 40);
          v22 = v20 + v21;
          v23 = (FactorMetadataKeyValue *)(v20 + v21 - v18);
          if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v20 + v21 - *(v8 - 1)), v23))
          {
            v19 = a4;
            goto LABEL_13;
          }
          result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v20 + v21 - v18), (const FactorMetadataKeyValue *)(v22 - *v114));
          if ((result & 1) != 0)
          {
            v9 = v8;
            do
            {
              v40 = v9[1];
              ++v9;
              result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v20 + v21 - v18), (const FactorMetadataKeyValue *)(v22 - v40));
            }
            while ((result & 1) == 0);
          }
          else
          {
            v41 = v8 + 1;
            do
            {
              v9 = v41;
              if (v41 >= v120)
                break;
              ++v41;
              result = FactorMetadataKeyValue::KeyCompareLessThan(v23, (const FactorMetadataKeyValue *)(v22 - *v9));
            }
            while (!(_DWORD)result);
          }
          v42 = v120;
          if (v9 < v120)
          {
            v42 = v120;
            do
            {
              v43 = *--v42;
              result = FactorMetadataKeyValue::KeyCompareLessThan(v23, (const FactorMetadataKeyValue *)(v22 - v43));
            }
            while ((result & 1) != 0);
          }
          if (v9 < v42)
          {
            v44 = *v9;
            v45 = *v42;
            do
            {
              *v9 = v45;
              *v42 = v44;
              do
              {
                v46 = v9[1];
                ++v9;
                v44 = v46;
              }
              while (!FactorMetadataKeyValue::KeyCompareLessThan(v23, (const FactorMetadataKeyValue *)(v22 - v46)));
              do
              {
                v47 = *--v42;
                v45 = v47;
                result = FactorMetadataKeyValue::KeyCompareLessThan(v23, (const FactorMetadataKeyValue *)(v22 - v47));
              }
              while ((result & 1) != 0);
            }
            while (v9 < v42);
          }
          v48 = v9 - 1;
          if (v9 - 1 != v8)
            *v8 = *v48;
          a5 = 0;
          *v48 = v18;
          v6 = a3;
          a2 = v120;
          continue;
        }
        v19 = a4;
        v21 = *(_QWORD *)(v17 + 32);
        v20 = *(_QWORD *)(v17 + 40);
LABEL_13:
        v24 = 0;
        v25 = v20 + v21;
        v26 = (const FactorMetadataKeyValue *)(v20 + v21 - v18);
        do
          v27 = v8[++v24];
        while (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v27), v26));
        v28 = &v8[v24];
        v29 = v120;
        if (v24 == 1)
        {
          v29 = v120;
          do
          {
            if (v28 >= v29)
              break;
            v31 = *--v29;
          }
          while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v31), v26));
        }
        else
        {
          do
            v30 = *--v29;
          while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v30), v26));
        }
        if (v28 >= v29)
        {
          v38 = v28 - 1;
        }
        else
        {
          v32 = *v29;
          v33 = v27;
          v34 = v28;
          v35 = v29;
          do
          {
            *v34 = v32;
            *v35 = v33;
            do
            {
              v36 = v34[1];
              ++v34;
              v33 = v36;
            }
            while (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v36), v26));
            do
            {
              v37 = *--v35;
              v32 = v37;
            }
            while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v37), v26));
          }
          while (v34 < v35);
          v38 = v34 - 1;
          v8 = v122;
        }
        a4 = v19;
        if (v38 != v8)
          *v8 = *v38;
        *v38 = v18;
        v6 = a3;
        a2 = v120;
        if (v28 < v29)
        {
LABEL_34:
          result = std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *,false>(v8, v38, a3, a4, a5 & 1);
          a5 = 0;
          v9 = v38 + 1;
          continue;
        }
        v39 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v38, a3);
        v9 = v38 + 1;
        result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v38 + 1, v120, a3);
        if (!(_DWORD)result)
        {
          if (v39)
            continue;
          goto LABEL_34;
        }
        a2 = v38;
        if (!v39)
          goto LABEL_2;
        return result;
    }
  }
}

BOOL std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(_DWORD *a1, _DWORD *a2, _DWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  FactorMetadataKeyValue *v10;
  uint64_t v11;
  const FactorMetadataKeyValue *v12;
  BOOL v13;
  uint64_t v14;
  _BOOL8 result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = *a2;
  v9 = a5 + a4;
  v10 = (FactorMetadataKeyValue *)(a5 + a4 - v8);
  v11 = *a1;
  v12 = (const FactorMetadataKeyValue *)(a5 + a4 - v11);
  v13 = FactorMetadataKeyValue::KeyCompareLessThan(v10, v12);
  v14 = *a3;
  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v14), v10);
  if (v13)
  {
    if (result)
    {
      *a1 = v14;
    }
    else
    {
      *a1 = v8;
      *a2 = v11;
      v18 = *a3;
      result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v18), v12);
      if (!result)
        return result;
      *a2 = v18;
    }
    *a3 = v11;
  }
  else if (result)
  {
    *a2 = v14;
    *a3 = v8;
    v16 = *a2;
    v17 = *a1;
    result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v16), (const FactorMetadataKeyValue *)(v9 - v17));
    if (result)
    {
      *a1 = v16;
      *a2 = v17;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  _DWORD *v21;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *(a2 - 1);
      v9 = *(_QWORD *)(*(_QWORD *)a3 + 40) + *(_QWORD *)(*(_QWORD *)a3 + 32);
      v10 = *a1;
      if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v8), (const FactorMetadataKeyValue *)(v9 - v10)))
      {
        *a1 = v8;
        *(a2 - 1) = v10;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a2 - 1, *(_QWORD *)(*(_QWORD *)a3 + 32), *(_QWORD *)(*(_QWORD *)a3 + 40));
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      v11 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, *(_QWORD *)(*(_QWORD *)a3 + 32), *(_QWORD *)(*(_QWORD *)a3 + 40));
      v12 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v13 = 0;
      v14 = *(_QWORD *)(*(_QWORD *)a3 + 40) + *(_QWORD *)(*(_QWORD *)a3 + 32);
      v15 = 12;
      break;
  }
  while (1)
  {
    v16 = *v12;
    v17 = *v11;
    if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v14 - v16), (const FactorMetadataKeyValue *)(v14 - v17)))
    {
      v18 = v15;
      while (1)
      {
        *(unsigned int *)((char *)a1 + v18) = v17;
        v19 = v18 - 4;
        if (v18 == 4)
          break;
        v17 = *(unsigned int *)((char *)a1 + v18 - 8);
        v20 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v14 - v16), (const FactorMetadataKeyValue *)(v14 - v17));
        v18 = v19;
        if (!v20)
        {
          v21 = (unsigned int *)((char *)a1 + v19);
          goto LABEL_12;
        }
      }
      v21 = a1;
LABEL_12:
      *v21 = v16;
      if (++v13 == 8)
        return v12 + 1 == a2;
    }
    v11 = v12;
    v15 += 4;
    if (++v12 == a2)
      return 1;
  }
}

BOOL FactorMetadataKeyValue::KeyCompareLessThan(FactorMetadataKeyValue *this, const FactorMetadataKeyValue *a2)
{
  FactorMetadataKeyValue *v2;
  FactorMetadataKeyValue *v3;
  const FactorMetadataKeyValue *v4;
  uint64_t v5;
  FactorMetadataKeyValue *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  size_t v10;
  int v11;

  v2 = &this[*(unsigned __int16 *)this[-*(int *)this->var0 + 4].var0];
  v3 = &v2[*(unsigned int *)v2->var0];
  v4 = &a2[*(unsigned __int16 *)a2[-*(int *)a2->var0 + 4].var0];
  v5 = *(unsigned int *)v4->var0;
  v8 = *(_DWORD *)v3->var0;
  v6 = v3 + 4;
  v7 = v8;
  v9 = *(_DWORD *)v4[v5].var0;
  if (v9 >= v8)
    v10 = v7;
  else
    v10 = v9;
  v11 = memcmp(v6, &v4[v5 + 4], v10);
  if (v11)
    return v11 < 0;
  else
    return v7 < v9;
}

BOOL std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a2, a3, *(_QWORD *)(*(_QWORD *)a5 + 32), *(_QWORD *)(*(_QWORD *)a5 + 40));
  v10 = *a4;
  v11 = *(_QWORD *)(*(_QWORD *)a5 + 40) + *(_QWORD *)(*(_QWORD *)a5 + 32);
  v12 = *a3;
  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v11 - v10), (const FactorMetadataKeyValue *)(v11 - v12));
  if (result)
  {
    *a3 = v10;
    *a4 = v12;
    v14 = *a3;
    v15 = *a2;
    result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v11 - v14), (const FactorMetadataKeyValue *)(v11 - v15));
    if (result)
    {
      *a2 = v14;
      *a3 = v15;
      v16 = *a2;
      v17 = *a1;
      result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v11 - v16), (const FactorMetadataKeyValue *)(v11 - v17));
      if (result)
      {
        *a1 = v16;
        *a2 = v17;
      }
    }
  }
  return result;
}

BOOL std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a2, a3, a4, a6);
  v12 = *a5;
  v13 = *(_QWORD *)(*(_QWORD *)a6 + 40) + *(_QWORD *)(*(_QWORD *)a6 + 32);
  v14 = *a4;
  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v13 - v12), (const FactorMetadataKeyValue *)(v13 - v14));
  if (result)
  {
    *a4 = v12;
    *a5 = v14;
    v16 = *a4;
    v17 = *a3;
    result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v13 - v16), (const FactorMetadataKeyValue *)(v13 - v17));
    if (result)
    {
      *a3 = v16;
      *a4 = v17;
      v18 = *a3;
      v19 = *a2;
      result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v13 - v18), (const FactorMetadataKeyValue *)(v13 - v19));
      if (result)
      {
        *a2 = v18;
        *a3 = v19;
        v20 = *a2;
        v21 = *a1;
        result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v13 - v20), (const FactorMetadataKeyValue *)(v13 - v21));
        if (result)
        {
          *a1 = v20;
          *a2 = v21;
        }
      }
    }
  }
  return result;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)this);
  *((_BYTE *)this + 70) = 1;
  v6 = a3 * a2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, 4uLL);
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, a3);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(apple::aiml::flatbuffers2::FlatBufferBuilder *this, int a2)
{
  if (!*((_BYTE *)this + 70))
    __assert_rtn("EndVector", "flatbuffers.h", 1672, "nested");
  *((_BYTE *)this + 70) = 0;
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, a2);
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  if (*((_QWORD *)this + 9) < a3)
    *((_QWORD *)this + 9) = a3;
  return apple::aiml::flatbuffers2::vector_downward::fill(this, (a3 - 1) & (-a2 - (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10))));
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *,false>(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6;
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  FactorMetadataKeyValue *v23;
  uint64_t v24;
  uint64_t v25;
  const FactorMetadataKeyValue *v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int *v38;
  BOOL v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int *v52;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int *v61;
  int64_t v62;
  int64_t v63;
  int64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int *v67;
  unsigned int *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL4 v74;
  unsigned int *v75;
  uint64_t v76;
  const FactorMetadataKeyValue *v77;
  uint64_t v78;
  const FactorMetadataKeyValue *v79;
  int64_t v80;
  uint64_t v81;
  _BOOL4 v82;
  uint64_t v83;
  unsigned int *v84;
  unsigned int *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  unsigned int *v98;
  uint64_t v99;
  unint64_t v100;
  unsigned int *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int *v109;
  unsigned int *v110;
  unsigned int *v111;
  unint64_t v112;
  uint64_t v113;
  unsigned int *v114;
  uint64_t v115;
  unsigned int v116;
  int64_t v118;
  unsigned int *v120;
  unsigned int *v121;
  unsigned int *v122;

  v6 = a3;
  v8 = (unsigned int *)result;
LABEL_2:
  v114 = a2 - 1;
  v110 = a2 - 3;
  v111 = a2 - 2;
  v9 = v8;
  v120 = a2;
  while (2)
  {
    v8 = v9;
    v10 = (char *)a2 - (char *)v9;
    v11 = a2 - v9;
    switch(v11)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v49 = *(a2 - 1);
        v50 = *(_QWORD *)(*(_QWORD *)v6 + 40) + *(_QWORD *)(*(_QWORD *)v6 + 32);
        v51 = *v8;
        result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v50 - v49), (const FactorMetadataKeyValue *)(v50 - v51));
        if ((_DWORD)result)
        {
          *v8 = v49;
          *(a2 - 1) = v51;
        }
        return result;
      case 3:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v8 + 1, v114, *(_QWORD *)(*(_QWORD *)v6 + 32), *(_QWORD *)(*(_QWORD *)v6 + 40));
      case 4:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v8 + 1, v8 + 2, v114, v6);
      case 5:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v8 + 1, v8 + 2, v8 + 3, v114, v6);
      default:
        v122 = v8;
        if (v10 <= 95)
        {
          v52 = v8 + 1;
          v54 = v8 == a2 || v52 == a2;
          if ((a5 & 1) != 0)
          {
            if (!v54)
            {
              v55 = 0;
              v56 = *(_QWORD *)(*(_QWORD *)v6 + 40) + *(_QWORD *)(*(_QWORD *)v6 + 32);
              v57 = v8;
              do
              {
                v59 = *v57;
                v58 = v57[1];
                v57 = v52;
                result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v56 - v58), (const FactorMetadataKeyValue *)(v56 - v59));
                if ((_DWORD)result)
                {
                  v60 = v55;
                  while (1)
                  {
                    *(unsigned int *)((char *)v122 + v60 + 4) = v59;
                    if (!v60)
                      break;
                    v59 = *(unsigned int *)((char *)v122 + v60 - 4);
                    result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v56 - v58), (const FactorMetadataKeyValue *)(v56 - v59));
                    v60 -= 4;
                    if ((result & 1) == 0)
                    {
                      v61 = (unsigned int *)((char *)v122 + v60 + 4);
                      goto LABEL_77;
                    }
                  }
                  v61 = v122;
LABEL_77:
                  *v61 = v58;
                }
                v52 = v57 + 1;
                v55 += 4;
              }
              while (v57 + 1 != a2);
            }
          }
          else if (!v54)
          {
            v106 = *(_QWORD *)(*(_QWORD *)v6 + 40) + *(_QWORD *)(*(_QWORD *)v6 + 32);
            do
            {
              v108 = *v8;
              v107 = v8[1];
              v8 = v52;
              result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v106 - v107), (const FactorMetadataKeyValue *)(v106 - v108));
              if ((_DWORD)result)
              {
                v109 = v8;
                do
                {
                  *v109 = v108;
                  v108 = *(v109 - 2);
                  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v106 - v107), (const FactorMetadataKeyValue *)(v106 - v108));
                  --v109;
                }
                while ((result & 1) != 0);
                *v109 = v107;
              }
              v52 = v8 + 1;
            }
            while (v8 + 1 != a2);
          }
          return result;
        }
        if (!a4)
        {
          if (v8 != a2)
          {
            v112 = v10;
            v113 = v11;
            v62 = (unint64_t)(v11 - 2) >> 1;
            v63 = v62;
            do
            {
              v64 = v63;
              if (v62 >= v63)
              {
                v65 = *(_QWORD *)a3;
                v118 = v64;
                v66 = (2 * v64) | 1;
                v67 = v122;
                v68 = &v122[v66];
                v69 = 2 * v64 + 2;
                if (v69 >= v11)
                {
                  LODWORD(v73) = *v68;
                  v72 = *(_QWORD *)(v65 + 32);
                  v71 = *(_QWORD *)(v65 + 40);
                }
                else
                {
                  v70 = *v68;
                  v72 = *(_QWORD *)(v65 + 32);
                  v71 = *(_QWORD *)(v65 + 40);
                  v73 = v68[1];
                  v74 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v71 + v72 - v70), (const FactorMetadataKeyValue *)(v71 + v72 - v73));
                  if (v74)
                    ++v68;
                  else
                    LODWORD(v73) = v70;
                  v67 = v122;
                  if (v74)
                    v66 = v69;
                }
                v64 = v118;
                v75 = &v67[v118];
                v76 = v71 + v72;
                v115 = *v75;
                v77 = (const FactorMetadataKeyValue *)(v76 - v115);
                result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v76 - v73), (const FactorMetadataKeyValue *)(v76 - v115));
                if ((result & 1) == 0)
                {
                  do
                  {
                    *v75 = v73;
                    v75 = v68;
                    if (v62 < v66)
                      break;
                    v78 = (2 * v66) | 1;
                    v68 = &v122[v78];
                    v66 = 2 * v66 + 2;
                    if (v66 >= v11)
                    {
                      LODWORD(v73) = *v68;
                      v66 = v78;
                    }
                    else
                    {
                      v73 = *v68;
                      v79 = v77;
                      v80 = v62;
                      v81 = v68[1];
                      v82 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v76 - v73), (const FactorMetadataKeyValue *)(v76 - v81));
                      if (v82)
                        LODWORD(v73) = v81;
                      v62 = v80;
                      v77 = v79;
                      v11 = v113;
                      if (v82)
                        ++v68;
                      else
                        v66 = v78;
                    }
                    result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v76 - v73), v77);
                  }
                  while (!(_DWORD)result);
                  v64 = v118;
                  *v75 = v115;
                }
              }
              v63 = v64 - 1;
            }
            while (v64);
            v83 = v112 >> 2;
            v84 = v120;
            v85 = v122;
            v86 = (uint64_t *)a3;
            do
            {
              v121 = v84;
              v87 = 0;
              v116 = *v85;
              v88 = *v86;
              v89 = v83 - 2;
              if (v83 < 2)
                v89 = v83 - 1;
              v90 = v89 >> 1;
              do
              {
                v91 = &v85[v87 + 1];
                v92 = (2 * v87) | 1;
                v93 = 2 * v87 + 2;
                if (v93 >= v83)
                {
                  v97 = *v91;
                  v87 = (2 * v87) | 1;
                }
                else
                {
                  v94 = *v91;
                  v95 = *(_QWORD *)(v88 + 40) + *(_QWORD *)(v88 + 32);
                  v96 = v91[1];
                  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v95 - v94), (const FactorMetadataKeyValue *)(v95 - v96));
                  if ((_DWORD)result)
                    v97 = v96;
                  else
                    v97 = v94;
                  if ((_DWORD)result)
                  {
                    ++v91;
                    v87 = v93;
                  }
                  else
                  {
                    v87 = v92;
                  }
                }
                *v85 = v97;
                v85 = v91;
              }
              while (v87 <= v90);
              v98 = v121 - 1;
              if (v91 == v121 - 1)
              {
                v84 = v121 - 1;
                *v91 = v116;
              }
              else
              {
                *v91 = *v98;
                v84 = v121 - 1;
                *v98 = v116;
                v99 = (char *)v91 - (char *)v122 + 4;
                if (v99 >= 5)
                {
                  v100 = (((unint64_t)v99 >> 2) - 2) >> 1;
                  v101 = &v122[v100];
                  v102 = *v101;
                  v103 = *(_QWORD *)(*(_QWORD *)a3 + 40) + *(_QWORD *)(*(_QWORD *)a3 + 32);
                  v104 = *v91;
                  result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v103 - v102), (const FactorMetadataKeyValue *)(v103 - v104));
                  if ((_DWORD)result)
                  {
                    do
                    {
                      *v91 = v102;
                      v91 = v101;
                      if (!v100)
                        break;
                      v100 = (v100 - 1) >> 1;
                      v101 = &v122[v100];
                      v102 = *v101;
                      result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v103 - v102), (const FactorMetadataKeyValue *)(v103 - v104));
                    }
                    while ((result & 1) != 0);
                    *v91 = v104;
                  }
                }
              }
              v105 = v83-- <= 2;
              v86 = (uint64_t *)a3;
              v85 = v122;
            }
            while (!v105);
          }
          return result;
        }
        v12 = (unint64_t)v11 >> 1;
        v13 = &v8[(unint64_t)v11 >> 1];
        v14 = *(_QWORD *)(*(_QWORD *)v6 + 32);
        v15 = *(_QWORD *)(*(_QWORD *)v6 + 40);
        if ((unint64_t)v10 < 0x201)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v13, v8, v114, v14, v15);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8, v13, v114, v14, v15);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8 + 1, v13 - 1, v111, *(_QWORD *)(*(_QWORD *)v6 + 32), *(_QWORD *)(*(_QWORD *)v6 + 40));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v8 + 2, &v8[v12 + 1], v110, *(_QWORD *)(*(_QWORD *)v6 + 32), *(_QWORD *)(*(_QWORD *)v6 + 40));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(v13 - 1, v13, &v8[v12 + 1], *(_QWORD *)(*(_QWORD *)v6 + 32), *(_QWORD *)(*(_QWORD *)v6 + 40));
          v16 = *v8;
          *v8 = *v13;
          *v13 = v16;
        }
        --a4;
        v17 = *(_QWORD *)v6;
        v18 = *v8;
        if ((a5 & 1) == 0)
        {
          v21 = *(_QWORD *)(v17 + 32);
          v20 = *(_QWORD *)(v17 + 40);
          v22 = v20 + v21;
          v23 = (FactorMetadataKeyValue *)(v20 + v21 - v18);
          if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v20 + v21 - *(v8 - 1)), v23))
          {
            v19 = a4;
            goto LABEL_13;
          }
          result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v20 + v21 - v18), (const FactorMetadataKeyValue *)(v22 - *v114));
          if ((result & 1) != 0)
          {
            v9 = v8;
            do
            {
              v40 = v9[1];
              ++v9;
              result = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v20 + v21 - v18), (const FactorMetadataKeyValue *)(v22 - v40));
            }
            while ((result & 1) == 0);
          }
          else
          {
            v41 = v8 + 1;
            do
            {
              v9 = v41;
              if (v41 >= v120)
                break;
              ++v41;
              result = FactorMetadataKeyValue::KeyCompareLessThan(v23, (const FactorMetadataKeyValue *)(v22 - *v9));
            }
            while (!(_DWORD)result);
          }
          v42 = v120;
          if (v9 < v120)
          {
            v42 = v120;
            do
            {
              v43 = *--v42;
              result = FactorMetadataKeyValue::KeyCompareLessThan(v23, (const FactorMetadataKeyValue *)(v22 - v43));
            }
            while ((result & 1) != 0);
          }
          if (v9 < v42)
          {
            v44 = *v9;
            v45 = *v42;
            do
            {
              *v9 = v45;
              *v42 = v44;
              do
              {
                v46 = v9[1];
                ++v9;
                v44 = v46;
              }
              while (!FactorMetadataKeyValue::KeyCompareLessThan(v23, (const FactorMetadataKeyValue *)(v22 - v46)));
              do
              {
                v47 = *--v42;
                v45 = v47;
                result = FactorMetadataKeyValue::KeyCompareLessThan(v23, (const FactorMetadataKeyValue *)(v22 - v47));
              }
              while ((result & 1) != 0);
            }
            while (v9 < v42);
          }
          v48 = v9 - 1;
          if (v9 - 1 != v8)
            *v8 = *v48;
          a5 = 0;
          *v48 = v18;
          v6 = a3;
          a2 = v120;
          continue;
        }
        v19 = a4;
        v21 = *(_QWORD *)(v17 + 32);
        v20 = *(_QWORD *)(v17 + 40);
LABEL_13:
        v24 = 0;
        v25 = v20 + v21;
        v26 = (const FactorMetadataKeyValue *)(v20 + v21 - v18);
        do
          v27 = v8[++v24];
        while (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v27), v26));
        v28 = &v8[v24];
        v29 = v120;
        if (v24 == 1)
        {
          v29 = v120;
          do
          {
            if (v28 >= v29)
              break;
            v31 = *--v29;
          }
          while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v31), v26));
        }
        else
        {
          do
            v30 = *--v29;
          while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v30), v26));
        }
        if (v28 >= v29)
        {
          v38 = v28 - 1;
        }
        else
        {
          v32 = *v29;
          v33 = v27;
          v34 = v28;
          v35 = v29;
          do
          {
            *v34 = v32;
            *v35 = v33;
            do
            {
              v36 = v34[1];
              ++v34;
              v33 = v36;
            }
            while (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v36), v26));
            do
            {
              v37 = *--v35;
              v32 = v37;
            }
            while (!FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v25 - v37), v26));
          }
          while (v34 < v35);
          v38 = v34 - 1;
          v8 = v122;
        }
        a4 = v19;
        if (v38 != v8)
          *v8 = *v38;
        *v38 = v18;
        v6 = a3;
        a2 = v120;
        if (v28 < v29)
        {
LABEL_34:
          result = std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *,false>(v8, v38, a3, a4, a5 & 1);
          a5 = 0;
          v9 = v38 + 1;
          continue;
        }
        v39 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *>(v8, v38, a3);
        v9 = v38 + 1;
        result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *>(v38 + 1, v120, a3);
        if (!(_DWORD)result)
        {
          if (v39)
            continue;
          goto LABEL_34;
        }
        a2 = v38;
        if (!v39)
          goto LABEL_2;
        return result;
    }
  }
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *>(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  _DWORD *v21;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *(a2 - 1);
      v9 = *(_QWORD *)(*(_QWORD *)a3 + 40) + *(_QWORD *)(*(_QWORD *)a3 + 32);
      v10 = *a1;
      if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v9 - v8), (const FactorMetadataKeyValue *)(v9 - v10)))
      {
        *a1 = v8;
        *(a2 - 1) = v10;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a2 - 1, *(_QWORD *)(*(_QWORD *)a3 + 32), *(_QWORD *)(*(_QWORD *)a3 + 40));
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      v11 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *>(a1, a1 + 1, a1 + 2, *(_QWORD *)(*(_QWORD *)a3 + 32), *(_QWORD *)(*(_QWORD *)a3 + 40));
      v12 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v13 = 0;
      v14 = *(_QWORD *)(*(_QWORD *)a3 + 40) + *(_QWORD *)(*(_QWORD *)a3 + 32);
      v15 = 12;
      break;
  }
  while (1)
  {
    v16 = *v12;
    v17 = *v11;
    if (FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v14 - v16), (const FactorMetadataKeyValue *)(v14 - v17)))
    {
      v18 = v15;
      while (1)
      {
        *(unsigned int *)((char *)a1 + v18) = v17;
        v19 = v18 - 4;
        if (v18 == 4)
          break;
        v17 = *(unsigned int *)((char *)a1 + v18 - 8);
        v20 = FactorMetadataKeyValue::KeyCompareLessThan((FactorMetadataKeyValue *)(v14 - v16), (const FactorMetadataKeyValue *)(v14 - v17));
        v18 = v19;
        if (!v20)
        {
          v21 = (unsigned int *)((char *)a1 + v19);
          goto LABEL_12;
        }
      }
      v21 = a1;
LABEL_12:
      *v21 = v16;
      if (++v13 == 8)
        return v12 + 1 == a2;
    }
    v11 = v12;
    v15 += 4;
    if (++v12 == a2)
      return 1;
  }
}

void std::vector<apple::aiml::flatbuffers2::Offset<void>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E3BFD5A0, MEMORY[0x1E0DE42D0]);
}

void sub_19B8D63AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1A1AC6820);
}

void sub_19B8D65B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::Finish(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unsigned int a2, const char *a3)
{
  int v5;
  uint64_t result;

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)this);
  *((_QWORD *)this + 7) = *((_QWORD *)this + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, 4, *((_QWORD *)this + 9));
  v5 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(this, a2);
  result = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, v5);
  *((_BYTE *)this + 71) = 1;
  return result;
}

void sub_19B8D67C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D6974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D6B28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

uint64_t apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>::KeyCompare<char const*>(const char **a1, unsigned int *a2)
{
  int *v2;
  unsigned __int16 *v3;
  uint64_t v4;
  char *v5;

  v2 = (int *)((char *)a2 + *a2);
  v3 = (unsigned __int16 *)((char *)v2 - *v2);
  if (*v3 >= 5u && (v4 = v3[2]) != 0)
    v5 = (char *)v2 + v4 + *(unsigned int *)((char *)v2 + v4);
  else
    v5 = 0;
  return -strcmp(v5 + 4, *a1);
}

void sub_19B8D6D68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D6F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D712C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D7300(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D74F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D76C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D78B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B8D8624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B8DABA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8DAF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8DC5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_ANEDeviceInfoClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1ECED7E10;
  v7 = qword_1ECED7E10;
  if (!qword_1ECED7E10)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __get_ANEDeviceInfoClass_block_invoke;
    v3[3] = &unk_1E3BFF5D0;
    v3[4] = &v4;
    __get_ANEDeviceInfoClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19B8DC9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTIInputModeControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ECED7E08)
    qword_1ECED7E08 = _sl_dlopen();
  if (!qword_1ECED7E08)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TextInputLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("TRISystemInfo.m"), 29, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("TIInputModeController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTIInputModeControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("TRISystemInfo.m"), 30, CFSTR("Unable to find class %s"), "TIInputModeController");

LABEL_8:
    __break(1u);
  }
  qword_1ECED7E00 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19B8DD430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8DDF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E1F20(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_19B8E256C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x19B8E24A4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TRITripersistedEvaluationStatusRoot_FileDescriptor()
{
  uint64_t result;

  result = TRITripersistedEvaluationStatusRoot_FileDescriptor_descriptor;
  if (!TRITripersistedEvaluationStatusRoot_FileDescriptor_descriptor)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F40]), "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITripersistedEvaluationStatusRoot_FileDescriptor_descriptor = result;
  }
  return result;
}

uint64_t TRIPersistedFactorsState_ClearStateOneOfCase(void *a1)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0);
  return TRIPBMaybeClearOneof();
}

void sub_19B8E59A4(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

void sub_19B8E6100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19B8E659C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    (*(void (**)(void))(a10 + 16))();
  _Unwind_Resume(exception_object);
}

void sub_19B8E6868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E6AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7;
  va_list va;
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
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E7018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E7414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E7698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7;
  va_list va;
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
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E7BC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B8E8714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E8F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E9578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E9760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E9844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8E9B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCoreTelephonyClientClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreTelephonyLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CoreTelephonyClient");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCoreTelephonyClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCoreTelephonyClientClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TRICellularParameterManager.m"), 29, CFSTR("Unable to find class %s"), "CoreTelephonyClient");

    __break(1u);
  }
}

void CoreTelephonyLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!CoreTelephonyLibraryCore_frameworkLibrary)
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreTelephonyLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TRICellularParameterManager.m"), 28, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getCTBundleClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreTelephonyLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CTBundle");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCTBundleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCTBundleClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TRICellularParameterManager.m"), 30, CFSTR("Unable to find class %s"), "CTBundle");

    __break(1u);
  }
}

id TRIValidateAssetId(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  void *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString<TRIAssetId> * _Nullable TRIValidateAssetId(NSString * _Nonnull __strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("TRIStrongTypingProtocols.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetId"));

  }
  if ((objc_msgSend(v1, "triIsPathSafePlausibleUniqueId") & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v1;
      _os_log_error_impl(&dword_19B89C000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for an asset ID: %@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

id TRIValidateMLRuntimeEvaluationId(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  void *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString<TRIMLRuntimeEvaluationId> * _Nullable TRIValidateMLRuntimeEvaluationId(NSString * _Nonnull __strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("TRIStrongTypingProtocols.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("evalId"));

  }
  if ((objc_msgSend(v1, "triIsPathSafePlausibleUniqueId") & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v1;
      _os_log_error_impl(&dword_19B89C000, v3, OS_LOG_TYPE_ERROR, "Identifier rejected as unsuitable for an MLRuntime evaluation ID: %@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

void sub_19B8EE46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8EE868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8EF1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8F17D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8F18E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_19B8F1A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8F2304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8F2468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8F2584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8F2D8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B8F3CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8F4238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TRILogCategory_Daemon()
{
  if (qword_1ECED7F58 != -1)
    dispatch_once(&qword_1ECED7F58, &__block_literal_global_3);
  return (id)qword_1ECED7F60;
}

id TRILogCategory_Server()
{
  if (qword_1ECED7F68 != -1)
    dispatch_once(&qword_1ECED7F68, &__block_literal_global_4);
  return (id)qword_1ECED7F70;
}

id TRILogCategory_Backtrace()
{
  if (qword_1ECED7F78 != -1)
    dispatch_once(&qword_1ECED7F78, &__block_literal_global_6_0);
  return (id)qword_1ECED7F80;
}

id TRILogCategory_XCTest()
{
  if (qword_1ECED7F88 != -1)
    dispatch_once(&qword_1ECED7F88, &__block_literal_global_8);
  return (id)qword_1ECED7F90;
}

id TRILogCategory_InternalTool()
{
  if (qword_1ECED7F98 != -1)
    dispatch_once(&qword_1ECED7F98, &__block_literal_global_10_0);
  return (id)qword_1ECED7FA0;
}

id TRILogCategory_Archiving()
{
  if (qword_1ECED7FA8 != -1)
    dispatch_once(&qword_1ECED7FA8, &__block_literal_global_12);
  return (id)qword_1ECED7FB0;
}

__CFString *TRILoggedNamespaceName(void *a1)
{
  id v1;
  __CFString *v2;

  v1 = a1;
  if (+[TRINamespaceLogPolicy shouldPrivacyFilterNamespace:policy:](TRINamespaceLogPolicy, "shouldPrivacyFilterNamespace:policy:", v1, 1))
  {
    v2 = CFSTR("<private>");
  }
  else
  {
    v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_19B8F7398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B8F77C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B8FE020(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf)
{
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;

  if (a2 == 1)
  {
    v18 = objc_begin_catch(exception_object);
    TRILogCategory_ClientFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412546;
      *(_QWORD *)((char *)&buf + 4) = v17;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v20;
      _os_log_impl(&dword_19B89C000, v19, OS_LOG_TYPE_DEFAULT, "could not evaluate BMLT assignment expression \"%@\" -- %@", (uint8_t *)&buf, 0x16u);

    }
    if (v16)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      a11 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to evaluate targeting expression. Please verify parameters are valid for expression %@ with parameters %@"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      a12 = (uint64_t)v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a12, &a11, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *v16 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v23);

    }
    objc_msgSend(v15, "_logBMLTCustomTargetingWithResult:", 0);

    objc_end_catch();
    JUMPOUT(0x19B8FDFD4);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B90D888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TRITripersistedAllocationStatusRoot_FileDescriptor()
{
  uint64_t result;

  result = TRITripersistedAllocationStatusRoot_FileDescriptor_descriptor;
  if (!TRITripersistedAllocationStatusRoot_FileDescriptor_descriptor)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F40]), "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITripersistedAllocationStatusRoot_FileDescriptor_descriptor = result;
  }
  return result;
}

void sub_19B90F688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B90F9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t AFBIsValidUTF8()
{
  return MEMORY[0x1E0CFCEB8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x1E0CD65E8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1E0CD6638](task);
}

uint64_t TRIDeploymentEnvironment_EnumDescriptor()
{
  return MEMORY[0x1E0DC0FE8]();
}

uint64_t TRINamespace_NamespaceId_EnumDescriptor()
{
  return MEMORY[0x1E0DC0FF8]();
}

uint64_t TRIPBFieldTag()
{
  return MEMORY[0x1E0DC1020]();
}

uint64_t TRIPBMaybeClearOneof()
{
  return MEMORY[0x1E0DC1028]();
}

uint64_t TRIProject_ProjectId_IsValidValue()
{
  return MEMORY[0x1E0DC1030]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E3BFD5D0();
}

void operator delete(void *__p)
{
  off_1E3BFD5D8(__p);
}

uint64_t operator delete()
{
  return off_1E3BFD5E0();
}

uint64_t operator new[]()
{
  return off_1E3BFD5E8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E3BFD5F0(__sz);
}

uint64_t operator new()
{
  return off_1E3BFD5F8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_copy_path()
{
  return MEMORY[0x1E0C827E0]();
}

uint64_t container_create_or_lookup_app_group_paths_for_current_user()
{
  return MEMORY[0x1E0C82800]();
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x1E0C82810]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1E0C828B0]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1E0C85330](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Accounts(double a1)
{
  dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_Accounts);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___ACAccountStore(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_Accounts))
    return dlopenHelper_Accounts(result);
  return result;
}

