BOOL Hangul2SetAutomata::SendUniChar(Hangul2SetAutomata *this, HangulSyllable *a2, BOOL *a3)
{
  HangulSyllable *v4;
  int JamoType;
  int v7;
  int v8;
  int v9;
  unsigned __int16 v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned __int16 v15;
  int var2;
  _BOOL4 CanCompose;
  int v18;
  unsigned __int16 v19;
  int v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  int var1;
  HangulSyllable *v24;
  HangulSyllable *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  HangulSyllable *p_var5;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  __CFString *v39;
  __CFString *var4;
  __CFString *v41;
  __CFString *v42;
  int v44;
  __CFString *v45;
  HangulSyllable chars;
  HangulSyllable v47;

  v4 = a2;
  *(_DWORD *)&v47.var0 = 0;
  v47.var2 = 0;
  *a3 = 0;
  JamoType = HangulSyllable::GetJamoType(a2);
  v7 = JamoType;
  if (JamoType == -1)
  {
    *a3 = 1;
    Hangul2SetAutomata::Reset(this);
    return v7 != -1;
  }
  switch(this->var3)
  {
    case 0:
      if (JamoType == 1)
        v11 = 0;
      else
        v11 = (int)v4;
      if (JamoType == 1)
      {
        v12 = 1;
      }
      else
      {
        LODWORD(v4) = 0;
        v12 = 2;
      }
      HangulSyllable::SetCho(&this->var5, v11);
      HangulSyllable::SetJung(&this->var5, (int)v4);
      HangulSyllable::SetJong(&this->var5, 0);
      this->var3 = v12;
      *(_DWORD *)&this->var1 = 1;
      goto LABEL_61;
    case 1:
      if (JamoType != 1)
        goto LABEL_46;
      v13 = HangulSyllable::DoubleJung((HangulSyllable *)this->var5.var1, (int)v4, this->var7);
      if (!v13)
        goto LABEL_59;
      v14 = v13;
      HangulSyllable::SetCho(&chars, 0);
      HangulSyllable::SetJung(&chars, v14);
      HangulSyllable::SetJong(&chars, 0);
      if (HangulSyllable::CanCompose(&chars))
      {
        v15 = 1;
        this->var3 = 1;
        HangulSyllable::Set(&this->var5, 0, v14, 0);
      }
      else
      {
        HangulSyllable::SetJung(&v47, (int)v4);
        v15 = 0;
        this->var3 = 1;
        *a3 = 1;
      }
      this->var2 = v15;
      goto LABEL_52;
    case 2:
      if (JamoType != 1)
        goto LABEL_46;
      var2 = this->var5.var2;
      HangulSyllable::SetCho(&this->var6, this->var5.var0);
      HangulSyllable::SetJung(&this->var6, (int)v4);
      HangulSyllable::SetJong(&this->var6, var2);
      CanCompose = HangulSyllable::CanCompose(&this->var6);
      if ((_DWORD)v4 != 12685 && !CanCompose)
        goto LABEL_59;
      if ((_DWORD)v4 == 12685)
        v18 = 6;
      else
        v18 = 3;
      this->var3 = v18;
      HangulSyllable::SetJung(&this->var5, this->var6.var1);
      HangulSyllable::SetJong(&this->var5, 0);
      v19 = this->var3 != 6;
      goto LABEL_51;
    case 3:
    case 6:
      if (JamoType != 1)
      {
        var1 = this->var5.var1;
        HangulSyllable::SetCho(&chars, this->var5.var0);
        HangulSyllable::SetJung(&chars, var1);
        HangulSyllable::SetJong(&chars, (int)v4);
        if (HangulSyllable::NormalizeJong(v4) && HangulSyllable::CanCompose(&chars))
        {
          HangulSyllable::SetJong(&this->var5, (int)v4);
          this->var3 = 4;
          v19 = 1;
        }
        else
        {
          HangulSyllable::SetCho(&v47, (int)v4);
          v19 = 0;
          this->var3 = 2;
          *a3 = 1;
        }
        goto LABEL_51;
      }
      v8 = HangulSyllable::DoubleJung((HangulSyllable *)this->var5.var1, (int)v4, this->var7);
      if (!v8)
        goto LABEL_59;
      v9 = v8;
      HangulSyllable::SetCho(&this->var6, this->var5.var0);
      HangulSyllable::SetJung(&this->var6, v9);
      HangulSyllable::SetJong(&this->var6, 0);
      if (HangulSyllable::CanCompose(&this->var6))
      {
        if (this->var3 == 6)
          v10 = 2;
        else
          v10 = 1;
        this->var2 = v10;
        this->var1 = 1;
        this->var3 = 3;
        *(_DWORD *)&this->var5.var0 = *(_DWORD *)&this->var6.var0;
        this->var5.var2 = this->var6.var2;
      }
      else
      {
        if ((_DWORD)v4 != 12685)
          goto LABEL_59;
        *(_DWORD *)&this->var1 = 65537;
        HangulSyllable::SetJung(&this->var5, this->var6.var1);
        HangulSyllable::SetJong(&this->var5, 0);
        this->var3 = 6;
      }
      goto LABEL_61;
    case 4:
      if (JamoType == 1)
      {
        v20 = HangulSyllable::MapChoAndJong((HangulSyllable *)this->var5.var2);
        HangulSyllable::SetCho(&chars, v20);
        HangulSyllable::SetJung(&chars, (int)v4);
        HangulSyllable::SetJong(&chars, 0);
        if (HangulSyllable::CanCompose(&chars))
        {
          v47 = chars;
          HangulSyllable::SetJong(&this->var5, 0);
          this->var3 = 3;
          v21 = 1;
          *a3 = 1;
          v22 = 2;
        }
        else if ((_DWORD)v4 == 12685)
        {
          HangulSyllable::SetJong(&this->var5, 0);
          HangulSyllable::SetCho(&v47, chars.var0);
          HangulSyllable::SetJung(&v47, 12685);
          this->var3 = 6;
          v22 = 2;
          v21 = 1;
        }
        else
        {
          HangulSyllable::SetJung(&v47, (int)v4);
          v21 = 0;
          v22 = 1;
          this->var3 = 1;
          *a3 = 1;
        }
        this->var2 = v21;
        goto LABEL_53;
      }
      v28 = HangulSyllable::DoubleJong((HangulSyllable *)this->var5.var2, (int)v4);
      if (!v28)
        goto LABEL_46;
      v29 = v28;
      v30 = this->var5.var1;
      HangulSyllable::SetCho(&chars, this->var5.var0);
      HangulSyllable::SetJung(&chars, v30);
      HangulSyllable::SetJong(&chars, v29);
      if (HangulSyllable::CanCompose(&chars))
      {
        p_var5 = &this->var5;
        v32 = v29;
        goto LABEL_45;
      }
      goto LABEL_49;
    case 5:
      v24 = (HangulSyllable *)this->var5.var2;
      if (v7 == 1)
      {
        v25 = (HangulSyllable *)HangulSyllable::JongRightHalf(v24);
        v26 = HangulSyllable::MapChoAndJong(v25);
        HangulSyllable::SetCho(&chars, v26);
        HangulSyllable::SetJung(&chars, (int)v4);
        HangulSyllable::SetJong(&chars, 0);
        if (HangulSyllable::CanCompose(&chars))
        {
          v27 = 3;
LABEL_58:
          this->var3 = v27;
          v37 = HangulSyllable::JongLeftHalf((HangulSyllable *)this->var5.var2);
          HangulSyllable::SetJong(&this->var5, v37);
          v47 = chars;
          *(_DWORD *)&this->var1 = 65538;
          *a3 = 1;
          goto LABEL_61;
        }
        if ((_DWORD)v4 == 12685)
        {
          v27 = 6;
          goto LABEL_58;
        }
LABEL_59:
        HangulSyllable::SetJung(&v47, (int)v4);
        this->var3 = 1;
        goto LABEL_60;
      }
      v33 = HangulSyllable::DoubleJong(v24, (int)v4);
      if (!v33)
      {
LABEL_46:
        HangulSyllable::SetCho(&v47, (int)v4);
        this->var3 = 2;
LABEL_60:
        *a3 = 1;
        *(_DWORD *)&this->var1 = 1;
        goto LABEL_61;
      }
      v34 = v33;
      v35 = this->var5.var1;
      HangulSyllable::SetCho(&chars, this->var5.var0);
      HangulSyllable::SetJung(&chars, v35);
      HangulSyllable::SetJong(&chars, v34);
      if (HangulSyllable::CanCompose(&chars))
      {
        p_var5 = &this->var5;
        v32 = v34;
LABEL_45:
        HangulSyllable::SetJong(p_var5, v32);
        v19 = 1;
        v36 = 5;
      }
      else
      {
LABEL_49:
        HangulSyllable::SetCho(&v47, (int)v4);
        v19 = 0;
        *a3 = 1;
        v36 = 2;
      }
      this->var3 = v36;
LABEL_51:
      this->var2 = v19;
LABEL_52:
      v22 = 1;
LABEL_53:
      this->var1 = v22;
LABEL_61:
      v38 = this->var1;
      if (v38 == 2)
      {
        Hangul2SetAutomata::ClearOutputString(this);
        chars.var0 = HangulSyllable::GetUnicode(&this->var5);
        var4 = this->var4;
        if (var4)
          CFStringAppendCharacters(var4, &chars.var0, 1);
        if (this->var3 == 6)
        {
          chars.var0 = v47.var0;
          v41 = this->var4;
          if (!v41)
            goto LABEL_75;
          CFStringAppendCharacters(v41, &chars.var0, 1);
          v42 = this->var4;
          chars.var0 = v47.var1;
          if (!v42)
            goto LABEL_75;
        }
        else
        {
          chars.var0 = HangulSyllable::GetUnicode(&v47);
          v42 = this->var4;
          if (!v42)
          {
LABEL_75:
            this->var5 = v47;
            return v7 != -1;
          }
        }
        CFStringAppendCharacters(v42, &chars.var0, 1);
        goto LABEL_75;
      }
      if (v38 == 1)
      {
        Hangul2SetAutomata::ClearOutputString(this);
        if (*a3)
        {
          chars.var0 = HangulSyllable::GetUnicode(&v47);
          v39 = this->var4;
          if (v39)
            CFStringAppendCharacters(v39, &chars.var0, 1);
          this->var5 = v47;
        }
        else
        {
          if (this->var3 == 6)
          {
            v44 = this->var5.var1;
            if (v44 == 4510)
              LOWORD(v44) = HangulSyllable::JungToCompatibility((HangulSyllable *)0x119E);
          }
          else
          {
            LOWORD(v44) = HangulSyllable::GetUnicode(&this->var5);
          }
          chars.var0 = v44;
          v45 = this->var4;
          if (v45)
            CFStringAppendCharacters(v45, &chars.var0, 1);
        }
      }
      return v7 != -1;
    default:
      goto LABEL_61;
  }
}

