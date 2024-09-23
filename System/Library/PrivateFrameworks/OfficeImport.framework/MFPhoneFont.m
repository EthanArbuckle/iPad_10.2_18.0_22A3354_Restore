@implementation MFPhoneFont

- (__CTFont)createCTFontEquivalent
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  int m_lfHeight;
  __CTFont *v8;
  int m_lfCharSet;
  unint64_t v11;
  int m_pitch;

  if (!-[MFPhoneFont createCTFontEquivalent]::familiesAvailable)
  {
    TCFontFamilyNames();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v3);
    v5 = (void *)-[MFPhoneFont createCTFontEquivalent]::familiesAvailable;
    -[MFPhoneFont createCTFontEquivalent]::familiesAvailable = v4;

  }
  v6 = self->super.m_lfFaceName;
  if (-[NSString isEqualToString:](self->super.m_lfFaceName, "isEqualToString:", CFSTR("ZapfDingbats")))
  {

    v6 = CFSTR("Zapf Dingbats");
  }
  if (-[__CFString length](v6, "length")
    && (objc_msgSend((id)-[MFPhoneFont createCTFontEquivalent]::familiesAvailable, "containsObject:", v6) & 1) != 0)
  {
    goto LABEL_7;
  }
  m_lfCharSet = self->super.m_lfCharSet;
  if (m_lfCharSet <= 160)
  {
    switch(m_lfCharSet)
    {
      case 128:

        v6 = CFSTR("Heiti J");
        break;
      case 129:
      case 130:

        v6 = CFSTR("Heiti K");
        break;
      case 131:
      case 132:
      case 133:
      case 135:
        goto LABEL_7;
      case 134:

        v6 = CFSTR("Heiti SC");
        break;
      case 136:

        v6 = CFSTR("Heiti TC");
        break;
      default:
        if (m_lfCharSet < 2 || m_lfCharSet == 77)
          goto LABEL_28;
        break;
    }
    goto LABEL_7;
  }
  if (m_lfCharSet <= 185)
  {
    if ((m_lfCharSet - 161) >= 3)
    {
      if (m_lfCharSet == 177)
      {

        v6 = CFSTR("Arial Hebrew");
      }
      else if (m_lfCharSet == 178)
      {

        v6 = CFSTR("Gill Sans");
      }
      goto LABEL_7;
    }
    goto LABEL_28;
  }
  if (m_lfCharSet <= 221)
  {
    if (m_lfCharSet != 186 && m_lfCharSet != 204)
      goto LABEL_7;
    goto LABEL_28;
  }
  if (m_lfCharSet == 222)
  {

    v6 = CFSTR("Thonburi");
    goto LABEL_7;
  }
  if (m_lfCharSet == 238 || m_lfCharSet == 255)
  {
LABEL_28:
    HIDWORD(v11) = self->super.m_family;
    LODWORD(v11) = HIDWORD(v11);
    switch((v11 >> 4))
    {
      case 1u:

        v6 = CFSTR("Times New Roman");
        break;
      case 2u:

        v6 = CFSTR("Helvetica");
        break;
      case 3u:

        v6 = CFSTR("Courier New");
        break;
      case 4u:

        v6 = CFSTR("Noteworthy");
        break;
      case 5u:

        v6 = CFSTR("Marker Felt");
        break;
      default:
        m_pitch = self->super.m_pitch;

        if (m_pitch == 1)
          v6 = CFSTR("Courier New");
        else
          v6 = CFSTR("Helvetica");
        break;
    }
  }
LABEL_7:
  m_lfHeight = self->super.m_lfHeight;
  if (m_lfHeight < 0)
    m_lfHeight = -m_lfHeight;
  v8 = TCCreateFontWithFamilyName((NSString *)v6, self->super.m_lfWeight > 400, self->super.m_lfItalic, (double)m_lfHeight);

  return v8;
}

@end
