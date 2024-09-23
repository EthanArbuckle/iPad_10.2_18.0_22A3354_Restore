@implementation WMFReader

- (WMFReader)initWithWMFPlayer:(id)a3
{
  objc_storeStrong((id *)&self->m_player, a3);
  return self;
}

- (int)play:(id)a3
{
  id v4;
  int v5;
  int v6;

  v4 = objc_retainAutorelease(a3);
  self->m_pBuffer = (const char *)objc_msgSend(v4, "bytes");
  self->m_length = objc_msgSend(v4, "length");
  self->m_cursor = 0;
  self->m_recordsRead = 0;
  v5 = -[WMFReader playHeaders](self, "playHeaders");
  if (!v5)
  {
    while (1)
    {
      v6 = -[WMFReader playRecord](self, "playRecord");
      LOBYTE(v5) = (v6 == -7) | v5;
      if (v6 != -7)
      {
        if (v6)
          break;
      }
      ++self->m_recordsRead;
    }
    if ((v5 & 1) != 0)
      v5 = -7;
    else
      v5 = v6;
  }
  -[WMFPlayer done](self->m_player, "done");

  return v5;
}

- (int)playHeaders
{
  uint64_t v3;
  int v4;
  int v6;

  v3 = 18;
  v4 = -[WMFReader checkBytesAvailable:](self, "checkBytesAvailable:", 18);
  if (!v4)
  {
    if (*(_DWORD *)self->m_pBuffer == -1698247209)
      v3 = 40;
    else
      v3 = 18;
  }
  if (-[WMFReader checkBytesAvailable:](self, "checkBytesAvailable:", v3) | v4)
    return -7;
  v6 = -[WMFPlayer playHeader:in_pRecord:](self->m_player, "playHeader:in_pRecord:", v3, self->m_pBuffer);
  -[WMFReader moveDataCursor:](self, "moveDataCursor:", v3);
  return v6;
}

- (int)checkBytesAvailable:(unsigned int)a3
{
  unint64_t v4;
  int result;

  v4 = self->m_cursor + (unint64_t)a3;
  result = -2;
  if (!HIDWORD(v4))
  {
    if (self->m_length >= v4)
      return 0;
    else
      return -2;
  }
  return result;
}

- (int)moveDataCursor:(unsigned int)a3
{
  self->m_pBuffer += a3;
  self->m_cursor += a3;
  return 0;
}

- (int)playRecord
{
  uint64_t v3;
  int v4;
  unsigned int v5;

  if (self->m_cursor >= self->m_length)
    return -2;
  if (-[WMFReader checkBytesAvailable:](self, "checkBytesAvailable:", 4))
    goto LABEL_3;
  v5 = *(_DWORD *)self->m_pBuffer;
  if (v5 < 3)
    return -2;
  if ((v5 & 0x80000000) == 0)
  {
    v3 = 2 * v5;
    if (!-[WMFReader checkBytesAvailable:](self, "checkBytesAvailable:", v3))
    {
      v4 = -[WMFPlayer play:in_pRecord:](self->m_player, "play:in_pRecord:", v3, self->m_pBuffer);
      goto LABEL_4;
    }
  }
LABEL_3:
  v3 = self->m_length - self->m_cursor;
  v4 = -7;
LABEL_4:
  -[WMFReader moveDataCursor:](self, "moveDataCursor:", v3);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_player, 0);
}

@end