void Hangul2SetAutomata::Reset(Hangul2SetAutomata *this)
{
  HangulSyllable *p_var5;

  *(_DWORD *)&this->var1 = 0;
  this->var3 = 0;
  p_var5 = &this->var5;
  HangulSyllable::SetCho(&this->var5, 0);
  HangulSyllable::SetJung(p_var5, 0);
  HangulSyllable::SetJong(p_var5, 0);
  Hangul2SetAutomata::ClearOutputString(this);
}

HangulSyllable *HangulSyllable::Set(HangulSyllable *this, int a2, int a3, int a4)
{
  HangulSyllable::SetCho(this, a2);
  HangulSyllable::SetJung(this, a3);
  return HangulSyllable::SetJong(this, a4);
}

void Hangul2SetAutomata::ClearOutputString(Hangul2SetAutomata *this)
{
  __CFString *var4;
  uint64_t Length;
  CFRange v4;

  var4 = this->var4;
  if (var4)
  {
    Length = CFStringGetLength(var4);
    if (Length >= 1)
    {
      v4.length = Length;
      v4.location = 0;
      CFStringDelete(this->var4, v4);
    }
  }
}

void Hangul2SetAutomata::AppendCharToOutput(Hangul2SetAutomata *this, UniChar a2)
{
  __CFString *var4;
  UniChar chars;

  chars = a2;
  var4 = this->var4;
  if (var4)
    CFStringAppendCharacters(var4, &chars, 1);
}

