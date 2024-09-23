@implementation _PXStoryScrubberClipViewConfiguration

- (_PXStoryScrubberClipViewConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  _PXStoryScrubberClipViewConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PXStoryScrubberClipViewConfiguration;
  v5 = -[PXGFocusEffectViewConfiguration initWithConfiguration:](&v7, sel_initWithConfiguration_, v4);
  if (v5)
  {
    v5->_isCurrent = objc_msgSend(v4, "isCurrent");
    v5->_shouldAdjustContent = objc_msgSend(v4, "shouldAdjustContent");
    v5->_segmentIdentifier = objc_msgSend(v4, "segmentIdentifier");
  }

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXStoryScrubberClipViewConfiguration;
  return -[PXGFocusEffectViewConfiguration hash](&v3, sel_hash) ^ self->_isCurrent ^ (2 * self->_shouldAdjustContent) ^ (4 * self->_segmentIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  _PXStoryScrubberClipViewConfiguration *v4;
  _PXStoryScrubberClipViewConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  BOOL v8;
  int64_t v10;
  objc_super v11;

  v4 = (_PXStoryScrubberClipViewConfiguration *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v11.receiver = self;
      v11.super_class = (Class)_PXStoryScrubberClipViewConfiguration;
      if (-[PXGFocusEffectViewConfiguration isEqual:](&v11, sel_isEqual_, v5)
        && (v6 = -[_PXStoryScrubberClipViewConfiguration isCurrent](self, "isCurrent"),
            v6 == -[_PXStoryScrubberClipViewConfiguration isCurrent](v5, "isCurrent"))
        && (v7 = -[_PXStoryScrubberClipViewConfiguration shouldAdjustContent](self, "shouldAdjustContent"),
            v7 == -[_PXStoryScrubberClipViewConfiguration shouldAdjustContent](v5, "shouldAdjustContent")))
      {
        v10 = -[_PXStoryScrubberClipViewConfiguration segmentIdentifier](self, "segmentIdentifier");
        v8 = v10 == -[_PXStoryScrubberClipViewConfiguration segmentIdentifier](v5, "segmentIdentifier");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)segmentIdentifier
{
  return self->_segmentIdentifier;
}

- (void)setSegmentIdentifier:(int64_t)a3
{
  self->_segmentIdentifier = a3;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (void)setIsCurrent:(BOOL)a3
{
  self->_isCurrent = a3;
}

- (BOOL)shouldAdjustContent
{
  return self->_shouldAdjustContent;
}

- (void)setShouldAdjustContent:(BOOL)a3
{
  self->_shouldAdjustContent = a3;
}

@end
