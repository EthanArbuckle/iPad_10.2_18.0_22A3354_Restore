@implementation WebNodeHighlightView

- (void)_removeAllLayers
{
  NSMutableArray *layers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  layers = self->_layers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](layers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(layers);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "removeFromSuperlayer");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](layers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_layers, "removeAllObjects");
}

- (WebNodeHighlightView)initWithWebNodeHighlight:(id)a3
{
  WebNodeHighlightView *v4;

  v4 = -[WebNodeHighlightView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
  if (v4)
  {
    v4->_webNodeHighlight = (WebNodeHighlight *)a3;
    v4->_layers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[WebNodeHighlightView detachFromWebNodeHighlight](self, "detachFromWebNodeHighlight");
  -[WebNodeHighlightView _removeAllLayers](self, "_removeAllLayers");

  v3.receiver = self;
  v3.super_class = (Class)WebNodeHighlightView;
  -[WebNodeHighlightView dealloc](&v3, sel_dealloc);
}

- (void)detachFromWebNodeHighlight
{

  self->_webNodeHighlight = 0;
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)_attach:(id)a3 numLayers:(unint64_t)a4
{
  unint64_t v4;
  id v7;

  v4 = a4;
  if (-[NSMutableArray count](self->_layers, "count") != a4
    || (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", 0), "superlayer") != a3)
  {
    -[WebNodeHighlightView _removeAllLayers](self, "_removeAllLayers");
    for (; v4; --v4)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      -[NSMutableArray addObject:](self->_layers, "addObject:", v7);
      objc_msgSend(a3, "addSublayer:", v7);
      if (v7)
        CFRelease(v7);
    }
  }
}

- (void)_layoutForNodeHighlight:(void *)a3 parent:(id)a4
{
  CAShapeLayer *v6;
  CAShapeLayer *v7;
  CAShapeLayer *v8;
  uint64_t v9;
  unsigned int v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CAShapeLayer *v15;
  __int128 v16;
  CFTypeRef cf;
  _OWORD v18[2];
  _OWORD v19[2];
  _OWORD v20[2];
  _OWORD v21[2];

  if (*((_DWORD *)a3 + 15))
  {
    -[WebNodeHighlightView _attach:numLayers:](self, "_attach:numLayers:", a4, 4);
    v6 = (CAShapeLayer *)-[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", 0);
    v7 = (CAShapeLayer *)-[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", 1);
    v8 = (CAShapeLayer *)-[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", 2);
    v9 = -[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", 3);
    v10 = *((_DWORD *)a3 + 15);
    if (!v10)
      goto LABEL_13;
    v11 = (_OWORD *)*((_QWORD *)a3 + 6);
    v12 = v11[1];
    v21[0] = *v11;
    v21[1] = v12;
    if (v10 == 1)
    {
      __break(0xC471u);
      JUMPOUT(0x1D80B8904);
    }
    v13 = v11[3];
    v20[0] = v11[2];
    v20[1] = v13;
    if (v10 <= 2)
    {
      __break(0xC471u);
      JUMPOUT(0x1D80B890CLL);
    }
    v14 = v11[5];
    v19[0] = v11[4];
    v19[1] = v14;
    if (v10 == 3)
    {
LABEL_13:
      __break(0xC471u);
      JUMPOUT(0x1D80B88FCLL);
    }
    v15 = (CAShapeLayer *)v9;
    v16 = v11[7];
    v18[0] = v11[6];
    v18[1] = v16;
    WebCore::cachedCGColor();
    -[CAShapeLayer setFillColor:](v6, "setFillColor:", cf);
    if (cf)
      CFRelease(cf);
    WebCore::cachedCGColor();
    -[CAShapeLayer setFillColor:](v7, "setFillColor:", 0);
    WebCore::cachedCGColor();
    -[CAShapeLayer setFillColor:](v8, "setFillColor:", 0);
    WebCore::cachedCGColor();
    -[CAShapeLayer setFillColor:](v15, "setFillColor:", 0);
    layerPathWithHole(v6, (const WebCore::FloatQuad *)v21, (const WebCore::FloatQuad *)v20);
    layerPathWithHole(v7, (const WebCore::FloatQuad *)v20, (const WebCore::FloatQuad *)v19);
    layerPathWithHole(v8, (const WebCore::FloatQuad *)v19, (const WebCore::FloatQuad *)v18);
    layerPath(v15, (const WebCore::FloatQuad *)v18);
  }
  else
  {
    -[WebNodeHighlightView _removeAllLayers](self, "_removeAllLayers");
  }
}

- (void)_layoutForRectsHighlight:(void *)a3 parent:(id)a4
{
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  CAShapeLayer *v10;
  CFTypeRef cf;

  v5 = *((unsigned int *)a3 + 15);
  if ((_DWORD)v5)
  {
    -[WebNodeHighlightView _attach:numLayers:](self, "_attach:numLayers:", a4, v5);
    WebCore::cachedCGColor();
    v7 = 0;
    v8 = 0;
    v9 = 32 * v5;
    do
    {
      v10 = (CAShapeLayer *)-[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", v8);
      -[CAShapeLayer setFillColor:](v10, "setFillColor:", cf);
      if (v8 >= *((unsigned int *)a3 + 15))
      {
        __break(0xC471u);
        return;
      }
      layerPath(v10, (const WebCore::FloatQuad *)(*((_QWORD *)a3 + 6) + v7));
      ++v8;
      v7 += 32;
    }
    while (v9 != v7);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    -[WebNodeHighlightView _removeAllLayers](self, "_removeAllLayers");
  }
}

- (void)layoutSublayers:(id)a3
{
  WebNodeHighlight *webNodeHighlight;
  WebNodeHighlight *v6;
  StringImpl *v7;
  _OWORD v8[2];
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;

  if (self->_webNodeHighlight)
  {
    WebThreadLock();
    webNodeHighlight = self->_webNodeHighlight;
    if (webNodeHighlight)
    {
      -[WebNodeHighlight inspectorController](webNodeHighlight, "inspectorController");
      if (*(_QWORD *)&v8[0])
      {
        v9 = 0;
        memset(v8, 0, sizeof(v8));
        v10 = 1;
        v11 = 0u;
        v12 = 0u;
        v13 = 0u;
        v14 = 1;
        v6 = self->_webNodeHighlight;
        if (v6)
          -[WebNodeHighlight inspectorController](v6, "inspectorController");
        WebCore::InspectorController::getHighlight();
        if (v10 == 3)
        {
          -[WebNodeHighlightView _layoutForRectsHighlight:parent:](self, "_layoutForRectsHighlight:parent:", v8, a3);
        }
        else if (v10 == 1)
        {
          -[WebNodeHighlightView _layoutForNodeHighlight:parent:](self, "_layoutForNodeHighlight:parent:", v8, a3);
        }
        WebCore::InspectorOverlayHighlight::~InspectorOverlayHighlight((WebCore::InspectorOverlayHighlight *)v8, v7);
      }
    }
  }
}

- (id)webNodeHighlight
{
  return self->_webNodeHighlight;
}

@end