uint64_t Hangul2SetAutomata::HandleDelete(Hangul2SetAutomata *this)
{
  int var3;
  HangulSyllable *p_var5;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  __CFString *var4;
  UniChar chars;

  var3 = this->var3;
  switch(var3)
  {
    case 0:
      var3 = 0;
      this->var0 = 1;
      break;
    case 1:
      p_var5 = &this->var5;
      v4 = HangulSyllable::VowelLeftHalf((HangulSyllable *)this->var5.var1);
      HangulSyllable::SetCho(&this->var5, 0);
      if (!v4)
        goto LABEL_15;
      HangulSyllable::SetJung(&this->var5, v4);
      HangulSyllable::SetJong(&this->var5, 0);
      v5 = 1;
      goto LABEL_18;
    case 2:
      p_var5 = &this->var5;
      v6 = HangulSyllable::ChoLeftHalf((HangulSyllable *)this->var5.var0);
      if (v6)
      {
        HangulSyllable::SetCho(&this->var5, v6);
LABEL_13:
        HangulSyllable::SetJung(p_var5, 0);
        HangulSyllable::SetJong(p_var5, 0);
        var3 = 2;
        this->var3 = 2;
        v9 = 65537;
      }
      else
      {
        HangulSyllable::SetCho(&this->var5, 0);
LABEL_15:
        HangulSyllable::SetJung(p_var5, 0);
        HangulSyllable::SetJong(p_var5, 0);
        var3 = 0;
        this->var3 = 0;
        v9 = 0x10000;
      }
      *(_DWORD *)&this->var1 = v9;
      break;
    case 3:
      v7 = HangulSyllable::VowelLeftHalf((HangulSyllable *)this->var5.var1);
      if (v7)
      {
        HangulSyllable::SetJung(&this->var5, v7);
LABEL_10:
        v5 = 3;
      }
      else
      {
        HangulSyllable::SetJung(&this->var5, 0);
        HangulSyllable::SetJong(&this->var5, 0);
        v5 = 2;
      }
LABEL_18:
      this->var3 = v5;
      *(_DWORD *)&this->var1 = 65537;
      var3 = 2;
      break;
    case 4:
      HangulSyllable::SetJong(&this->var5, 0);
      goto LABEL_10;
    case 5:
      v8 = HangulSyllable::JongLeftHalf((HangulSyllable *)this->var5.var2);
      HangulSyllable::SetJong(&this->var5, v8);
      v5 = 4;
      goto LABEL_18;
    case 6:
      p_var5 = &this->var5;
      goto LABEL_13;
    default:
      break;
  }
  if (this->var1 == 1)
  {
    Hangul2SetAutomata::ClearOutputString(this);
    chars = HangulSyllable::GetUnicode(&this->var5);
    var4 = this->var4;
    if (var4)
      CFStringAppendCharacters(var4, &chars, 1);
  }
  else if (!var3)
  {
    Hangul2SetAutomata::ClearOutputString(this);
  }
  return 1;
}

void Hangul2SetAutomata::Hangul2SetAutomata(Hangul2SetAutomata *this)
{
  this->var0 = 0;
  *(_DWORD *)&this->var1 = 0;
  this->var3 = 0;
  this->var4 = 0;
  *(_QWORD *)&this->var5.var0 = 0;
  *(_QWORD *)((char *)&this->var5.var2 + 1) = 0;
  this->var4 = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 32);
}

{
  this->var0 = 0;
  *(_DWORD *)&this->var1 = 0;
  this->var3 = 0;
  this->var4 = 0;
  *(_QWORD *)&this->var5.var0 = 0;
  *(_QWORD *)((char *)&this->var5.var2 + 1) = 0;
  this->var4 = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 32);
}

void Hangul2SetAutomata::~Hangul2SetAutomata(Hangul2SetAutomata *this)
{
  __CFString *var4;

  var4 = this->var4;
  if (var4)
  {
    CFRelease(var4);
    this->var4 = 0;
  }
}

{
  __CFString *var4;

  var4 = this->var4;
  if (var4)
  {
    CFRelease(var4);
    this->var4 = 0;
  }
}

uint64_t Hangul2SetAutomata::AppendComposedHangul(Hangul2SetAutomata *this, __CFString *theString)
{
  unsigned __int16 Length;
  CFRange v5;

  Length = CFStringGetLength(theString);
  if (Length)
  {
    v5.length = this->var2;
    if (Length >= LODWORD(v5.length))
    {
      v5.location = Length - v5.length;
      CFStringDelete(theString, v5);
    }
  }
  CFStringAppend(theString, this->var4);
  return this->var2;
}

void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

__CFString *_composeJamo(const __CFString *a1, Hangul2SetAutomata *a2)
{
  __CFString *Mutable;
  uint64_t Length;
  CFIndex i;
  HangulSyllable *CharacterAtIndex;
  BOOL v9;
  UniChar chars;

  Mutable = 0;
  if (a1)
  {
    if (a2)
    {
      Length = CFStringGetLength(a1);
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Length);
      if (Mutable)
      {
        Hangul2SetAutomata::Reset(a2);
        if (Length >= 1)
        {
          for (i = 0; i != Length; ++i)
          {
            chars = 0;
            CharacterAtIndex = (HangulSyllable *)CFStringGetCharacterAtIndex(a1, i);
            chars = (unsigned __int16)CharacterAtIndex;
            v9 = 0;
            if (Hangul2SetAutomata::SendUniChar(a2, CharacterAtIndex, &v9))
              Hangul2SetAutomata::AppendComposedHangul(a2, Mutable);
            else
              CFStringAppendCharacters(Mutable, &chars, 1);
          }
        }
      }
    }
  }
  return Mutable;
}

id DecomposeHangul(NSString *a1)
{
  NSString *v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  int v5;
  unsigned __int16 v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned __int16 *v10;
  uint64_t v11;
  void *v12;
  unsigned __int16 v15[2];
  HangulSyllable v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  -[NSString length](v1, "length");
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v15[-1] - v2;
  if (-[NSString length](v1, "length"))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = -[NSString characterAtIndex:](v1, "characterAtIndex:", v4);
      if ((unsigned __int16)((unsigned __int16)(v6 + 21504) >> 2) > 0xAE8u)
      {
        *(_WORD *)&v3[2 * v5++] = v6;
      }
      else
      {
        HangulSyllable::HangulSyllable(&v16, v6);
        *(_DWORD *)v15 = 0;
        v7 = v5 + 1;
        *(_WORD *)&v3[2 * v5] = HangulSyllable::ChoToCompatibility((HangulSyllable *)v16.var0);
        v9 = v5 + 2;
        if (HangulSyllable::SplitJamoCompound((HangulSyllable *)v16.var1, &v15[1], v15, v8))
        {
          *(_WORD *)&v3[2 * v7] = HangulSyllable::JungToCompatibility((HangulSyllable *)v15[1]);
          v5 += 3;
          *(_WORD *)&v3[2 * v9] = HangulSyllable::JungToCompatibility((HangulSyllable *)v15[0]);
        }
        else
        {
          *(_WORD *)&v3[2 * v7] = HangulSyllable::JungToCompatibility((HangulSyllable *)v16.var1);
          v5 += 2;
        }
        if (v16.var2)
        {
          v11 = v5 + 1;
          if (HangulSyllable::SplitJamoCompound((HangulSyllable *)v16.var2, &v15[1], v15, v10))
          {
            *(_WORD *)&v3[2 * v5] = HangulSyllable::JongToCompatibility((HangulSyllable *)v15[1]);
            v5 += 2;
            *(_WORD *)&v3[2 * v11] = HangulSyllable::JongToCompatibility((HangulSyllable *)v15[0]);
          }
          else
          {
            *(_WORD *)&v3[2 * v5++] = HangulSyllable::JongToCompatibility((HangulSyllable *)v16.var2);
          }
        }
      }
      ++v4;
    }
    while (-[NSString length](v1, "length") > v4);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v3, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void _GLOBAL__sub_I_TIKeyboardInputManagerFavonius_ko_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902AEC]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232330000);
  objc_autoreleasePoolPop(v0);
}

