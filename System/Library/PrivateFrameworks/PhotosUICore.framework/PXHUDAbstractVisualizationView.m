@implementation PXHUDAbstractVisualizationView

- (void)setVisualization:(id)a3
{
  PXHUDVisualization *v5;
  PXHUDVisualization *v6;

  v5 = (PXHUDVisualization *)a3;
  if (self->_visualization != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_visualization, a3);
    -[PXHUDVisualization setDelegate:](self->_visualization, "setDelegate:", self);
    -[PXHUDAbstractVisualizationView visualizationDidUpdate](self, "visualizationDidUpdate");
    v5 = v6;
  }

}

- (PXHUDVisualization)visualization
{
  return self->_visualization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualization, 0);
}

@end
