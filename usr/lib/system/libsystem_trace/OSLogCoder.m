@implementation OSLogCoder

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  $739BC0F1D3439A0CFAF08FD8C25CE86A *fmt_cmd;
  os_trace_blob_s *ob;
  uint64_t written;
  unint64_t maxsz;
  unint64_t v11;
  BOOL v12;
  size_t v13;
  uint64_t ob_len;
  unsigned int v15;

  fmt_cmd = self->_fmt_cmd;
  if ((*(_BYTE *)fmt_cmd & 7) == 0)
    *(_BYTE *)fmt_cmd |= 1u;
  if (!self->_initialized)
    -[OSLogCoder _initBlob](self, "_initBlob");
  ob = self->_ob;
  if (ob)
  {
    written = self->_written;
    maxsz = self->_maxsz;
    v11 = written + a4;
    if (__CFADD__(written, a4) || (!(v11 >> 16) ? (v12 = v11 >= maxsz) : (v12 = 1), v12))
    {
      self->_truncated = 1;
      LOWORD(v11) = maxsz;
    }
    if ((ob->ob_flags & 2) == 0)
    {
      v13 = (unsigned __int16)v11 - written;
      ob_len = ob->ob_len;
      if (v13 > (ob->ob_binary + ob->ob_size - ob_len - 1))
      {
        os_trace_blob_add_slow((uint64_t)ob, (void *)a3, v13);
      }
      else
      {
        memcpy(&ob->var0.ob_b[ob_len], a3, v13);
        v15 = ob->ob_len + v13;
        ob->ob_len = v15;
        if (!ob->ob_binary)
          ob->var0.ob_b[v15] = 0;
      }
    }
    self->_written = v11;
  }
}

- (void)_initBlob
{
  os_trace_blob_s *ob_priv;

  if ((*(_BYTE *)self->_fmt_cmd & 7) != 0)
  {
    if (privacy_flags2opt[*(_BYTE *)self->_fmt_cmd & 7] <= self->_privacy_level)
    {
      if ((*(_BYTE *)self->_fmt_cmd & 1) != 0)
        ob_priv = self->_ob_priv;
      else
        ob_priv = self->_ob_pub;
      self->_ob = ob_priv;
      if (!ob_priv)
        goto LABEL_10;
    }
    else if (self->_mask)
    {
      self->_ob_mask.var0.ob_b = self->_maskbuf;
      ob_priv = &self->_ob_mask;
      *(_QWORD *)&self->_ob_mask.ob_len = 0x8000000000;
      self->_ob_mask.ob_maxsize = 0;
      self->_ob_mask.ob_flags = 0;
      self->_ob_mask.ob_binary = 1;
      self->_ob = &self->_ob_mask;
      self->_maxsz = 0x10000;
    }
    else
    {
      ob_priv = self->_ob;
      if (!ob_priv)
        goto LABEL_10;
    }
    self->_offset = ob_priv->ob_len;
LABEL_10:
    self->_initialized = 1;
    return;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

- (void)setPublic
{
  $739BC0F1D3439A0CFAF08FD8C25CE86A *fmt_cmd;

  fmt_cmd = self->_fmt_cmd;
  if ((*(_BYTE *)fmt_cmd & 1) != 0)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Cannot force Public over Private";
    __break(1u);
  }
  else
  {
    *(_BYTE *)fmt_cmd |= 2u;
  }
}

- (void)setTruncated
{
  self->_truncated = 1;
}

@end