HangulSyllable *HangulSyllable::NormalizeCho(HangulSyllable *this)
{
  if (((_DWORD)this - 12593) <= 0x5D)
    return (HangulSyllable *)gCompatibilityJamoToChoMap[this - 12593];
  return this;
}

HangulSyllable *HangulSyllable::NormalizeJung(HangulSyllable *this)
{
  if (((_DWORD)this - 12593) <= 0x5D)
    return (HangulSyllable *)gCompatibilityJamoToJungMap[this - 12593];
  return this;
}

HangulSyllable *HangulSyllable::NormalizeJong(HangulSyllable *this)
{
  if (((_DWORD)this - 12593) <= 0x5D)
    return (HangulSyllable *)gCompatibilityJamoToJongMap[this - 12593];
  return this;
}

uint64_t HangulSyllable::ChoToCompatibility(HangulSyllable *this)
{
  unint64_t v1;

  v1 = this - 4352;
  if (v1 > 0x12)
    return 0;
  else
    return gChoToCompatibilityTable[v1];
}

uint64_t HangulSyllable::JungToCompatibility(HangulSyllable *this)
{
  unsigned int v2;

  if (((_DWORD)this - 4449) <= 0x14)
    return gJungToCompatibilityTable[(_DWORD)this - 4449];
  if ((_DWORD)this == 4514)
    v2 = 4514;
  else
    v2 = 0;
  if ((_DWORD)this == 4510)
    return 12685;
  else
    return v2;
}

uint64_t HangulSyllable::JongToCompatibility(HangulSyllable *this)
{
  unint64_t v1;

  v1 = this - 4520;
  if (v1 > 0x1A)
    return 0;
  else
    return gJongToCompatibilityTable[v1];
}

HangulSyllable *HangulSyllable::MapChoAndJong(HangulSyllable *this)
{
  HangulSyllable *v1;
  int JamoType;
  unint64_t v3;
  unsigned __int16 *v4;

  v1 = this;
  JamoType = HangulSyllable::GetJamoType(this);
  if (JamoType == 4)
  {
    v3 = v1 - 4520;
    if (v3 <= 0x1A)
    {
      v4 = (unsigned __int16 *)&gJongToChoMap;
      return (HangulSyllable *)v4[v3];
    }
  }
  else if (JamoType == 2)
  {
    v3 = v1 - 4352;
    if (v3 <= 0x12)
    {
      v4 = (unsigned __int16 *)&gChoToJongMap;
      return (HangulSyllable *)v4[v3];
    }
  }
  return v1;
}

uint64_t HangulSyllable::GetJamoType(HangulSyllable *this)
{
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v5;

  if (((_DWORD)this - 4520) >= 0x52)
    v1 = -1;
  else
    v1 = 4;
  if (((_DWORD)this - 4449) >= 0x42)
    v2 = v1;
  else
    v2 = 3;
  if (((_DWORD)this - 4352) >= 0x5A)
    v3 = v2;
  else
    v3 = 2;
  v5 = this > 0x3186 || ((_DWORD)this - 12623) < 0x15;
  if (((_DWORD)this - 12592) <= 0x5E)
    return v5;
  else
    return v3;
}

HangulSyllable *HangulSyllable::SetCho(HangulSyllable *this, int a2)
{
  if ((a2 - 12593) <= 0x5D)
    LOWORD(a2) = gCompatibilityJamoToChoMap[a2 - 12593];
  this->var0 = a2;
  return this;
}

HangulSyllable *HangulSyllable::SetJung(HangulSyllable *this, int a2)
{
  if ((a2 - 12593) <= 0x5D)
    LOWORD(a2) = gCompatibilityJamoToJungMap[a2 - 12593];
  this->var1 = a2;
  return this;
}

HangulSyllable *HangulSyllable::SetJong(HangulSyllable *this, int a2)
{
  if ((a2 - 12593) <= 0x5D)
    LOWORD(a2) = gCompatibilityJamoToJongMap[a2 - 12593];
  this->var2 = a2;
  return this;
}

uint64_t HangulSyllable::GetUnicode(HangulSyllable *this)
{
  uint64_t var0;
  int var1;
  unsigned int var2;
  BOOL v5;
  __int16 v6;
  __int16 v8;

  var0 = this->var0;
  var1 = this->var1;
  if (!this->var0)
  {
    if (!this->var1)
      return (unsigned __int16)var1;
    if (!this->var2)
    {
      if ((var1 - 4449) > 0x14)
      {
        if (var1 == 4514)
          v8 = 4514;
        else
          v8 = 0;
        if (var1 == 4510)
          LOWORD(var1) = 12685;
        else
          LOWORD(var1) = v8;
      }
      else
      {
        LOWORD(var1) = gJungToCompatibilityTable[var1 - 4449];
      }
      return (unsigned __int16)var1;
    }
LABEL_17:
    LOWORD(var1) = 0;
    return (unsigned __int16)var1;
  }
  if (!this->var1)
  {
    if (!this->var2 && (unint64_t)(var0 - 4352) <= 0x12)
    {
      LOWORD(var1) = gChoToCompatibilityTable[var0 - 4352];
      return (unsigned __int16)var1;
    }
    goto LABEL_17;
  }
  if (var1 == 4510 || var1 == 4514)
    goto LABEL_17;
  var2 = this->var2;
  v5 = var2 >= 0x11A7;
  v6 = var2 - 4519;
  if (!v5)
    v6 = 0;
  LOWORD(var1) = 28 * var1 + 588 * var0 + v6 - 18076;
  return (unsigned __int16)var1;
}

BOOL HangulSyllable::CanCompose(HangulSyllable *this)
{
  return HangulSyllable::GetUnicode(this) != 0;
}

uint64_t SearchForJamoCompound(int a1, int a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;

  v4 = a4 - 1;
  if (a4 < 1)
    return 0;
  v5 = 0;
  v6 = a2 | (a1 << 16);
  while (1)
  {
    v7 = v4 + v5;
    if (v4 + v5 < 0 != __OFADD__(v4, v5))
      ++v7;
    v8 = v7 >> 1;
    v9 = (uint64_t)v7 >> 1;
    v10 = *(unsigned __int16 *)(a3 + 6 * v8 + 2) | (*(unsigned __int16 *)(a3 + 6 * v8) << 16);
    if (v6 == v10)
      break;
    if (v6 <= v10)
      v4 = v9 - 1;
    else
      v5 = v9 + 1;
    if (v5 > v4)
      return 0;
  }
  return *(unsigned __int16 *)(a3 + 6 * (int)v9 + 4);
}

