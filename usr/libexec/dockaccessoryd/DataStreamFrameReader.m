@implementation DataStreamFrameReader

- (DataStreamFrameReader)init
{
  DataStreamFrameReader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DataStreamFrameReader;
  result = -[DataStreamFrameReader init](&v3, "init");
  if (result)
  {
    *(_WORD *)&result->_headerInfoRead = 0;
    result->_payloadLength = 0;
    result->_currentframeType = 0;
  }
  return result;
}

- (BOOL)hasFailed
{
  return self->_streamFailed;
}

- (BOOL)hasCompleteFrame
{
  return !-[DataStreamFrameReader hasFailed](self, "hasFailed")
      && -[DataStreamFrameReader bytesNeededForCurrentFrame](self, "bytesNeededForCurrentFrame") == 0;
}

- (BOOL)hasPartialData
{
  return self->_partialFrame
      && -[DataStreamFrameReader bytesNeededForCurrentFrame](self, "bytesNeededForCurrentFrame") != 0;
}

- (unint64_t)_getCurrentFrameSize
{
  unsigned int v2;

  v2 = self->_currentframeType - 1;
  if (v2 > 2)
    return 0;
  else
    return self->_payloadLength + qword_1001DD458[(char)v2];
}

- (unint64_t)bytesNeededForCurrentFrame
{
  NSObject *partialFrame;
  size_t size;
  size_t v6;
  unint64_t v7;

  if (-[DataStreamFrameReader hasFailed](self, "hasFailed"))
    return 0;
  partialFrame = self->_partialFrame;
  if (!partialFrame)
    return 4;
  size = dispatch_data_get_size(partialFrame);
  v6 = size;
  if (!self->_headerInfoRead)
    return 4 - size;
  v7 = -[DataStreamFrameReader _getCurrentFrameSize](self, "_getCurrentFrameSize");
  if (v7 >= v6)
    return v7 - v6;
  else
    return 0;
}

- (void)pushFrameData:(id)a3
{
  NSObject *partialFrame;
  OS_dispatch_data *concat;
  OS_dispatch_data *v6;
  NSObject *data2;

  data2 = a3;
  if (!-[DataStreamFrameReader hasFailed](self, "hasFailed"))
  {
    partialFrame = self->_partialFrame;
    if (partialFrame)
      concat = (OS_dispatch_data *)dispatch_data_create_concat(partialFrame, data2);
    else
      concat = data2;
    v6 = self->_partialFrame;
    self->_partialFrame = concat;

    -[DataStreamFrameReader _readFrameHeaderIfPossible](self, "_readFrameHeaderIfPossible");
  }

}

- (void)_readFrameHeaderIfPossible
{
  unsigned __int8 *p_currentframeType;
  unint64_t *p_payloadLength;
  _BOOL4 v5;
  OS_dispatch_data *partialFrame;
  OS_dispatch_data *v7;

  if (!self->_headerInfoRead)
  {
    p_currentframeType = &self->_currentframeType;
    p_payloadLength = &self->_payloadLength;
    v5 = +[DataStreamMessageCoder readHeaderFromPartialData:frameType:payloadLength:](DataStreamMessageCoder, "readHeaderFromPartialData:frameType:payloadLength:", self->_partialFrame, &self->_currentframeType, &self->_payloadLength);
    self->_headerInfoRead = v5;
    if (v5)
    {
      if (*p_payloadLength - 1048572 <= 0xFFFFFFFFFFEFFFFFLL)
      {
        partialFrame = self->_partialFrame;
        self->_partialFrame = 0;

        self->_streamFailed = 1;
      }
      if (*p_currentframeType - 1 >= 3)
      {
        v7 = self->_partialFrame;
        self->_partialFrame = 0;

        self->_streamFailed = 1;
      }
    }
  }
}

- (void)reset
{
  OS_dispatch_data *partialFrame;

  partialFrame = self->_partialFrame;
  self->_partialFrame = 0;

  *(_WORD *)&self->_headerInfoRead = 0;
}

- (id)popRawFrame
{
  size_t v3;
  dispatch_data_t subrange;
  NSObject *partialFrame;
  size_t size;
  size_t v7;
  dispatch_data_t v8;

  if (-[DataStreamFrameReader hasCompleteFrame](self, "hasCompleteFrame"))
  {
    v3 = -[DataStreamFrameReader _getCurrentFrameSize](self, "_getCurrentFrameSize");
    subrange = dispatch_data_create_subrange((dispatch_data_t)self->_partialFrame, 0, v3);
    partialFrame = self->_partialFrame;
    size = dispatch_data_get_size(partialFrame);
    v7 = size - v3;
    if (size == v3)
    {
      -[DataStreamFrameReader reset](self, "reset", v7);
    }
    else
    {
      v8 = dispatch_data_create_subrange(partialFrame, v3, v7);
      -[DataStreamFrameReader reset](self, "reset");
      -[DataStreamFrameReader pushFrameData:](self, "pushFrameData:", v8);

    }
  }
  else
  {
    subrange = 0;
  }
  return subrange;
}

+ (id)logCategory
{
  if (qword_100271688 != -1)
    dispatch_once(&qword_100271688, &stru_100236F50);
  return (id)qword_100271690;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialFrame, 0);
}

@end
