@implementation UISTextLineDrawing

- (UISTextLineDrawing)initWithNonretainedLine:(__CTLine *)a3 lineBreakMode:(unsigned __int8)a4 textAlignment:(unsigned __int8)a5 width:(double)a6 scale:(double)a7
{
  int v8;
  int v9;
  UISTextLineDrawing *v11;
  char v12;
  CFIndex length;
  uint64_t v14;
  __CTLine *TruncatedLineWithTokenHandler;
  double v16;
  CTLineRef JustifiedLine;
  __CTLine *v18;
  float64x2_t v19;
  float64x2_t v20;
  objc_super v23;

  v8 = a5;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UISTextLineDrawing;
  v11 = -[UISTextLineDrawing init](&v23, sel_init);
  if (v11)
  {
    v12 = 0;
    switch(v9)
    {
      case 0:
        length = CTLineGetStringRange(a3).length;
        CGFloatIsValid();
        v14 = CTLineSuggestLineBreakWithOffset();
        goto LABEL_5;
      case 1:
        length = CTLineGetStringRange(a3).length;
        CGFloatIsValid();
        v14 = CTLineSuggestClusterBreakWithOffset();
LABEL_5:
        if (v14 == length)
          goto LABEL_10;
        TruncatedLineWithTokenHandler = (__CTLine *)CTLineCreateFromLineWithOffset();
LABEL_8:
        if (TruncatedLineWithTokenHandler)
        {
          v12 = 1;
LABEL_12:
          CFRelease(a3);
          a3 = TruncatedLineWithTokenHandler;
        }
        else
        {
LABEL_10:
          v12 = 0;
        }
LABEL_13:
        v11->_hasLineBreak = v12;
        v16 = 0.0;
        switch(v8)
        {
          case 1:
            v16 = 1.0;
            break;
          case 2:
            v16 = 0.5;
            break;
          case 3:
            JustifiedLine = CTLineCreateJustifiedLine(a3, 1.0, a6);
            if (JustifiedLine)
            {
              v18 = JustifiedLine;
              CFRelease(a3);
              a3 = v18;
            }
            break;
          case 4:
            if (CTLineIsRightToLeft())
              v16 = 1.0;
            else
              v16 = 0.0;
            break;
          default:
            break;
        }
        v11->_line = a3;
        CTLineGetDefaultBounds();
        v19.f64[0] = a6;
        v19.f64[1] = 0.0 + 0.0;
        v20 = vdivq_f64(vrndpq_f64(vmulq_n_f64(v19, a7)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a7, 0));
        v11->_size = (CGSize)v20;
        v11->_offset.dx = CTLineGetPenOffsetForFlush(v11->_line, v16, v20.f64[0]);
        v11->_offset.dy = round(0.0 * a7) / a7;
        break;
      case 3:
      case 4:
      case 5:
        TruncatedLineWithTokenHandler = (__CTLine *)CTLineCreateTruncatedLineWithTokenHandler();
        if (TruncatedLineWithTokenHandler != a3)
          goto LABEL_8;
        v12 = 0;
        TruncatedLineWithTokenHandler = a3;
        goto LABEL_12;
      default:
        goto LABEL_13;
    }
  }
  return v11;
}

- (UISTextLineDrawing)initWithString:(__CFString *)a3 attributes:(__CFDictionary *)a4 lineBreakMode:(unsigned __int8)a5 textAlignment:(unsigned __int8)a6 width:(double)a7 scale:(double)a8
{
  return -[UISTextLineDrawing initWithNonretainedLine:lineBreakMode:textAlignment:width:scale:](self, "initWithNonretainedLine:lineBreakMode:textAlignment:width:scale:", CTLineCreateWithString(), a5, a6, a7, a8);
}

- (UISTextLineDrawing)initWithAttributedString:(__CFAttributedString *)a3 lineBreakMode:(unsigned __int8)a4 textAlignment:(unsigned __int8)a5 width:(double)a6 scale:(double)a7
{
  return -[UISTextLineDrawing initWithNonretainedLine:lineBreakMode:textAlignment:width:scale:](self, "initWithNonretainedLine:lineBreakMode:textAlignment:width:scale:", CTLineCreateWithAttributedString(a3), a4, a5, a6, a7);
}

- (void)dealloc
{
  __CTLine *line;
  objc_super v4;

  line = self->_line;
  if (line)
    CFRelease(line);
  v4.receiver = self;
  v4.super_class = (Class)UISTextLineDrawing;
  -[UISTextLineDrawing dealloc](&v4, sel_dealloc);
}

- (CGRect)alignmentRect
{
  double width;
  double height;
  double v4;
  double v5;
  CGRect result;

  width = self->_size.width;
  height = self->_size.height;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGSize)drawingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  __int128 v8;
  CGAffineTransform v9;

  y = a4.y;
  x = a4.x;
  CGContextSetFontRenderingStyle();
  CGContextScaleCTM(a3, 1.0, -1.0);
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v9.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGContextSetTextMatrix(a3, &v9);
  CGContextSetTextPosition(a3, x + self->_offset.dx, -(y + self->_offset.dy));
  CTLineDraw(self->_line, a3);
}

- (BOOL)hasLineBreak
{
  return self->_hasLineBreak;
}

@end