BOOL HangulSyllable::SplitJamoCompound(HangulSyllable *this, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int16 *v9;

  v4 = 0;
  v5 = 22;
  while (1)
  {
    v6 = v5 + v4;
    if (v5 + v4 < 0 != __OFADD__(v5, v4))
      ++v6;
    v7 = (uint64_t)v6 >> 1;
    v8 = gCompoundJamoTable[3 * (v6 >> 1) + 2];
    if (v8 == (_DWORD)this)
      break;
    if (v8 >= this)
      v5 = v7 - 1;
    else
      v4 = v7 + 1;
    if (v4 > v5)
      return v8 == (_DWORD)this;
  }
  v9 = &gCompoundJamoTable[3 * (int)v7];
  *a2 = *v9;
  *a3 = v9[1];
  return v8 == (_DWORD)this;
}

uint64_t HangulSyllable::DoubleCho(HangulSyllable *this, int a2)
{
  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToChoMap[this - 12593];
  if ((a2 - 12593) <= 0x5D)
    a2 = gCompatibilityJamoToChoMap[a2 - 12593];
  return SearchForJamoCompound((int)this, a2, (uint64_t)gDoubleChoTable, 5);
}

uint64_t HangulSyllable::DoubleJung(HangulSyllable *this, int a2, int a3)
{
  int v4;
  int v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  unsigned int v8;
  int v9;
  uint64_t result;
  int v11;

  v4 = a2;
  v5 = (int)this;
  v6 = (_WORD)this - 12593;
  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToJungMap[this - 12593];
  v7 = a2 - 12593;
  if ((a2 - 12593) <= 0x5D)
    a2 = gCompatibilityJamoToJungMap[a2 - 12593];
  v8 = v6;
  v9 = SearchForJamoCompound((int)this, a2, (uint64_t)&gExtendedDoubleJungTable, 4);
  if (v8 <= 0x5D)
    v5 = gCompatibilityJamoToJungMap[v5 - 12593];
  if (v7 <= 0x5Du)
    v4 = gCompatibilityJamoToJungMap[v4 - 12593];
  LODWORD(result) = SearchForJamoCompound(v5, v4, (uint64_t)gDoubleJungTable, 26);
  if (v9)
    v11 = a3;
  else
    v11 = 1;
  if (v11)
    return result;
  else
    return 0;
}

uint64_t HangulSyllable::DoubleJong(HangulSyllable *this, int a2)
{
  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToJongMap[this - 12593];
  if ((a2 - 12593) <= 0x5D)
    a2 = gCompatibilityJamoToJongMap[a2 - 12593];
  return SearchForJamoCompound((int)this, a2, (uint64_t)gDoubleJongTable, 11);
}

uint64_t HangulSyllable::ChoLeftHalf(HangulSyllable *this)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;

  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToChoMap[this - 12593];
  v1 = 0;
  v2 = 4;
  while (1)
  {
    v3 = v1 + v2;
    v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    v5 = v4 >> 1;
    v6 = (uint64_t)v4 >> 1;
    v7 = gDoubleChoTable[3 * v5 + 2];
    if (v7 == (_DWORD)this)
      break;
    if (v7 >= this)
      v2 = v6 - 1;
    else
      v1 = v6 + 1;
    if (v1 > v2)
      return 0;
  }
  if ((v3 + 3) < 2)
    return 0;
  return gDoubleChoTable[3 * (int)v6];
}

uint64_t HangulSyllable::ChoRightHalf(HangulSyllable *this)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;

  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToChoMap[this - 12593];
  v1 = 0;
  v2 = 4;
  while (1)
  {
    v3 = v1 + v2;
    v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    v5 = v4 >> 1;
    v6 = (uint64_t)v4 >> 1;
    v7 = gDoubleChoTable[3 * v5 + 2];
    if (v7 == (_DWORD)this)
      break;
    if (v7 >= this)
      v2 = v6 - 1;
    else
      v1 = v6 + 1;
    if (v1 > v2)
      return 0;
  }
  if ((v3 + 3) < 2)
    return 0;
  return gDoubleChoTable[3 * (int)v6 + 1];
}

uint64_t HangulSyllable::VowelLeftHalf(HangulSyllable *this)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;

  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToJungMap[this - 12593];
  v1 = 0;
  v2 = 25;
  while (1)
  {
    v3 = v1 + v2;
    v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    v5 = v4 >> 1;
    v6 = (uint64_t)v4 >> 1;
    v7 = gDoubleJungTable[3 * v5 + 2];
    if (v7 == (_DWORD)this)
      break;
    if (v7 >= this)
      v2 = v6 - 1;
    else
      v1 = v6 + 1;
    if (v1 > v2)
      return 0;
  }
  if ((v3 + 3) < 2)
    return 0;
  return gDoubleJungTable[3 * (int)v6];
}

uint64_t HangulSyllable::VowelRightHalf(HangulSyllable *this)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;

  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToJungMap[this - 12593];
  v1 = 0;
  v2 = 25;
  while (1)
  {
    v3 = v1 + v2;
    v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    v5 = v4 >> 1;
    v6 = (uint64_t)v4 >> 1;
    v7 = gDoubleJungTable[3 * v5 + 2];
    if (v7 == (_DWORD)this)
      break;
    if (v7 >= this)
      v2 = v6 - 1;
    else
      v1 = v6 + 1;
    if (v1 > v2)
      return 0;
  }
  if ((v3 + 3) < 2)
    return 0;
  return gDoubleJungTable[3 * (int)v6 + 1];
}

uint64_t HangulSyllable::JongLeftHalf(HangulSyllable *this)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;

  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToJongMap[this - 12593];
  v1 = 0;
  v2 = 10;
  while (1)
  {
    v3 = v1 + v2;
    v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    v5 = v4 >> 1;
    v6 = (uint64_t)v4 >> 1;
    v7 = gDoubleJongTable[3 * v5 + 2];
    if (v7 == (_DWORD)this)
      break;
    if (v7 >= this)
      v2 = v6 - 1;
    else
      v1 = v6 + 1;
    if (v1 > v2)
      return 0;
  }
  if ((v3 + 3) < 2)
    return 0;
  return gDoubleJongTable[3 * (int)v6];
}

