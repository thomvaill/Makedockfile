const assert = require('assert')
const MyModel = require('./MyModel')

describe('MyModel', () => {
  it('MyMethod should return true', () => {
    const myModel = new MyModel()
    assert.equal(myModel.myMethod(), true)
  })
})
