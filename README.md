# goprj-template

My Own Golang project template based on this [article](https://dev.to/eminetto/clean-architecture-2-years-later-4een)

## Tips

### mock generation comment

```go
//go:generate mockery --all
```

### how to write testsuite

```go
import (
	"testing"

	"github.com/stretchr/testify/suite"
)

type UsecaseTestSuite struct {
	suite.Suite
}

func (suite *UsecaseTestSuite) SetupTest() {
}

func (suite *UsecaseTestSuite) TestSomething() {
	// ...

	suite.NoError(err)
}

// TestUsecase tests the usecase.
func TestUsecase(t *testing.T) {
	suite.Run(t, new(UsecaseTestSuite))
}
```

### Routerable interface

```go
type Routable interface {
	Route(e *echo.Echo) error
}
```