uint64_t HangulSyllable::JongRightHalf(HangulSyllable *this)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;

  if (((_DWORD)this - 12593) <= 0x5D)
    LODWORD(this) = gCompatibilityJamoToJongMap[this - 12593];
  v1 = 0;
  v2 = 10;
  while (1)
  {
    v3 = v1 + v2;
    v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    v5 = v4 >> 1;
    v6 = (uint64_t)v4 >> 1;
    v7 = gDoubleJongTable[3 * v5 + 2];
    if (v7 == (_DWORD)this)
      break;
    if (v7 >= this)
      v2 = v6 - 1;
    else
      v1 = v6 + 1;
    if (v1 > v2)
      return 0;
  }
  if ((v3 + 3) < 2)
    return 0;
  return gDoubleJongTable[3 * (int)v6 + 1];
}

void HangulSyllable::HangulSyllable(HangulSyllable *this, __int16 a2)
{
  *(_DWORD *)&this->var0 = 0;
  this->var2 = 0;
  if ((unsigned __int16)((unsigned __int16)(a2 + 21504) >> 2) <= 0xAE8u)
  {
    this->var0 = ((28533 * (unsigned __int16)(a2 + 21504)) >> 24) | 0x1100;
    this->var1 = (unsigned __int16)(a2 + 21504) % 0x24Cu / 0x1C + 4449;
    if ((unsigned __int16)(a2 + 21504) % 0x1Cu)
      this->var2 = (unsigned __int16)(a2 + 21504) % 0x1Cu + 4519;
  }
}

__CFString *__composeJamo(const __CFString *a1, Hangul2SetAutomata *a2)
{
  __CFString *Mutable;
  uint64_t Length;
  CFIndex i;
  HangulSyllable *CharacterAtIndex;
  BOOL v9;
  UniChar chars;

  Mutable = 0;
  if (a1)
  {
    if (a2)
    {
      Length = CFStringGetLength(a1);
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Length);
      if (Mutable)
      {
        Hangul2SetAutomata::Reset(a2);
        if (Length >= 1)
        {
          for (i = 0; i != Length; ++i)
          {
            chars = 0;
            CharacterAtIndex = (HangulSyllable *)CFStringGetCharacterAtIndex(a1, i);
            chars = (unsigned __int16)CharacterAtIndex;
            v9 = 0;
            if (Hangul2SetAutomata::SendUniChar(a2, CharacterAtIndex, &v9))
              Hangul2SetAutomata::AppendComposedHangul(a2, Mutable);
            else
              CFStringAppendCharacters(Mutable, &chars, 1);
          }
        }
      }
    }
  }
  return Mutable;
}

void _GLOBAL__sub_I_TIKeyboardInputManager_ko_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x234902AEC]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232330000);
  objc_autoreleasePoolPop(v0);
}

void TIInputManager_ko::TIInputManager_ko(TIInputManager_ko *this)
{
  uint64_t v1;

  TIInputManager::TIInputManager(this);
  *(_QWORD *)v1 = &off_250128870;
  *(_BYTE *)(v1 + 708) = 0;
}

{
  uint64_t v1;

  TIInputManager::TIInputManager(this);
  *(_QWORD *)v1 = &off_250128870;
  *(_BYTE *)(v1 + 708) = 0;
}

void TIInputManager_ko::~TIInputManager_ko(TIInputManager_ko *this)
{
  TIInputManager::~TIInputManager(this);
  JUMPOUT(0x234902A68);
}

uint64_t TIInputManager_ko::set_is_10key(uint64_t this, int a2)
{
  if (*(unsigned __int8 *)(this + 708) != a2)
  {
    *(_BYTE *)(this + 708) = a2;
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(this + 184) + 136))(*(_QWORD *)(this + 184));
  }
  return this;
}

uint64_t TIInputManager_ko::is_10key(TIInputManager_ko *this)
{
  return *((unsigned __int8 *)this + 708);
}

void TIInputManager_ko::completion_candidates(TIInputManager *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  void **v5[4];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 708))
  {
    TIInputManager::input_stem(this);
    compose_10key_vowels((const KB::String *)&v6, (uint64_t)v15);
    KB::String::~String((KB::String *)&v6);
    TIInputManager::predictions_for_string();
    TIInputManager::input_stem(this);
    *(_OWORD *)a2 = v6;
    *(_QWORD *)(a2 + 16) = v7;
    v6 = 0uLL;
    *(_OWORD *)(a2 + 24) = v8;
    *(_QWORD *)(a2 + 40) = v9;
    v7 = 0;
    v8 = 0uLL;
    v9 = 0;
    *(_OWORD *)(a2 + 48) = v10;
    *(_QWORD *)(a2 + 64) = v11;
    v10 = 0uLL;
    *(_OWORD *)(a2 + 72) = v12;
    v11 = 0;
    *(_QWORD *)&v12 = 0;
    v4 = v14;
    *(_QWORD *)(a2 + 88) = v13;
    *(_QWORD *)(a2 + 96) = v4;
    *((_QWORD *)&v12 + 1) = 0;
    v13 = 0;
    KB::String::String();
    KB::String::~String((KB::String *)v5);
    v5[0] = (void **)&v12;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v5);
    v5[0] = (void **)&v10;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v5);
    v5[0] = (void **)&v8;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v5);
    v5[0] = (void **)&v6;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v5);
    KB::String::~String((KB::String *)v15);
  }
  else
  {
    TIInputManager::completion_candidates();
  }
}

void compose_10key_vowels(const KB::String *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, unsigned __int16 *);
  char *v5;
  int v6;
  int v7;
  char *v8;
  unsigned __int16 v9;
  uint64_t *v10;
  int v11;
  char *v12;
  int v13;
  int v14;
  int v15;
  char *v16;
  int v17;
  int v18;
  unsigned int v19;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, unsigned __int16 *);
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)();
  void (*v33)(uint64_t);
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30 = &v29;
  v31 = 0x4802000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  KB::String::String((KB::String *)v34);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 0x40000000;
  v4 = ___ZL20compose_10key_vowelsRKN2KB6StringE_block_invoke;
  v21 = ___ZL20compose_10key_vowelsRKN2KB6StringE_block_invoke;
  v22 = &unk_2501288D8;
  v23 = &v25;
  v24 = &v29;
  v5 = (char *)*((_QWORD *)a1 + 1);
  if (!v5)
    v5 = (char *)a1 + 16;
  v16 = v5;
  v6 = *(unsigned __int16 *)a1;
  v17 = 0;
  v18 = v6;
  v19 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v16);
  v7 = *(unsigned __int16 *)a1;
  v8 = (char *)*((_QWORD *)a1 + 1);
  if (!v8)
    v8 = (char *)a1 + 16;
  v12 = v8;
  v13 = v7;
  v14 = v7;
  v15 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v12);
  if (v17 != v13)
  {
    while (1)
    {
      v9 = v19;
      if (HIWORD(v19) || HangulSyllable::GetJamoType((HangulSyllable *)(unsigned __int16)v19) != 1)
      {
        ((void (*)(_QWORD *))v21)(v20);
        KB::String::append((KB::String *)(v30 + 5));
      }
      else
      {
        v10 = v26;
        if (!*((_WORD *)v26 + 12))
          goto LABEL_15;
        v11 = HangulSyllable::DoubleJung((HangulSyllable *)*((unsigned __int16 *)v26 + 12), v9, 1);
        if (!v11)
        {
          ((void (*)(_QWORD *))v21)(v20);
          v10 = v26;
LABEL_15:
          *((_WORD *)v10 + 12) = v9;
          goto LABEL_12;
        }
        *((_WORD *)v26 + 12) = v11;
      }
LABEL_12:
      KB::String::iterator::operator++();
      if (v17 == v13)
      {
        v4 = v21;
        break;
      }
    }
  }
  ((void (*)(_QWORD *))v4)(v20);
  MEMORY[0x2349029D8](a2, v30 + 5);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  KB::String::~String((KB::String *)v34);
}

void TIInputManager_ko::autocorrections(TIInputManager *this@<X0>, uint64_t a2@<X8>)
{
  const KB::Candidate *v4[3];
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[32];
  void **v9[125];
  _BYTE v10[32];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 708))
  {
    if (*((_DWORD *)this + 24))
    {
      TIInputManager::input_stem(this);
      compose_10key_vowels((const KB::String *)v9, (uint64_t)v10);
      KB::String::~String((KB::String *)v9);
      TIInputManager::predictions_for_string();
      if (v4[0] == v4[1])
      {
        MEMORY[0x2349029FC](v9, v10, 0);
        TIInputManager::input_stem(this);
        std::vector<KB::Candidate>::vector((_QWORD *)a2, 1uLL, (const KB::Candidate *)v9);
        *(_DWORD *)(a2 + 100) = 0;
        *(_OWORD *)(a2 + 24) = 0u;
        *(_OWORD *)(a2 + 40) = 0u;
        *(_OWORD *)(a2 + 56) = 0u;
        *(_OWORD *)(a2 + 72) = 0u;
        *(_QWORD *)(a2 + 88) = 0;
        KB::String::String();
        KB::String::~String((KB::String *)v8);
        MEMORY[0x234902A08](v9);
      }
      else
      {
        TIInputManager::input_stem(this);
        std::vector<KB::Candidate>::vector((_QWORD *)a2, 1uLL, v4[0]);
        *(_DWORD *)(a2 + 100) = 0;
        *(_OWORD *)(a2 + 24) = 0u;
        *(_OWORD *)(a2 + 40) = 0u;
        *(_OWORD *)(a2 + 56) = 0u;
        *(_OWORD *)(a2 + 72) = 0u;
        *(_QWORD *)(a2 + 88) = 0;
        KB::String::String();
        KB::String::~String((KB::String *)v9);
      }
      v9[0] = (void **)&v7;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v9);
      v9[0] = (void **)&v6;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v9);
      v9[0] = (void **)&v5;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v9);
      v9[0] = (void **)v4;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v9);
      KB::String::~String((KB::String *)v10);
    }
    else
    {
      *(_DWORD *)(a2 + 100) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      KB::String::String((KB::String *)(a2 + 104));
    }
  }
  else
  {
    TIInputManager::autocorrections();
  }
}

void TIInputManager::filter_pre_lookup_input()
{
  JUMPOUT(0x2349029D8);
}

void TIInputManager::internal_string_to_external(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

void TIInputManager::external_string_to_internal(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

uint64_t TIInputManager::should_exclude_filter_corrections_if_any_candidate_matches_input(TIInputManager *this)
{
  return 0;
}

uint64_t __Block_byref_object_copy_()
{
  return KB::String::String();
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  KB::String::~String((KB::String *)(a1 + 40));
}

uint64_t ___ZL20compose_10key_vowelsRKN2KB6StringE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5;
  uint64_t result;
  KB::String *v7;
  uint64_t v8;
  KB::String *v9;
  HangulSyllable *v10;
  HangulSyllable *v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(unsigned __int16 *)(v5 + 24);
  if (*(_WORD *)(v5 + 24))
  {
    LODWORD(v11) = 0;
    if (HangulSyllable::SplitJamoCompound((HangulSyllable *)result, (unsigned __int16 *)&v11 + 1, (unsigned __int16 *)&v11, a4))
    {
      v7 = (KB::String *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      HangulSyllable::JungToCompatibility((HangulSyllable *)WORD1(v11));
      KB::String::append(v7);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40;
      HangulSyllable::JungToCompatibility((HangulSyllable *)(unsigned __int16)v11);
      v9 = (KB::String *)v8;
    }
    else
    {
      v10 = (HangulSyllable *)*(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      if ((_DWORD)v10 == 4514)
      {
        KB::String::append((KB::String *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        v9 = (KB::String *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      else
      {
        if (HangulSyllable::GetJamoType(v10) != 1)
          *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HangulSyllable::JungToCompatibility((HangulSyllable *)*(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        v9 = (KB::String *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
    }
    result = KB::String::append(v9);
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = MEMORY[0x234902A08](v4 - 1000);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *std::vector<KB::Candidate>::vector(_QWORD *a1, unint64_t a2, const KB::Candidate *a3)
{
  KB::Candidate *v6;
  uint64_t v7;
  char *v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100](a1, a2);
    v6 = (KB::Candidate *)a1[1];
    v7 = 1000 * a2;
    v8 = (char *)v6 + 1000 * a2;
    do
    {
      v6 = (KB::Candidate *)((char *)KB::Candidate::Candidate(v6, a3) + 1000);
      v7 -= 1000;
    }
    while (v7);
    a1[1] = v8;
  }
  return a1;
}

char *std::vector<KB::Candidate>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x4189374BC6A7F0)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::Candidate>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[1000 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<KB::Candidate>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x4189374BC6A7F0)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(1000 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

KB::Candidate *KB::Candidate::Candidate(KB::Candidate *this, const KB::Candidate *a2)
{
  _QWORD *v4;
  __int128 v5;
  __int128 v6;
  std::string *v7;
  __int128 v8;
  const void *v9;
  const void *v10;

  v4 = WTF::Vector<KB::Word,3ul>::Vector(this, a2);
  v5 = *(_OWORD *)((char *)a2 + 744);
  v6 = *(_OWORD *)((char *)a2 + 760);
  v4[97] = *((_QWORD *)a2 + 97);
  *(_OWORD *)(v4 + 93) = v5;
  *(_OWORD *)(v4 + 95) = v6;
  KB::LanguageModelContext::LanguageModelContext((uint64_t)(v4 + 98), (uint64_t)a2 + 784);
  MEMORY[0x2349029D8]((char *)this + 888, (char *)a2 + 888);
  v7 = (std::string *)((char *)this + 920);
  if (*((char *)a2 + 943) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *((const std::string::value_type **)a2 + 115), *((_QWORD *)a2 + 116));
  }
  else
  {
    v8 = *(_OWORD *)((char *)a2 + 920);
    *((_QWORD *)this + 117) = *((_QWORD *)a2 + 117);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  KB::ByteString::copy();
  *((_OWORD *)this + 60) = *((_OWORD *)a2 + 60);
  v9 = (const void *)*((_QWORD *)a2 + 122);
  *((_QWORD *)this + 122) = v9;
  if (v9)
  {
    CFRetain(v9);
    *((_QWORD *)this + 122) = v9;
  }
  v10 = (const void *)*((_QWORD *)a2 + 123);
  *((_QWORD *)this + 123) = v10;
  if (v10)
  {
    CFRetain(v10);
    *((_QWORD *)this + 123) = v10;
  }
  *((_DWORD *)this + 248) = *((_DWORD *)a2 + 248);
  return this;
}

_QWORD *WTF::Vector<KB::Word,3ul>::Vector(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[2];
  v5 = a1 + 3;
  *a1 = *a2;
  a1[1] = v5;
  a1[2] = 3;
  if (v4 < 4 || (a1[2] = v4, v5 = malloc_type_malloc(240 * v4, 0x10B2040DF775671uLL), (a1[1] = v5) != 0))
  {
    v6 = *a2;
    if (*a2)
    {
      v7 = a2[1];
      v8 = 240 * v6;
      do
      {
        v5 = (void *)(KB::Word::Word((uint64_t)v5, v7) + 240);
        v7 += 240;
        v8 -= 240;
      }
      while (v8);
    }
  }
  return a1;
}

uint64_t KB::Word::Word(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  MEMORY[0x2349029D8]();
  KB::ByteString::copy();
  v4 = *(_QWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v4;
  MEMORY[0x2349029D8](a1 + 64, a2 + 64);
  v5 = *(_OWORD *)(a2 + 96);
  v6 = *(_OWORD *)(a2 + 112);
  v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v7;
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = v6;
  MEMORY[0x2349029D8](a1 + 160, a2 + 160);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  std::unordered_set<unsigned long long>::unordered_set(a1 + 200, a2 + 200);
  return a1;
}

uint64_t std::unordered_set<unsigned long long>::unordered_set(uint64_t a1, uint64_t a2)
{
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(a1, i + 2, i + 2);
  return a1;
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

_QWORD *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

uint64_t KB::LanguageModelContext::LanguageModelContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  std::vector<TITokenID>::vector((_QWORD *)(a1 + 16), a2 + 16);
  v7 = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v7;
  language_modeling::v1::LinguisticContext::LinguisticContext();
  language_modeling::v1::LinguisticContext::LinguisticContext();
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>((std::string *)(a1 + 80), *(__int128 **)(a2 + 80), *(__int128 **)(a2 + 88), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 88) - *(_QWORD *)(a2 + 80)) >> 3));
  return a1;
}

_QWORD *std::vector<TITokenID>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  const void *v4;
  int64_t v5;
  char *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v5 = v3 - *(_QWORD *)a2;
  if (v3 != *(_QWORD *)a2)
  {
    std::vector<TITokenID>::__vallocate[abi:nn180100](a1, v5 >> 3);
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<TITokenID>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TITokenID>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<TITokenID>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a2);
}

std::string *std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:nn180100](result, a4);
    result = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((int)v6 + 16, a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

char *std::vector<std::string>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(int a1, __int128 *a2, __int128 *a3, std::string *this)
{
  __int128 *v6;
  __int128 v7;

  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
      }
      else
      {
        v7 = *v6;
        this->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      ++this;
    }
    while (v6 != a3);
  }
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t _GLOBAL__sub_I_TIInputManager_ko_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_232330000);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x24BDBC5B8](theString, range.location, range.length);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

uint64_t TIInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x24BEB4F90]();
}

uint64_t TIInputModeGetSWLayout()
{
  return MEMORY[0x24BEB4FD8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t TIInputManager::autocorrections()
{
  return MEMORY[0x24BEB55E0]();
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x24BEB55F8](this);
}

uint64_t TIInputManager::completion_candidates()
{
  return MEMORY[0x24BEB5618]();
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5690](this);
}

void TIInputManager::~TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5698](this);
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext()
{
  return MEMORY[0x24BE5ED20]();
}

uint64_t KB::ByteString::copy()
{
  return MEMORY[0x24BEB56C8]();
}

uint64_t KB::String::append(KB::String *this)
{
  return MEMORY[0x24BEB5820](this);
}

uint64_t KB::String::iterator::initialize(KB::String::iterator *this)
{
  return MEMORY[0x24BEB5828](this);
}

uint64_t KB::String::iterator::operator++()
{
  return MEMORY[0x24BEB5830]();
}

uint64_t KB::String::String()
{
  return MEMORY[0x24BEB5840]();
}

uint64_t KB::String::String(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x24BEB5850](this, a2);
}

uint64_t KB::String::String(KB::String *this)
{
  return MEMORY[0x24BEB5860](this);
}

void KB::String::~String(KB::String *this)
{
  MEMORY[0x24BEB5868](this);
}

uint64_t KB::Candidate::Candidate(KB::Candidate *this, const KB::String *a2)
{
  return MEMORY[0x24BEB5890](this, a2);
}

void KB::Candidate::~Candidate(KB::Candidate *this)
{
  MEMORY[0x24BEB5898](this);
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x24BEB58B0](this, a2);
}

uint64_t TIInputManager::input_stem(TIInputManager *this)
{
  return MEMORY[0x24BEB5938](this);
}

uint64_t TIInputManager::input_string(TIInputManager *this)
{
  return MEMORY[0x24BEB5948](this);
}

uint64_t TIInputManager::is_uppercase(TIInputManager *this)
{
  return MEMORY[0x24BEB5950](this);
}

uint64_t TIInputManager::predictions_for_string()
{
  return MEMORY[0x24BEB5978]();
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void operator delete(void *__p)
{
  off_250128690(__p);
}

uint64_t operator delete()
{
  return off_250128698();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2501286A0(__sz);
}

uint64_t operator new()
{
  return off_2501286A8();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

uint64_t uset_contains()
{
  return MEMORY[0x24BEDC2F0]();
}

